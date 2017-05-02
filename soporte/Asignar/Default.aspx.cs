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

namespace soporte.Asignar
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
                        conector.IAuditoria(nombusuario, hmenu);
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
                        CargarGrid();
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
            DBConnect conexion = new DBConnect();
            DataTable datos = conexion.SSolicitudesA();
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
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
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
                DBConnect conector = new DBConnect();
                conector.IAsignaciones(soporte.SelectedValue, idsol.Value, "0");
                conector.UDocSop(idsol.Value, soporte.SelectedValue);
                Response.Redirect("insert.aspx?soporte=" + System.Web.HttpUtility.UrlEncode(soporte.SelectedItem.Text) + "&hmenu=" + vhmenu.Value);
            }
        } 

    }
}