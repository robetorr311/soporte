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
    public partial class FrmSoporte : System.Web.UI.Page
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
                        Button1.Visible = false;
                        FillCustomerInGrid();
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
        private void FillCustomerInGrid()
        {
            DBConnect conector = new DBConnect();
            DataTable datos = conector.SSoportes();
            if (datos.Rows.Count > 0)
            {
                GridView1.DataSource = datos;
                GridView1.DataBind();
            }
            else
            {
                datos.Rows.Add(datos.NewRow());
                GridView1.DataSource = datos;
                GridView1.DataBind();
                int TotalColumns = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                GridView1.Rows[0].Cells[0].Text = "No Record Found";
            }
        }
        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            FillCustomerInGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void gridView_SelectedIndex(object sender, EventArgs e)
        {
            string id = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[2].Text.ToString();
            string nombre = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[3].Text.ToString();
            string husuario = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[4].Text.ToString();
            string estatus = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[5].Text.ToString();
            vhsoporte.Value = id;
            vnombre.Value = nombre;
            vhusuario.Value = husuario;
            vestatus.Value = estatus;
            Button1.Visible = true;
            Label1.Text = "";
        }
        protected void gridView_DeletedIndex(object sender, GridViewDeleteEventArgs e)
        {
                DBConnect conector = new DBConnect();
                string sql = "";
                if (vhsoporte.Value == "")
                {
                    sql = "Seleccione la fila para poder eliminar el registro;";
                    Label1.Text = sql;
                }
                else
                {
                    conector.Dsoporte(vhsoporte.Value);
                    FillCustomerInGrid();
                    Label1.Text = "";
                    vhsoporte.Value = "";
                }
        }
        protected void Formulario(object sender, EventArgs e)
        {
            string sql = "";        
            if (vhsoporte.Value == "")
            {
                sql = "Seleccione la fila para poder modificar el registro;";
                Label1.Text = sql;
            }
            else
            {
                Label1.Text = "";
                EditaSoporte.VerSoportes(this.Page, vhsoporte.Value, vnombre.Value, vhusuario.Value, vestatus.Value);
            }
        }
    }
}