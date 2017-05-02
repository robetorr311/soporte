using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace soporte.Consultas
{
    public partial class frmconsulta7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string menu = Server.HtmlEncode(Request.QueryString["menu"]);
                if (menu == "1")
                {
                    ImageButton2.Visible = false;
                    string nombusuario2 = System.Configuration.ConfigurationManager.AppSettings["Us"];
                    string nombre2 = System.Configuration.ConfigurationManager.AppSettings["Nbr"];
                    string nivel2 = System.Configuration.ConfigurationManager.AppSettings["Nvl"];
                    if (nivel2 == "3")
                    {
                        CargarGridUsuario(nombre2);
                    }
                    else
                    {
                        CargarGrid();
                    }
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
            }
        }
        protected void gridView_SelectedIndex(object sender, EventArgs e)
        {
            ImageButton2.Visible = true;
        }
        private void CargarGridUsuario(string usuario)
        {
            DBConnect conexion = new DBConnect();
            DataTable datos = conexion.SUsuSol(usuario);
            if (datos.Rows.Count > 0)
            {
                GridView1.DataSource = datos;
                GridView1.DataBind();
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
            }
        }
        private void CargarGrid()
        {
            DBConnect conexion = new DBConnect();
            DataTable datos = conexion.SSol();
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
            }
        }
        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            string nombusuario2 = System.Configuration.ConfigurationManager.AppSettings["Us"];
            string nombre2 = System.Configuration.ConfigurationManager.AppSettings["Nbr"];
            string nivel2 = System.Configuration.ConfigurationManager.AppSettings["Nvl"];
            if (nivel2 == "3")
            {
                CargarGridUsuario(nombre2);
            }
            else
            {
                CargarGrid();
            }
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void PDF(object sender, EventArgs e)
        {
            GridViewRow rowselecc = GridView1.SelectedRow;
            string estatus = rowselecc.Cells[6].Text;
            if (estatus == "Pendiente")
            {
                MisReportes.verSolicitud(this, "Hidden1", rowselecc.Cells[1].Text);
            }
            if (estatus == "Reparado/Culminado")
            {
                MisReportes.verRespuesta(this, "Hidden1", rowselecc.Cells[1].Text);
            }
            if (estatus == "En Revision")
            {
                DBConnect conexion = new DBConnect();
                DataTable datos = conexion.EnRevision(rowselecc.Cells[1].Text);
                string falla = datos.Rows[0]["falla"].ToString();
                string observaciones = datos.Rows[0]["observaciones"].ToString();
                MiMensaje.verEnRevision(this, "Hidden1", falla, observaciones);
                //MisReportes.verRespuesta(this, "Hidden1", rowselecc.Cells[1].Text);
            }
        }
    }
}