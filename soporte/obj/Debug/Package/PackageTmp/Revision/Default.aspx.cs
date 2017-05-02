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
                    DBConnect conector = new DBConnect();
                    List<string[]> lsoporte = conector.SSoportes();
                    ListItem inicio = new ListItem();
                    inicio.Text = "Seleccione";
                    inicio.Value = "0";
                    soporte.Items.Add(inicio);
                    for (int i = 0; i < lsoporte.Count; i++)
                    {
                        string[] lista = new string[2];
                        lista = lsoporte[i];
                        ListItem opcion = new ListItem();
                        opcion.Text = lista[1];
                        opcion.Value = lista[0];
                        soporte.Items.Add(opcion);
                        lista = null;
                    }
                    soporte.DataBind();
                    CargarGrid();
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
            DataTable datos = conexion.SSolicitudes();
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
                int vIDSOL = Convert.ToInt16(idsol.Value);
                string Vobservaciones = observaciones.Text;
                string Vfallasoft = falla.Text;
                int Vsoporte = Convert.ToInt16(soporte.SelectedValue);
                DBConnect conector = new DBConnect();
                conector.IRevision(vIDSOL, Vsoporte, Vfallasoft,Vobservaciones);
                Response.Redirect("insert.aspx");
            }
        } 
    }
}