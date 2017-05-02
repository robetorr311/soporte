using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;

namespace soporte.Reportes
{
    public partial class frmReporte1 : System.Web.UI.Page
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
                        string nombusuario = (string)this.Session["Us"];
                        conector.IAuditoria(nombusuario, hmenu);
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
                int ts = 0;
                if (RadioButton1.Checked)
                {
                    ts = 1;
                }
                if (RadioButton2.Checked)
                {
                    ts = 2;
                }
                if (ts == 0)
                {
                    Label1.Text = "Debe seleccionar el tipo de Soporte";
                }
                else
                {
                    if (fecha1 > fecha2)
                    {
                        Label1.Text = "no es posible realizar el reporte!! Revise la seleccion de fechas!! El Valor inicial (Desde) no puede ser mayor al valor final (Hasta)";
                    }
                    else
                    {
                        // .Redirect("
                        string mes1 = fechainicio.Text.Substring(3, 2);
                        string dia1 = fechainicio.Text.Substring(0, 2);
                        string año1 = fechainicio.Text.Substring(6, 4);
                        string fechai = año1 + "-"+  mes1+ "-" + dia1;
                        string mes2 = fechafinal.Text.Substring(3, 2);
                        string dia2 = fechafinal.Text.Substring(0, 2);
                        string año2 = fechafinal.Text.Substring(6, 4);
                        string fechaf = año2 + "-" + mes2 + "-" + dia2;
                        Response.Redirect("reporte1.aspx?fechainicio=" +
                                        System.Web.HttpUtility.UrlEncode(fechai) +
                                        "&fechafinal=" + System.Web.HttpUtility.UrlEncode(fechaf) +
                                        "&htipo=" + System.Web.HttpUtility.UrlEncode(Convert.ToString(ts)));
                    }
                }
            }
        }
    }
}
