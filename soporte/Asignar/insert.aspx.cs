using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace soporte.Asignar
{
    public partial class insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {               
            string soporte = Server.HtmlEncode(Request.QueryString["soporte"]);
            labelmens.Text = "Actividad Asignada al Funcionario" + soporte;
            string hmenu = Server.HtmlEncode(Request.QueryString["hmenu"]);
            vhmenu.Value = hmenu;
        }
        protected void Finalizar(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx?menu=1&hmenu=" + vhmenu.Value);
        }
    }
}