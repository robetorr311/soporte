using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace soporte
{
    public partial class soporte : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string session = System.Configuration.ConfigurationManager.AppSettings["Session"];
            if (session == "1")
            {
                string nombusuario2 = System.Configuration.ConfigurationManager.AppSettings["Us"];
                string nombre2 = System.Configuration.ConfigurationManager.AppSettings["Nbr"];
                string nivel2 = System.Configuration.ConfigurationManager.AppSettings["Nvl"];

                Server.Transfer("/Menu/Menu.aspx?loggin=" +
                    System.Web.HttpUtility.UrlEncode(nombusuario2) +
                    "&nombre=" + System.Web.HttpUtility.UrlEncode(nombre2) +
                    "&nivel=" + System.Web.HttpUtility.UrlEncode(nivel2));
            }
        }
        protected void Ingresar(object sender, EventArgs e)
        {
            DBConnect conector = new DBConnect();
            DataTable usuarios = new DataTable();
            usuarios = conector.Susuarios(TextBox1.Text, TextBox2.Text);
            int rec = usuarios.Rows.Count;
            if (rec == 0)
            {
                Response.Redirect("denegado.aspx");
            }
            else
            {
                string nombusuario = usuarios.Rows[0]["loggin"].ToString();
                string passusuario = usuarios.Rows[0]["password"].ToString();
                string nivel = usuarios.Rows[0]["hnivel"].ToString();
                string nombre = usuarios.Rows[0]["nombre"].ToString();
                System.Configuration.ConfigurationManager.AppSettings["Session"] = "1";
                System.Configuration.ConfigurationManager.AppSettings["Us"] = nombusuario;
                System.Configuration.ConfigurationManager.AppSettings["Nbr"] = nombre;
                System.Configuration.ConfigurationManager.AppSettings["Nvl"] = nivel;
                Server.Transfer("/Menu/Menu.aspx?loggin=" +
                    System.Web.HttpUtility.UrlEncode(nombusuario) +
                    "&nombre=" + System.Web.HttpUtility.UrlEncode(nombre) +
                    "&nivel=" + System.Web.HttpUtility.UrlEncode(nivel));
            }
        } 
    }
}