using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace soporte.Revision
{
    public partial class insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Finalizar(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?menu=1");
        }
    }
}