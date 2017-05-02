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

namespace Web_prueba
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            id.Value= Server.HtmlEncode(Request.QueryString["codigo"]);
            serial.Value = Server.HtmlEncode(Request.QueryString["serial"]);
            vhmenu.Value = Server.HtmlEncode(Request.QueryString["hmenu"]);
        }
        protected void Finalizar(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx?menu=1&hmenu=" + vhmenu.Value);
        }
        protected void PDF(object sender, EventArgs e)
        {
            Response.Redirect("../Reportes/solicitudpdf.aspx?id=" + id.Value);
        }
    }
}
