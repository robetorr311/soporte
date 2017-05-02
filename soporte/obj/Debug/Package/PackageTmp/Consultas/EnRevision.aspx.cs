using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace soporte.Consultas
{
    public partial class EnRevision : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string falla = Server.HtmlEncode(Request.QueryString["falla"]);
            string observaciones = Server.HtmlEncode(Request.QueryString["observaciones"]);
            Label3.Text = falla;
            Label4.Text = observaciones;
        }
        protected void cerrar(object sender, EventArgs e)
        {
            string devuelveFecha = "<script language='JavaScript'>" +
                "returnValue = document.getElementById('TextBox1').value;" +
                "close();</script>";

            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
        }
    }
}