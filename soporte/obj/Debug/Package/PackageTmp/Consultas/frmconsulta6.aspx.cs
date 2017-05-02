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
    public partial class frmconsulta6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string menu = Server.HtmlEncode(Request.QueryString["menu"]);
                if (menu == "1")
                {
                    CargarGrid();
                    ImageButton1.Visible = false;
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
            DataTable datos = conexion.SAllequipos();
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
                    dr["Departamento"] = datos.Rows[rec]["Departamento"].ToString();
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
            string iddram = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[2].Text.ToString();
            TextBox1.Value = iddram;
            CargarGrid2(iddram);
            ImageButton1.Visible = false;
        }
        private void CargarGrid2(string idequipo)
        {
            DBConnect conexion = new DBConnect();
            DataTable datos = conexion.SEquSol(idequipo);
            DataTable datos3 = new DataTable();
            DataColumn columna5 = new DataColumn("Id");
            DataColumn columna6 = new DataColumn("Fecha");
            DataColumn columna7 = new DataColumn("Departamento");
            DataColumn columna8 = new DataColumn("Solicitante");
            DataColumn columna9 = new DataColumn("Estatus");
            DataColumn columna11 = new DataColumn("Tipo");
            columna5.AllowDBNull = true;
            columna6.AllowDBNull = true;
            columna7.AllowDBNull = true;
            columna8.AllowDBNull = true;
            columna9.AllowDBNull = true;
            columna11.AllowDBNull = true;
            datos3.Columns.Add(columna5);
            datos3.Columns.Add(columna6);
            datos3.Columns.Add(columna7);
            datos3.Columns.Add(columna8);
            datos3.Columns.Add(columna11);
            datos3.Columns.Add(columna9);
            int fr = 0;
            if (datos.Rows.Count > 0)
            {
                for (fr = 0; fr < datos.Rows.Count; fr++)
                {
                    DataRow dr = datos3.NewRow();
                    dr["Id"] = datos.Rows[fr]["Id"].ToString();
                    dr["Fecha"] = datos.Rows[fr]["Fecha"].ToString(); 
                    dr["Departamento"] = datos.Rows[fr]["Departamento"].ToString();
                    dr["Solicitante"] = datos.Rows[fr]["Solicitante"].ToString();
                    dr["Tipo"] = datos.Rows[fr]["Tipo"].ToString();
                    dr["Estatus"] = datos.Rows[fr]["Estatus"].ToString();
                    datos3.Rows.Add(dr);
                }
                GridView2.DataSource = datos3;
                GridView2.DataBind();
            }
            else
            {
                DataTable datos2 = new DataTable();
                DataColumn columna1 = new DataColumn("Id");
                DataColumn columna2 = new DataColumn("Fecha");
                DataColumn columna3 = new DataColumn("Departamento");
                DataColumn columna4 = new DataColumn("Solicitante");
                DataColumn columna10 = new DataColumn("Estatus");
                DataColumn columna12 = new DataColumn("Tipo");
                columna1.AllowDBNull = true;
                columna2.AllowDBNull = true;
                columna3.AllowDBNull = true;
                columna4.AllowDBNull = true;
                columna12.AllowDBNull = true;
                columna10.AllowDBNull = true;
                datos2.Columns.Add(columna1);
                datos2.Columns.Add(columna2);
                datos2.Columns.Add(columna3);
                datos2.Columns.Add(columna4);
                datos2.Columns.Add(columna12);
                datos2.Columns.Add(columna10);
                DataRow dr = datos2.NewRow();
                dr["Id"] = null;
                dr["Fecha"] = null;
                dr["Departamento"] = null;
                dr["Solicitante"] = null;
                dr["Tipo"] = null;
                dr["Estatus"] = null;
                datos2.Rows.Add(dr);
                GridView2.DataSource = datos2;
                GridView2.DataBind();
                int TotalColumns = GridView2.Rows[0].Cells.Count;
                GridView2.Rows[0].Cells.Clear();
                GridView2.Rows[0].Cells.Add(new TableCell());
                GridView2.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                GridView2.Rows[0].Cells[0].Text = "No existen solicitudes pendientes!!";
                ImageButton1.Visible = false;
            }
        }
        protected void gridView_PageIndexChanging2(object sender, GridViewPageEventArgs e)
        {
            CargarGrid2(TextBox1.Value);
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }
        protected void gridView_SelectedIndex2(object sender, EventArgs e)
        {
            DBConnect conexion = new DBConnect();
            string iddram = GridView2.Rows[Convert.ToInt32(GridView2.SelectedIndex.ToString())].Cells[1].Text.ToString();
            TextBox2.Value = iddram;
            ImageButton1.Visible = true;
        }
        protected void PDF(object sender, EventArgs e)
        {
            GridViewRow rowselecc = GridView2.SelectedRow;
            string estatus = rowselecc.Cells[6].Text;
            if (estatus == "Pendiente")
            {
                MisReportes.verSolicitud(this, "Hidden1", TextBox2.Value);
            }
            if (estatus == "Reparado/Culminado")
            {
                MisReportes.verRespuesta(this, "Hidden1", TextBox2.Value);
            }
        }
    }
}