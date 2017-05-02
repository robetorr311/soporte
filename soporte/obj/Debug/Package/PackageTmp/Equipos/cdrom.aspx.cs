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

namespace soporte.Equipos
{
    public partial class cdrom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ide = Server.HtmlEncode(Request.QueryString["idequipo"]);
            idequipo.Value = ide;
            DBConnect conexion = new DBConnect();
            string idram = ide + Convert.ToString(conexion.IDram(ide, "16"));
            idmdisco.Value = idram;
            CargarGrid(idequipo.Value, "16");
            Label1.Text = "Número de Disco Duros: " + Convert.ToString(GridView1.Rows.Count);
            HiddenField1.Value = Convert.ToString(conexion.IDram(ide, "16"));
            if (GridView1.Rows.Count > 1)
            {
                TextBox1.Enabled = false;
                TextBox2.Enabled = false;
                TextBox3.Enabled = false;
                Button1.Enabled = false;
            }
            else
            {
                TextBox1.Enabled = true;
                TextBox2.Enabled = true;
                TextBox3.Enabled = true;
                Button1.Enabled = true;
            }
        }
        private void CargarGrid(string hequipo, string htipo)
        {
            DBConnect conexion = new DBConnect();
            DataTable datos = conexion.Stemporal(hequipo, "16");
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
                DataColumn columna2 = new DataColumn("Serial");
                DataColumn columna3 = new DataColumn("Marca");
                DataColumn columna4 = new DataColumn("Numero");
                DataColumn columna5 = new DataColumn("Capacidad");
                columna1.AllowDBNull = true;
                columna2.AllowDBNull = true;
                columna3.AllowDBNull = true;
                columna4.AllowDBNull = true;
                columna5.AllowDBNull = true;
                datos2.Columns.Add(columna1);
                datos2.Columns.Add(columna2);
                datos2.Columns.Add(columna3);
                datos2.Columns.Add(columna4);
                datos2.Columns.Add(columna5);
                DataRow dr = datos2.NewRow();
                dr["Id"] = null;
                dr["Serial"] = null;
                dr["Marca"] = null;
                dr["Numero"] = null;
                dr["Capacidad"] = null;
                datos2.Rows.Add(dr);
                GridView1.DataSource = datos2;
                GridView1.DataBind();
                int TotalColumns = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                GridView1.Rows[0].Cells[0].Text = "No existen Discos!!";
            }
        }
        protected void Guardar(object sender, EventArgs e)
        {
            DBConnect conector = new DBConnect();
            string serial = TextBox1.Text;
            string marca = TextBox2.Text;
            string numero = TextBox3.Text;
            string heq = idequipo.Value;
            string key = idmdisco.Value;
            string htdisp = "0";
            string cap = "";
            conector.ITemporal(key, serial, marca, numero, htdisp, cap, "16", heq);
            CargarGrid(idequipo.Value, "16");
            Response.Redirect("cdrom.aspx?idequipo=" + System.Web.HttpUtility.UrlEncode(idequipo.Value));
        }
        protected void Cerrar(object sender, EventArgs e)
        {
            string devuelveFecha = "<script language='JavaScript'>" +
                "returnValue = document.getElementById('HiddenField1').value;" +
                "close();</script>";

            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
        }
        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrid(idequipo.Value, "16");
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DBConnect conexion = new DBConnect();
            string iddram = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[2].Text.ToString();
            conexion.Dtemporal(iddram);
            Response.Redirect("cdrom.aspx?idequipo=" + System.Web.HttpUtility.UrlEncode(idequipo.Value));
        }
    }
}
