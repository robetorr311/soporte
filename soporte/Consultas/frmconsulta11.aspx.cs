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

namespace soporte.Consultas
{
    public partial class frmconsulta11 : System.Web.UI.Page
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
                        string nombusuario = (string)this.Session["Us"];
                        conector.IAuditoria(nombusuario, hmenu);
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
        }
        private void CargarGrid()
        {
            DBConnect conexion = new DBConnect();
            DataTable datos = conexion.SAllreguladores();
            DataTable datos3 = new DataTable();
            DataTable datos4 = new DataTable();
            DataColumn columna1 = new DataColumn("Id");
            DataColumn columna2 = new DataColumn("Nombre");
            DataColumn columna3 = new DataColumn("Responsable");
            DataColumn columna4 = new DataColumn("Departamento");
            columna1.AllowDBNull = true;
            columna2.AllowDBNull = true;
            columna3.AllowDBNull = true;
            columna4.AllowDBNull = true;
            datos3.Columns.Add(columna1);
            datos3.Columns.Add(columna2);
            datos3.Columns.Add(columna3);
            datos3.Columns.Add(columna4);
            int rec = 0;
            if (datos.Rows.Count > 0)
            {
                for (rec = 0; rec < datos.Rows.Count; rec++)
                {
                    DataRow dr = datos3.NewRow();
                    dr["Id"] = datos.Rows[rec]["Id"].ToString();
                    dr["Nombre"] = datos.Rows[rec]["Nombre"].ToString(); ;
                    dr["Responsable"] = datos.Rows[rec]["Responsable"].ToString();
                    dr["Departamento"] = datos.Rows[rec]["Departamento"].ToString(); ;
                    datos3.Rows.Add(dr);
                }
                GridView1.DataSource = datos3;
                GridView1.DataBind();
            }
            else
            {
                DataColumn columna5 = new DataColumn("Id");
                DataColumn columna6 = new DataColumn("Nombre");
                DataColumn columna7 = new DataColumn("Responsable");
                DataColumn columna8 = new DataColumn("Departamento");
                columna5.AllowDBNull = true;
                columna6.AllowDBNull = true;
                columna7.AllowDBNull = true;
                columna8.AllowDBNull = true;
                datos4.Columns.Add(columna5);
                datos4.Columns.Add(columna6);
                datos4.Columns.Add(columna7);
                datos4.Columns.Add(columna8);
                DataRow dr3 = datos4.NewRow();
                dr3["Id"] = null;
                dr3["Nombre"] = null;
                dr3["Responsable"] = null;
                dr3["Departamento"] = null;
                datos4.Rows.Add(dr3);
                GridView1.DataSource = datos4;
                GridView1.DataBind();
                int TotalColumns = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                GridView1.Rows[0].Cells[0].Text = "No existen Equipos!!";
            }
        }
        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void gridView_SelectedIndex(object sender, EventArgs e)
        {
            DBConnect conexion = new DBConnect();
            string iddram = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[1].Text.ToString();
            TextBox1.Value = iddram;
        }
        protected void PDF(object sender, EventArgs e)
        {
            Response.Redirect("../Reportes/reguladorpdf.aspx?idmonitor=" + TextBox1.Value);
        }

    }
}