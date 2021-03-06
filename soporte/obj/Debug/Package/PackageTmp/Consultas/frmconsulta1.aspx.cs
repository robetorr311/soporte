﻿using System;
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
    public partial class frmconsulta1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string menu = Server.HtmlEncode(Request.QueryString["menu"]);
                if (menu == "1")
                {
                    CargarGrid();
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
            }
        }
        protected void PDF(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Response.Redirect("../Reportes/respuestapdf.aspx?id=" + System.Web.HttpUtility.UrlEncode(row.Cells[1].Text));
        }
        private void CargarGrid()
        {
            DBConnect conexion = new DBConnect();
            DataTable datos = conexion.Sprocesados();
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
            CargarGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}
