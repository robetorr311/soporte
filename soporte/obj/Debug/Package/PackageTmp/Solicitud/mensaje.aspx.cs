using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace soporte.Solicitud
{
    public partial class mensaje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mensaje = Server.HtmlEncode(Request.QueryString["mensaje"]);
            Label1.Text = mensaje;
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