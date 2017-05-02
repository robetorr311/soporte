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

namespace soporte.Reportes
{
    public partial class frmReporte2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string menu = Server.HtmlEncode(Request.QueryString["menu"]);
                if ((menu == "1") || (Session["Session"] != null))
                {
                    DBConnect conector = new DBConnect();
                    string hmenu = Server.HtmlEncode(Request.QueryString["hmenu"]);
                    string nombusuario = (string)this.Session["Us"];
                    conector.IAuditoria(nombusuario, hmenu);
                    DataTable lsoporte = conector.SSoportes();
                    ListItem inicio = new ListItem();
                    inicio.Text = "Seleccione";
                    inicio.Value = "0";
                    soporte.Items.Add(inicio);
                    for (int i = 0; i < lsoporte.Rows.Count; i++)
                    {
                        ListItem opcion = new ListItem();
                        opcion.Text = lsoporte.Rows[i]["nombre"].ToString();
                        opcion.Value = lsoporte.Rows[i]["id"].ToString();
                        soporte.Items.Add(opcion);
                    }
                    soporte.DataBind();
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
            }
        }
        protected void final(object sender, EventArgs e)
        {
            MiCalendario.verCalendario(this, "fechafinal");
        }
        protected void inicio(object sender, EventArgs e)
        {
            MiCalendario.verCalendario(this, "fechainicio");
        }
        protected void PDF(object sender, EventArgs e)
        {
            if ((fechainicio.Text == "") || (fechafinal.Text == ""))
            {
                Label1.Text = "Debe seleccionar un rango de fechas para continuar!";
            }
            else
            {
                DateTime fecha1 = Convert.ToDateTime(fechainicio.Text);
                DateTime fecha2 = Convert.ToDateTime(fechafinal.Text);
                if (fecha1 > fecha2)
                {
                   Label1.Text = "no es posible realizar el reporte!! Revise la seleccion de fechas!! El Valor inicial (Desde) no puede ser mayor al valor final (Hasta)";
                }
                else
                {
                   string mes1 = fechainicio.Text.Substring(3, 2);
                   string dia1 = fechainicio.Text.Substring(0, 2);
                   string año1 = fechainicio.Text.Substring(6, 4);
                   string fechai = año1 + "-" + mes1 + "-" + dia1;
                   string mes2 = fechafinal.Text.Substring(3, 2);
                   string dia2 = fechafinal.Text.Substring(0, 2);
                   string año2 = fechafinal.Text.Substring(6, 4);
                   string fechaf = año2 + "-" + mes2 + "-" + dia2;
                   Response.Redirect("reporte4.aspx?fechainicio=" +
                                      System.Web.HttpUtility.UrlEncode(fechai) +
                                      "&fechafinal=" + System.Web.HttpUtility.UrlEncode(fechaf) +
                                      "&soporte=" + System.Web.HttpUtility.UrlEncode(soporte.SelectedItem.Text) +
                                      "&dmyi=" + System.Web.HttpUtility.UrlEncode(fechainicio.Text) +
                                      "&dmyf=" + System.Web.HttpUtility.UrlEncode(fechafinal.Text));

                    /*string sql1 = "select * from rptenrevision('" +
                    soporte.SelectedItem.Text + "','" +
                    fechai + " 00:00:00','" +
                    fechaf + " 23:59:00');";
            
                     string sql2 = "select * from rptculminado('" +
                     soporte.SelectedItem.Text + "','" +
                     fechai + " 00:00:00','" +
                     fechaf + " 23:59:00');";
                    label.Text = sql1 + " " + sql2;*/
                }
            }
        }
    }
}