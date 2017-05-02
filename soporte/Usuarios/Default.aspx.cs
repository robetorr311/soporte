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

namespace soporte.Usuarios
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
                            DataTable listado = conector.SNiveles();
                            ListItem opciond = new ListItem();
                            opciond.Text = "Seleccione";
                            opciond.Value = "0";
                            nivel.Items.Add(opciond);
                            for (int i = 0; i < listado.Rows.Count; i++)
                            {
                                ListItem opcion = new ListItem();
                                opcion.Text = listado.Rows[i]["nombre"].ToString();
                                opcion.Value = listado.Rows[i]["id"].ToString();
                                nivel.Items.Add(opcion);
                            }
                            nivel.DataBind();
                            DataTable listado2 = conector.SAllDepartamentos();
                            ListItem opciond2 = new ListItem();
                            opciond2.Text = "Seleccione";
                            opciond2.Value = "0";
                            departamento.Items.Add(opciond2);
                            for (int i = 0; i < listado2.Rows.Count; i++)
                            {
                                ListItem opcion2 = new ListItem();
                                opcion2.Text = listado2.Rows[i]["nombre"].ToString();
                                opcion2.Value = listado2.Rows[i]["id"].ToString();
                                departamento.Items.Add(opcion2);
                            }
                            departamento.DataBind();
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
        protected void Guardar(object sender, EventArgs e)
        {
            DBConnect conector = new DBConnect();
            if (nivel.SelectedValue == "2")
            {
                conector.IUsuario(TextBox1.Text, TextBox2.Text, TextBox3.Text, "6", nivel.SelectedValue, departamento.SelectedValue);
            }
            else
            {
                conector.IUsuario(TextBox1.Text, TextBox2.Text, TextBox3.Text, "5", nivel.SelectedValue, departamento.SelectedValue);
            }
            Response.Redirect("insert.aspx?hmenu=" + vhmenu.Value);
        }
        private void FillCustomerInGrid()
        {
            DBConnect conector = new DBConnect();
            DataTable datos = conector.Svistausuarios();
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
            ImageButton ImageButton1 = (ImageButton)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("ImageButton1");
            ImageButton ImageButton2 = (ImageButton)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("ImageButton2");
            ImageButton1.Enabled = true;
            ImageButton2.Enabled = true;
            HiddenField1.Value = LblID.Text;
        }
        protected void gridView_DeletedIndex(object sender, GridViewDeleteEventArgs e)
        {
            DBConnect conector = new DBConnect();
            string sql = "";
            if (HiddenField1.Value == "")
            {
                sql = "Seleccione la fila para poder eliminar el registro;";
                Label2.Text = sql;
            }
            else
            {
                conector.dusuario(HiddenField1.Value);
                FillCustomerInGrid();
                Label1.Text = "";
                HiddenField1.Value = "";
            }
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
            Label Lblestatus = (Label)GridView1.Rows[e.NewEditIndex].Cells[4].FindControl("Lblestatus");
            Label Lblnivel = (Label)GridView1.Rows[e.NewEditIndex].Cells[5].FindControl("Lblnivel");
            Label Lbldepartamento = (Label)GridView1.Rows[e.NewEditIndex].Cells[6].FindControl("Lbldepartamento");
            
            string seleccion = Lblestatus.Text;
            string estat = "";
            if (seleccion == "Activa")
            {
                estat = "5";
            }
            if (seleccion == "Inactiva")
            {
                estat = "6";
            }
            Lblestatus.Visible = false;
            DropDownList DDGestatus = (DropDownList)GridView1.Rows[e.NewEditIndex].Cells[4].FindControl("DDGestatus");
            DropDownList DDGnivel = (DropDownList)GridView1.Rows[e.NewEditIndex].Cells[4].FindControl("DDGnivel");
            DropDownList DDGdepartamento = (DropDownList)GridView1.Rows[e.NewEditIndex].Cells[4].FindControl("DDGdepartamento");
            DBConnect conector = new DBConnect();
            DataTable listado = conector.SestatusUsu();
            ListItem opciond = new ListItem();
            opciond.Text = seleccion;
            opciond.Value = estat;
            DDGestatus.Items.Add(opciond);
            for (int i = 0; i < listado.Rows.Count; i++)
            {
                ListItem opcion = new ListItem();
                opcion.Text = listado.Rows[i]["nombre"].ToString();
                opcion.Value = listado.Rows[i]["id"].ToString();
                DDGestatus.Items.Add(opcion);
            }
            DDGestatus.DataBind();
            DataTable listado2 = conector.SAllDepartamentos();
            ListItem opciondep = new ListItem();
            opciondep.Text = Lbldepartamento.Text;
            opciondep.Value = conector.Buscahdepartamento(Lbldepartamento.Text);
            DDGdepartamento.Items.Add(opciondep);
            for (int i = 0; i < listado2.Rows.Count; i++)
            {
                ListItem opciondep2 = new ListItem();
                opciondep2.Text = listado2.Rows[i]["nombre"].ToString();
                opciondep2.Value = listado2.Rows[i]["id"].ToString();
                DDGdepartamento.Items.Add(opciondep2);
            }
            DDGdepartamento.DataBind();
            DataTable listado3 = conector.SNiveles();
            ListItem opcionniv = new ListItem();
            opcionniv.Text = Lblnivel.Text;
            opcionniv.Value = conector.Buscahnivel(Lblnivel.Text);
            DDGnivel.Items.Add(opcionniv);
            for (int i = 0; i < listado2.Rows.Count; i++)
            {
                ListItem opcionniv2 = new ListItem();
                opcionniv2.Text = listado2.Rows[i]["nombre"].ToString();
                opcionniv2.Value = listado2.Rows[i]["id"].ToString();
                DDGnivel.Items.Add(opcionniv2);
            }
            DDGnivel.DataBind();
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
            conector.dusuario(LblID.Text);
            FillCustomerInGrid();
        }
        protected void upd(object sender, GridViewUpdateEventArgs e)
        {
            DBConnect conector = new DBConnect();
            Label LblID = (Label)GridView1.Rows[e.RowIndex].FindControl("LblID");
            TextBox TBXloggin = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXloggin");
            TextBox TBXpassword = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXpassword");
            TextBox TBXnombre = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXnombre");
            DropDownList DDGestatus = (DropDownList)GridView1.Rows[e.RowIndex].Cells[5].FindControl("DDGestatus");
            DropDownList DDGnivel = (DropDownList)GridView1.Rows[e.RowIndex].Cells[6].FindControl("DDGnivel");
            DropDownList DDGdepartamento = (DropDownList)GridView1.Rows[e.RowIndex].Cells[7].FindControl("DDGdepartamento");
            //(DropDownList)GridView1.Rows[e.RowIndex].Cells[7].FindControl("departamento");
            string sql=conector.Uusuario(LblID.Text,
                              TBXloggin.Text,
                              TBXpassword.Text,
                              TBXnombre.Text,
                              DDGestatus.SelectedValue,
                              DDGnivel.SelectedValue,
                              DDGdepartamento.SelectedValue);
            GridView1.EditIndex = -1;
            FillCustomerInGrid();
        }
        protected void Save(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Registro"))
            {

            }
            if (e.CommandName.Equals("Add"))
            {
                DBConnect conector = new DBConnect();
                FillCustomerInGrid();
            }
        }
 
    }
}
