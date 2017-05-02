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
    public partial class frmReporte3 : System.Web.UI.Page
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
                    string nivel = (string)this.Session["Nvl"];
                    string hdep = (string)this.Session["hdep"];
                    conector.IAuditoria(nombusuario, hmenu);
                    DataTable listado2 = conector.SAllTipoequipo();
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
                    Response.Redirect("reporte5.aspx?tipo=" + System.Web.HttpUtility.UrlEncode(tipo.SelectedValue) + "&fechainicio=" +
                                       System.Web.HttpUtility.UrlEncode(fechai) +
                                       "&fechafinal=" + System.Web.HttpUtility.UrlEncode(fechaf) +
                                       "&dmyi=" + System.Web.HttpUtility.UrlEncode(fechainicio.Text) +
                                       "&dmyf=" + System.Web.HttpUtility.UrlEncode(fechafinal.Text));
                }
            }
        }

    }
}