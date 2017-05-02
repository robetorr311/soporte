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
    public partial class frmCPU : System.Web.UI.Page
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
            DataTable datos = conector.SEditequipos();
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
                GridView1.Rows[0].Cells[0].Text = "No se encontraron registros";
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
            Label LblID = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].FindControl("LblID") as Label;
            Label Lblnombre = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].FindControl("Lblnombre") as Label;
            Label Lblresponsable = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].FindControl("Lblresponsable") as Label;
            Label Lbldepartamento = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].FindControl("Lbldepartamento") as Label;
            ImageButton ImageButton1 = (ImageButton)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("ImageButton1");
            ImageButton ImageButton2 = (ImageButton)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("ImageButton2");
            ImageButton1.Enabled = true;
            ImageButton2.Enabled = true;           
            vhidequipo.Value = LblID.Text;
            vnombre.Value = Lblnombre.Text;
            vresponsable.Value = Lblresponsable.Text;
            vdepartamento.Value = Lbldepartamento.Text;
            string modal = "showPopWin('frmEditaEquipos.aspx?id=" + vhidequipo.Value + "', 900, 450, null);";
            Button1.Attributes.Add("onclick", modal);
            Button1.Visible = true;
            Label1.Text = "";
        }
        protected void gridView_DeletedIndex(object sender, GridViewDeleteEventArgs e)
        {
            DBConnect conector = new DBConnect();
            string sql = "";
            if (vhidequipo.Value == "")
            {
                sql = "Seleccione la fila para poder eliminar el registro;";
                Label1.Text = sql;
            }
            else
            {
                //conector.Dsoporte(vhsoporte.Value);
                FillCustomerInGrid();
                Label1.Text = "";
                vhidequipo.Value = "";
            }
        }
        protected void Formulario(object sender, EventArgs e)
        {

            string devuelveFecha = "showPopWin('frmEditaEquipos.aspx?id="+ vhidequipo.Value + "', 900, 450, null);";
            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);

        }
        protected string acentos(string cadena)
        {
            string valora = cadena.Replace("&#225;", "á");
            string valorA = valora.Replace("&#193;", "Á");
            string valore = valorA.Replace("&#233;", "é");
            string valorE = valore.Replace("&#201;", "É");
            string valori = valorE.Replace("&#237;", "í");
            string valorI = valori.Replace("&#205;", "Í");
            string valoro = valorI.Replace("&#243;", "ó");
            string valorO = valoro.Replace("&#211;", "Ó");
            string valoru = valorO.Replace("&#250;", "ú");
            string valorU = valoru.Replace("&#218;", "Ú");
            return valorU;
        }
        protected void Editar(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillCustomerInGrid();
            Label Lbldepartamento = (Label)GridView1.Rows[e.NewEditIndex].Cells[7].FindControl("Lbldepartamento");
            string seleccion = Lbldepartamento.Text;
            Lbldepartamento.Visible = false;
            DropDownList departamento = (DropDownList)GridView1.Rows[e.NewEditIndex].Cells[7].FindControl("departamento");
            DBConnect conector = new DBConnect();
            DataTable listado = conector.SAllDepartamentos();
            ListItem opciond = new ListItem();
            opciond.Text = seleccion;
            opciond.Value = conector.Buscahdepartamento(seleccion);
            departamento.Items.Add(opciond);
            for (int i = 0; i < listado.Rows.Count; i++)
            {
                ListItem opcion = new ListItem();
                opcion.Text = listado.Rows[i]["nombre"].ToString();
                opcion.Value = listado.Rows[i]["id"].ToString();
                departamento.Items.Add(opcion);
            }
            departamento.DataBind();
            departamento.SelectedItem.Text = seleccion;
        }
        protected void Cancelar(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillCustomerInGrid();
        }
        protected void Borrar(object sender, GridViewDeleteEventArgs e)
        {
            Label LblID = (Label)GridView1.Rows[e.RowIndex].FindControl("LblID");
            DBConnect conector = new DBConnect();
            if (conector.EquipoDocumento(LblID.Text) > 0)
            {
                Label1.CssClass = "alerta";
                Label1.Text = "No es posible eliminar este equipo debido a que ya existen solicitudes de servicio relacionadas con el!!";
            }
            else
            {
                conector.DDispositivo(LblID.Text, "7");
                conector.DDispositivo(LblID.Text, "8");
                conector.DDispositivo(LblID.Text, "9");
                conector.DDispositivo(LblID.Text, "10");
                conector.DDispositivo(LblID.Text, "11");
                conector.DDispositivo(LblID.Text, "12");
                conector.DDispositivo(LblID.Text, "14");
                conector.DDispositivo(LblID.Text, "16");
                conector.Dequipo(LblID.Text);
            }
            GridView1.EditIndex = -1;
            FillCustomerInGrid();
        }
        protected void upd(object sender, GridViewUpdateEventArgs e)
        {
            DBConnect conector = new DBConnect();
            Label LblID = (Label)GridView1.Rows[e.RowIndex].FindControl("LblID");
            TextBox TBXserial = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXserial");
            TextBox TBXnumero = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXnumero");
            TextBox TBXmarca = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXmarca");
            TextBox TBXnombre = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXnombre");
            TextBox TBXresponsable = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXresponsable");
            DropDownList departamento = (DropDownList)GridView1.Rows[e.RowIndex].Cells[7].FindControl("departamento");
            conector.UEquipos(LblID.Text, 
                               TBXserial.Text, 
                                TBXmarca.Text,
                                TBXnumero.Text,
                                TBXnombre.Text,
                                TBXresponsable.Text,
                                departamento.SelectedValue);
            conector.UEquipoDocumento(LblID.Text, TBXnombre.Text);
            GridView1.EditIndex = -1;
            FillCustomerInGrid();
        }
        protected void Guardar(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Add"))
            {
                DBConnect conector = new DBConnect();
                FillCustomerInGrid();
            }
        }
    }
}