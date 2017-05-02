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

namespace soporte.Respuesta
{
    public partial class Reasignar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string hmenu = Server.HtmlEncode(Request.QueryString["vhmenu"]);
                string idsoporte = Server.HtmlEncode(Request.QueryString["vhsoporte"]);
                string vidsol = Server.HtmlEncode(Request.QueryString["idsol"]);
                vhmenu.Value = hmenu;
                vhsoporte.Value = idsoporte;
                idsol.Value = vidsol;
                DBConnect conector = new DBConnect();
                DataTable usuariosoporte = conector.SSoportes();
                ListItem inicio = new ListItem();
                inicio.Text = "Seleccione";
                inicio.Value = "0";
                soporte.Items.Add(inicio);
                for (int i = 0; i < usuariosoporte.Rows.Count; i++)
                {
                    ListItem opcion = new ListItem();
                    opcion.Text = usuariosoporte.Rows[i]["nombre"].ToString();
                    opcion.Value = usuariosoporte.Rows[i]["id"].ToString();
                    soporte.Items.Add(opcion);
                }
                soporte.DataBind();
            }
        }
        protected void Asignar(object sender, EventArgs e)
        {
            DBConnect conector = new DBConnect();
            string sql1 =conector.UPDTDocSop(idsol.Value, soporte.SelectedValue);
        }
        protected void Cerrar(object sender, EventArgs e)
        {
            string devuelveFecha = "<script language='JavaScript'>window.opener.document.location='default.aspx?menu=1&hmenu=" + vhmenu.Value + "'; " + "window.close();</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
        }

    }
}