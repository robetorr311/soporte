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

namespace soporte.Departamentos
{
    public partial class Default : System.Web.UI.Page
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
                        vhmenu.Value = hmenu;
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
        protected void Guardar(object sender, EventArgs e)
        {
            string Vcodigo = codigo.Text;
            string Vnombre = nombre.Text;
            string Vresponsable = responsable.Text;
            string Vtelefono = telefono.Text;
            string Vdescripcion = descripcion.Text;
            DBConnect conector = new DBConnect();
            conector.IDepartamentos(Vnombre, Vresponsable, Vtelefono, Vdescripcion, Vcodigo, 1);
            Response.Redirect("insert.aspx?hmenu=" + vhmenu.Value);
        } 
    }
}
