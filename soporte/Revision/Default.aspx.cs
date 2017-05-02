using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Text;

namespace soporte.Revision
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string menu = Server.HtmlEncode(Request.QueryString["menu"]);
                if (menu == "1")
                {
                    if (Session["Session"] != null)
                    {
                        DBConnect conector = new DBConnect();
                        string hmenu = Server.HtmlEncode(Request.QueryString["hmenu"]);
                        vhmenu.Value = hmenu;
                        string nombusuario = (string)this.Session["Us"];
                        string nombre = (string)this.Session["Nbr"];
                        string nivel = (string)this.Session["Nvl"];
                        conector.IAuditoria(nombusuario, hmenu);
                        if (nivel == "2")
                        {
                            if (conector.SSNv2(nombusuario) > 0)
                            {
                                Button2.Visible = true;
                                Button3.Visible = false;
                                DataTable usuariosoporte = conector.SUsuariosSoporte(nombusuario);
                                ListItem inicio = new ListItem();
                                inicio.Text = "Seleccione";
                                inicio.Value = "0";
                                soporte2.Items.Add(inicio);
                                for (int i = 0; i < usuariosoporte.Rows.Count; i++)
                                {
                                    ListItem opcion = new ListItem();
                                    opcion.Text = usuariosoporte.Rows[i]["nombre"].ToString();
                                    opcion.Value = usuariosoporte.Rows[i]["idsoporte"].ToString();
                                    soporte2.Items.Add(opcion);
                                }
                                soporte2.DataBind();
                                CargarGrid2();
                                soporte.Visible = false;
                                soporte2.Visible = true;
                                RequiredFieldValidator1.Enabled = false;
                                RequiredFieldValidator2.Enabled = true;
                                GridView1.Visible = false;
                                GridView2.Visible = true;
                                Button2.Visible = false;
                                Button3.Visible = true;
                            }
                            else
                            {
                                Button2.Visible = false;
                                Button3.Visible = false;
                                DataTable usuariosoporte = conector.SUsuariosSoporte(nombusuario);
                                ListItem inicio = new ListItem();
                                inicio.Text = "Seleccione";
                                inicio.Value = "0";
                                soporte.Items.Add(inicio);
                                for (int i = 0; i < usuariosoporte.Rows.Count; i++)
                                {
                                    ListItem opcion = new ListItem();
                                    opcion.Text = usuariosoporte.Rows[i]["nombre"].ToString();
                                    opcion.Value = usuariosoporte.Rows[i]["idsoporte"].ToString();
                                    soporte.Items.Add(opcion);
                                }
                                soporte.DataBind(); 
                                soporte.Visible = true;
                                soporte2.Visible = false;
                                RequiredFieldValidator1.Enabled = true;
                                RequiredFieldValidator2.Enabled = false;
                                CargarGrid();
                                GridView1.Visible = true;
                                GridView2.Visible = false;
                                Button2.Visible = false;
                                Button3.Visible = false;
                            }
                        }
                        else
                        {
                            Button2.Visible = false;
                            Button3.Visible = false;
                            DataTable lsoporte = conector.SSoportes();
                            ListItem inicio = new ListItem();
                            inicio.Text = "Seleccione";
                            inicio.Value = "0";
                            soporte.Items.Add(inicio);
                            for (int i = 0; i < lsoporte.Rows.Count; i++)
                            {
                                ListItem opcion = new ListItem();
                                opcion.Text = lsoporte.Rows[i]["nombre"].ToString();
                                opcion.Value = lsoporte.Rows[i]["id"].ToString();
                                soporte.Items.Add(opcion);
                            }
                            soporte.DataBind();
                            soporte.Visible = true;
                            soporte2.Visible = false;
                            RequiredFieldValidator1.Enabled = true;
                            RequiredFieldValidator2.Enabled = false;
                            CargarGrid();
                            GridView1.Visible = true;
                            GridView2.Visible = false;
                        }
                    }
                    else
                    {
                        string devuelveFecha = "<script language='JavaScript'>" +
                            "window.document.forms[0].target = '_parent'; window.document.forms[0].action = '../salida.aspx';" +
                            "window.document.forms[0].submit(); </script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "CambiaTarget", devuelveFecha);         
                    }
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
            }
            DateTime dt = DateTime.Now;
            int d = dt.Day;
            int m = dt.Month;
            int y = dt.Year;
            string dia;
            string mes;
            if (d < 10)
            {
                dia = "0" + Convert.ToString(d);
            }
            else
            {
                dia = Convert.ToString(d);
            }
            if (m < 10)
            {
                mes = "0" + Convert.ToString(m);
            }
            else
            {
                mes = Convert.ToString(m);
            }
            lblfecha.Text = dia + "/" + mes + "/" + y;

        }
        private void CargarGrid()
        {
            if (Session["Session"] != null)
            {
                string nombusuario = (string)this.Session["Us"];
                string nombre = (string)this.Session["Nbr"];
                string nivel = (string)this.Session["Nvl"];
                DBConnect conexion = new DBConnect();
                DataTable datos = new DataTable();
                if (nivel == "2")
                {
                    datos = conexion.SSolicitudesA();
                }
                else
                {
                    datos = conexion.SSolicitudes();
                }
                if (datos.Rows.Count > 0)
                {
                    GridView1.DataSource = datos;
                    GridView1.DataBind();
                    GridView1.SelectedIndex = 0;
                }
                else
                {
                    DataTable datos2 = new DataTable();
                    DataColumn columna1 = new DataColumn("Id");
                    DataColumn columna2 = new DataColumn("Fecha");
                    DataColumn columna3 = new DataColumn("Departamento");
                    DataColumn columna4 = new DataColumn("Solicitante");
                    columna1.AllowDBNull = true;
                    columna2.AllowDBNull = true;
                    columna3.AllowDBNull = true;
                    columna4.AllowDBNull = true;
                    datos2.Columns.Add(columna1);
                    datos2.Columns.Add(columna2);
                    datos2.Columns.Add(columna3);
                    datos2.Columns.Add(columna4);
                    DataRow dr = datos2.NewRow();
                    dr["Id"] = null;
                    dr["Fecha"] = null;
                    dr["Departamento"] = null;
                    dr["Solicitante"] = null;
                    datos2.Rows.Add(dr);
                    GridView1.DataSource = datos2;
                    GridView1.DataBind();
                    int TotalColumns = GridView1.Rows[0].Cells.Count;
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell());
                    GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                    GridView1.Rows[0].Cells[0].Text = "No existen solicitudes pendientes!!";
                    idsol.Value = "0";
                }
                GridView1.Visible = true;
                GridView2.Visible = false;

            }
            else
            {
                string devuelveFecha = "<script language='JavaScript'>" +
                    "window.document.forms[0].target = '_parent'; window.document.forms[0].action = '../salida.aspx';" +
                    "window.document.forms[0].submit(); </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "CambiaTarget", devuelveFecha);         
            }
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
            GridView1.Visible = true;
            GridView2.Visible = false;
        }
        protected void selecc(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            if (idsol.Value == "0")
            {
                Label1.Text = "No Existen solicitudes pendientes!!";
            }
            else
            {
                idsol.Value = row.Cells[1].Text;
            }
            vhsoporte.Value = soporte.SelectedValue;
        }
        protected void selecc2(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            if (idsol.Value == "0")
            {
                Label1.Text = "No Existen solicitudes pendientes!!";
            }
            else
            {
                idsol.Value = row.Cells[1].Text;
            }
            vhsoporte.Value = soporte2.SelectedValue;
        }
        protected void Guardar(object sender, EventArgs e)
        {
            if ((idsol.Value == "") || (idsol.Value == "0"))
            {
                if (idsol.Value == "")
                {
                    Label1.Text = "Debe Seleccionar una solicitud!!";
                }
                if (idsol.Value == "0")
                {
                    Label1.Text = "No Existen solicitudes pendientes!!";
                }
            }
            else
            {
                int vIDSOL = Convert.ToInt16(idsol.Value);
                string Vobservaciones = observaciones.Text;
                string Vfallasoft = falla.Text;
                int Vsoporte = Convert.ToInt16(vhsoporte.Value);
                DBConnect conector = new DBConnect();
                conector.IRevision(vIDSOL, Vsoporte, Vfallasoft,Vobservaciones);
                conector.Uasignadas(vhsoporte.Value, idsol.Value, "1");
                Response.Redirect("insert.aspx?hmenu=" + vhmenu.Value);

            }
        }
        protected void Pendiente(object sender, EventArgs e)
        {
            RequiredFieldValidator2.Enabled = false;
            CargarGrid2();
            GridView1.Visible = false;
            GridView2.Visible = true;
            Button2.Visible = false;
            Button3.Visible = true;
        }
        protected void Todos(object sender, EventArgs e)
        {
            RequiredFieldValidator2.Enabled = true;
            CargarGrid();
            GridView1.Visible = true;
            GridView2.Visible = false;
            Button2.Visible = true;
            Button3.Visible = false;
        }
        private void CargarGrid2()
        {
            if (Session["Session"] != null)
            {
                string nombusuario = (string)this.Session["Us"];
                string nombre = (string)this.Session["Nbr"];
                string nivel = (string)this.Session["Nvl"];
                DBConnect conexion = new DBConnect();
                DataTable datos = new DataTable();
                datos = conexion.SSolicNiv2(nombusuario);
                if (datos.Rows.Count > 0)
                {
                    GridView2.DataSource = datos;
                    GridView2.DataBind();
                    GridView2.SelectedIndex = 0;
                }
                else
                {
                    DataTable datos2 = new DataTable();
                    DataColumn columna1 = new DataColumn("Id");
                    DataColumn columna2 = new DataColumn("Fecha");
                    DataColumn columna3 = new DataColumn("Departamento");
                    DataColumn columna4 = new DataColumn("Solicitante");
                    columna1.AllowDBNull = true;
                    columna2.AllowDBNull = true;
                    columna3.AllowDBNull = true;
                    columna4.AllowDBNull = true;
                    datos2.Columns.Add(columna1);
                    datos2.Columns.Add(columna2);
                    datos2.Columns.Add(columna3);
                    datos2.Columns.Add(columna4);
                    DataRow dr = datos2.NewRow();
                    dr["Id"] = null;
                    dr["Fecha"] = null;
                    dr["Departamento"] = null;
                    dr["Solicitante"] = null;
                    datos2.Rows.Add(dr);
                    GridView2.DataSource = datos2;
                    GridView2.DataBind();
                    int TotalColumns = GridView1.Rows[0].Cells.Count;
                    GridView2.Rows[0].Cells.Clear();
                    GridView2.Rows[0].Cells.Add(new TableCell());
                    GridView2.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                    GridView2.Rows[0].Cells[0].Text = "No existen solicitudes pendientes!!";
                    idsol.Value = "0";
                }
                GridView1.Visible = false;
                GridView2.Visible = true;
            }
            else
            {
                string devuelveFecha = "<script language='JavaScript'>" +
                    "window.document.forms[0].target = '_parent'; window.document.forms[0].action = '../salida.aspx';" +
                    "window.document.forms[0].submit(); </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "CambiaTarget", devuelveFecha);
            }
        }

        protected void gridView_PageIndexChanging2(object sender, GridViewPageEventArgs e)
        {
            CargarGrid2();
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
            GridView1.Visible = false;
            GridView2.Visible = true;
        }
        protected void gridView_SelectedIndex(object sender, EventArgs e)
        {
            DBConnect conexion = new DBConnect();
            string iddram = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[1].Text.ToString();
            idsol.Value = iddram;
        }
        protected void gridView_SelectedIndex2(object sender, EventArgs e)
        {
            DBConnect conexion = new DBConnect();
            string iddram = GridView2.Rows[Convert.ToInt32(GridView2.SelectedIndex.ToString())].Cells[1].Text.ToString();
            idsol.Value = iddram;
        }
    }
}