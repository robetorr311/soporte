﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace soporte.Equipos
{
    public partial class discoduro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable temp = (DataTable)Session["temporal"];
            temp.DefaultView.RowFilter = string.Format("htipo = 7");
            DataTable DTdd = temp.DefaultView.ToTable();
            string ide = Server.HtmlEncode(Request.QueryString["id"]);
            idequipo.Value = ide;
            DBConnect conexion = new DBConnect();
            idmdisco.Value = ide + Convert.ToString(DTdd.Rows.Count);
            int instalados = DTdd.Rows.Count;
            CargarGrid();
            Label1.Text = "Número de Modulos: " + Convert.ToString(instalados);
            HiddenField1.Value = Convert.ToString(DTdd.Rows.Count);
            if (!IsPostBack)
            {
                htipo.Items.Clear();
            }
            DataTable lista = conexion.Scapacidaddd();
            ListItem opct = new ListItem();
            opct.Text = "Seleccione";
            opct.Value = "0";
            capacidaddd.Items.Add(opct);
            for (int i = 0; i < lista.Rows.Count; i++)
            {
                ListItem opct2 = new ListItem();
                opct2.Text = lista.Rows[i]["nombre"].ToString();
                opct2.Value = lista.Rows[i]["id"].ToString();
                capacidaddd.Items.Add(opct2);
            }
            capacidaddd.DataBind();
            DataTable lsoporte = conexion.Shtdispositivo("7");
            ListItem inicio = new ListItem();
            inicio.Text = "Seleccione";
            inicio.Value = "0";
            htipo.Items.Add(inicio);
            for (int i = 0; i < lsoporte.Rows.Count; i++)
            {
                ListItem opcion = new ListItem();
                opcion.Text = lsoporte.Rows[i]["nombre"].ToString();
                opcion.Value = lsoporte.Rows[i]["id"].ToString();
                htipo.Items.Add(opcion);
            }
            htipo.DataBind();

            if (instalados > 3)
            {
                TextBox1.Enabled = false;
                TextBox2.Enabled = false;
                TextBox3.Enabled = false;
                capacidaddd.Enabled = false;
                Button1.Enabled = false;
            }
            else
            {
                TextBox1.Enabled = true;
                TextBox2.Enabled = true;
                TextBox3.Enabled = true;
                capacidaddd.Enabled = true;
                Button1.Enabled = true;
            }
        }
        private void CargarGrid()
        {
            DataTable temporal = (DataTable)Session["temporal"];
            temporal.DefaultView.RowFilter = string.Format("htipo = 7");
            DataTable Datadd = temporal.DefaultView.ToTable();
            if (Datadd.Rows.Count > 0)
            {
                GridView1.DataSource = Datadd;
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
            string htdisp = htipo.SelectedValue;
            string cap = capacidaddd.SelectedItem.Text;
            string hcap = capacidaddd.SelectedValue;
            if ((serial == "") | (marca == "") | (numero == "") | (heq == "") | (key == "") | (htdisp == "0") | (hcap == "0"))
            {
                if (serial == "")
                {
                    TextBox1.CssClass = "campoerror";
                }
                if (marca == "")
                {
                    TextBox2.CssClass = "campoerror";
                }
                if (numero == "")
                {
                    TextBox3.CssClass = "campoerror";
                }
                if (htdisp == "0")
                {
                    htipo.ControlStyle.CssClass = "selecterror";
                }
                if (hcap == "0")
                {
                    capacidaddd.CssClass = "campoerror";
                }
                Label1.CssClass = "alerta";
                Label1.Text = "Faltan Datos no es posible guardar!! Por favor complete los campos marcados como vacios!!";
            }
            else
            {
                DataTable temporal = (DataTable)Session["temporal"];
                DataRow dr = temporal.NewRow();
                dr["key"] = key;
                dr["serial"] = serial;
                dr["marca"] = marca;
                dr["numero"] = numero;
                dr["capacidad"] = cap;
                dr["htdispositivo"] = htdisp;
                dr["htipo"] = "7";
                dr["hequipo"] = heq;
                dr["hcapacidadram"] = hcap;
                temporal.Rows.Add(dr);
                Response.Redirect("discoduro.aspx?id=" + System.Web.HttpUtility.UrlEncode(idequipo.Value));
            }
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
            CargarGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DBConnect conexion = new DBConnect();
            string iddram = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[2].Text.ToString();
            string criterio= "id=" + iddram;
            DataTable temporal = (DataTable)Session["temporal"];
            DataRow[] temporalt = temporal.Select(criterio);
            for (int i = 0; i < temporalt.Length; i++)
            {
                temporalt[i].Delete();
            }
            Response.Redirect("discoduro.aspx?idequipo=" + System.Web.HttpUtility.UrlEncode(idequipo.Value));
        }
    }
}
