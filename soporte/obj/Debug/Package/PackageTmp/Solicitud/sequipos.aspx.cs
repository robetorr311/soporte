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

namespace soporte.Solicitud
{
    public partial class sequipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            departamento.Value = Server.HtmlEncode(Request.QueryString["departamento"]);
            CargarGrid();
        }
        private void CargarGrid()
        {
            DBConnect conexion = new DBConnect();
            DataTable datos = conexion.SAllequiposdep(departamento.Value);
            DataTable datos2 = conexion.SelectSwitcheDep(departamento.Value);
            DataTable datos3 = new DataTable();
            DataTable datos4 = new DataTable();
            DataColumn columna1 = new DataColumn("Id");
            DataColumn columna2 = new DataColumn("Nombre");
            columna1.AllowDBNull = true;
            columna2.AllowDBNull = true;
            datos3.Columns.Add(columna1);
            datos3.Columns.Add(columna2);
            int rec = 0;
            if (datos.Rows.Count > 0)
            {
                for (rec = 0; rec < datos.Rows.Count; rec++)
                {
                    DataRow dr = datos3.NewRow();
                    dr["Id"] = datos.Rows[rec]["Id"].ToString();
                    dr["Nombre"] = datos.Rows[rec]["Nombre"].ToString(); ;
                    datos3.Rows.Add(dr);                   
                }
                if (datos2.Rows.Count > 0)
                {
                    rec = 0;
                    for (rec = 0; rec < datos2.Rows.Count; rec++)
                    {
                        DataRow dr2 = datos3.NewRow();
                        dr2["Id"] = datos2.Rows[rec]["Id"].ToString();
                        dr2["Nombre"] = datos2.Rows[rec]["Nombre"].ToString(); ;
                        datos3.Rows.Add(dr2);
                    }
                }
                GridView1.DataSource = datos3;
                GridView1.DataBind();
            }
            else
            {
                DataColumn columna3 = new DataColumn("Id");
                DataColumn columna4 = new DataColumn("Nombre");
                columna3.AllowDBNull = true;
                columna4.AllowDBNull = true;
                datos4.Columns.Add(columna3);
                datos4.Columns.Add(columna4);
                DataRow dr3 = datos4.NewRow();
                dr3["Id"] = null;
                dr3["Nombre"] = null;
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
            string iddram = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[2].Text.ToString();
            TextBox1.Value = iddram;
            string devuelveFecha = "<script language='JavaScript'>" +
                "returnValue = document.getElementById('TextBox1').value;" +
                "close();</script>";

            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);

        }
    }
}