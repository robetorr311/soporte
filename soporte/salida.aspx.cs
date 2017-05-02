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

namespace soporte
{
    public partial class salida : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Finalizar(object sender, EventArgs e)
        {
            System.Configuration.ConfigurationManager.AppSettings["Session"] = "";
            System.Configuration.ConfigurationManager.AppSettings["Us"] = "";
            System.Configuration.ConfigurationManager.AppSettings["Nbr"] = "";
            System.Configuration.ConfigurationManager.AppSettings["Nvl"] = "";
            Response.Redirect("default.aspx");
        }
    }
}
