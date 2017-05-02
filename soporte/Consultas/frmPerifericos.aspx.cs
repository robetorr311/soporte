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
    public partial class frmPerifericos : System.Web.UI.Page
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
                        DataTable listado2 = conector.Sperifericos();
                        ListItem opciont = new ListItem();
                        opciont.Text = "Seleccione";
                        opciont.Value = "0";
                        tipo.Items.Add(opciont);
                        for (int i = 0; i < listado2.Rows.Count; i++)
                        {
                            ListItem opciont2 = new ListItem();
                            opciont2.Text = listado2.Rows[i]["nombre"].ToString();
                            opciont2.Value = listado2.Rows[i]["id"].ToString();
                            tipo.Items.Add(opciont2);
                        }
                        tipo.DataBind(); 
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
            DataTable datos = new DataTable();
            DataColumn columna1 = new DataColumn("Id");
            DataColumn columna2 = new DataColumn("Serial");
            DataColumn columna3 = new DataColumn("Marca");
            DataColumn columna4 = new DataColumn("Numero");
            DataColumn columna5 = new DataColumn("Nombre");
            DataColumn columna6 = new DataColumn("Responsable");
            DataColumn columna7 = new DataColumn("Departamento");
            DataColumn columna8 = new DataColumn("Modelo");
            DataColumn columna9 = new DataColumn("Tipo");
            columna1.AllowDBNull = true;
            columna2.AllowDBNull = true;
            columna3.AllowDBNull = true;
            columna4.AllowDBNull = true;
            columna5.AllowDBNull = true;
            columna6.AllowDBNull = true;
            columna7.AllowDBNull = true;
            columna8.AllowDBNull = true;
            columna9.AllowDBNull = true; 
            datos.Columns.Add(columna1);
            datos.Columns.Add(columna2);
            datos.Columns.Add(columna3);
            datos.Columns.Add(columna4);
            datos.Columns.Add(columna5);
            datos.Columns.Add(columna6);
            datos.Columns.Add(columna7);
            datos.Columns.Add(columna8);
            datos.Columns.Add(columna9);
            datos.Rows.Add(datos.NewRow());
            GridView1.DataSource = datos;
            GridView1.DataBind();
            int TotalColumns = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
            GridView1.Rows[0].Cells[0].Text = "Seleccione un periferico del combo!!";
        }
        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridPerifericos(tipo.SelectedValue);
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
            ImageButton ImageButton7 = (ImageButton)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("ImageButton7");
            ImageButton1.Enabled = true;
            ImageButton2.Enabled = true;
            ImageButton7.Enabled = true;
            vhidequipo.Value = LblID.Text;
            vnombre.Value = Lblnombre.Text;
            vresponsable.Value = Lblresponsable.Text;
            DBConnect conector = new DBConnect();
            htperiferico.Value = conector.Htperiferico(LblID.Text, tipo.SelectedValue);
            vdepartamento.Value = conector.Hdepartamento(LblID.Text, tipo.SelectedValue);
            tipo.Enabled = false;
            Label1.Text = "";
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
            GridPerifericos(tipo.SelectedValue);
            Label Lbldepartamento = (Label)GridView1.Rows[e.NewEditIndex].Cells[7].FindControl("Lbldepartamento");
            Label Lbltipo = (Label)GridView1.Rows[e.NewEditIndex].Cells[7].FindControl("Lbltipo");
            string seleccion = Lbldepartamento.Text;
            string selecciont = Lbltipo.Text;
            Lbldepartamento.Visible = false;
            Lbltipo.Visible = false;
            DropDownList departamento = (DropDownList)GridView1.Rows[e.NewEditIndex].Cells[7].FindControl("departamento");
            DropDownList DGtipo = (DropDownList)GridView1.Rows[e.NewEditIndex].Cells[7].FindControl("DGtipo");
            DBConnect conector = new DBConnect();
            DataTable listado = conector.SAllDepartamentos();
            ListItem opciond = new ListItem();
            opciond.Text = "Seleccione";
            opciond.Value = "0";
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
            departamento.SelectedItem.Value = vdepartamento.Value;
            DataTable listadot = conector.Shtdisp(tipo.SelectedValue);
            ListItem opciondt = new ListItem();
            opciondt.Text = "Seleccione";
            opciondt.Value = "0";
            DGtipo.Items.Add(opciondt);
            for (int it = 0; it < listadot.Rows.Count; it++)
            {
                ListItem opcion = new ListItem();
                opcion.Text = listadot.Rows[it]["nombre"].ToString();
                opcion.Value = listadot.Rows[it]["id"].ToString();
                DGtipo.Items.Add(opcion);
            }
            DGtipo.DataBind();
            DGtipo.SelectedItem.Text = selecciont;
            DGtipo.SelectedItem.Value = htperiferico.Value;
        }
        protected void Cancelar(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridPerifericos(tipo.SelectedValue);
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
                conector.DPerifericos(LblID.Text, tipo.SelectedValue);
            }
            GridView1.EditIndex = -1;
            GridPerifericos(tipo.SelectedValue);
            tipo.Enabled = true;
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
            TextBox TBXmodelo = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXmodelo");
            DropDownList DGtipo = (DropDownList)GridView1.Rows[e.RowIndex].Cells[7].FindControl("DGtipo");
            conector.UPerifericos(LblID.Text,
                               TBXserial.Text,
                                TBXmarca.Text,
                                TBXnumero.Text,
                                TBXnombre.Text,
                                TBXresponsable.Text,
                                departamento.SelectedValue,
                                TBXmodelo.Text,
                                DGtipo.SelectedValue,
                                tipo.SelectedValue);
            conector.UEquipoDocumento(LblID.Text, TBXnombre.Text);
            GridView1.EditIndex = -1;
            GridPerifericos(tipo.SelectedValue);
            tipo.Enabled = true;
        }
        protected void Guardar(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Add"))
            {
                DBConnect conector = new DBConnect();
                GridPerifericos(tipo.SelectedValue);
            }
            if (e.CommandName.Equals("Desincorpora"))
            {
                DBConnect conector = new DBConnect();
                Label LblID = (Label)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("LblID") as Label;
                DDisp.VerEquipos(this, LblID.Text, tipo.SelectedValue, vhidequipo.Value,"2");
                GridPerifericos(tipo.SelectedValue);
            }
            
        }
        protected void controles(object sender, EventArgs e)
        {
           string Stipo = tipo.SelectedValue;
           if (Stipo == "0")
           {
               FillCustomerInGrid();
           }
            if (Stipo == "2")
            {
                GridPerifericos("2");
            }
            if (Stipo == "3")
            {
                GridPerifericos("3");
            }
            if (Stipo == "4")
            {
                GridPerifericos("4");
            }
            if (Stipo == "5")
            {
                GridPerifericos("5");
            }
            if (Stipo == "6")
            {
                GridPerifericos("6");
            }
            if (Stipo == "15")
            {
                GridPerifericos("15");
            }
        }
        private void GridPerifericos(string htipo)
        {
            DBConnect conector = new DBConnect();
            DataTable datos = new DataTable();
            datos = conector.SVPerifericos(htipo);
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
    }
}