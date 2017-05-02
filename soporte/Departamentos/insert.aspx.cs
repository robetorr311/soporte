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

namespace soporte.Departamentos
{
    public partial class insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string hmenu = Server.HtmlEncode(Request.QueryString["hmenu"]);
            vhmenu.Value = hmenu;

        }
        protected void Finalizar(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?menu=1&hmenu=" + vhmenu.Value);
        }
    }
}
