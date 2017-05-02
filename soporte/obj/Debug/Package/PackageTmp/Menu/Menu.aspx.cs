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

namespace soporte.Menu
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            int d = dt.Day;
            int m = dt.Month;
            int y = dt.Year;
            int h = dt.Hour;
            int min = dt.Minute;
            string dia="";
            string mes="";
            string minu="";
            if (d < 10)
            {
                dia = "0" + Convert.ToString(d);
            }
            else
            {
                dia = Convert.ToString(d);
            }
            if (min < 10)
            {
                minu = "0" + Convert.ToString(min);
            }
            else
            {
                minu = Convert.ToString(min);
            }
            if (m < 10)
            {
                mes = "0" + Convert.ToString(m);
            }
            else
            {
                mes = Convert.ToString(m);
            }
            Label6.Text = h + ":" + minu + " | " + dia + "/" + mes + "/" + y;            
            string login = Server.HtmlEncode(Request.QueryString["loggin"]);
            string password = Server.HtmlEncode(Request.QueryString["password"]);
            string nombre = Server.HtmlEncode(Request.QueryString["nombre"]);
            string nivel = Server.HtmlEncode(Request.QueryString["nivel"]);
            int ni = Convert.ToInt16(nivel);
            Label2.Text = login;
            Label4.Text = nombre;
            DBConnect conexion = new DBConnect();
            DataTable principal = conexion.Smenu(0);
            int rec = principal.Rows.Count;
            string[,] ParentNode = new string[100, 3];
            int i = 0;
            int count = 0;
            while (i < rec)
            {
                ParentNode[count, 0] = principal.Rows[i]["id"].ToString();
                ParentNode[count++, 1] = principal.Rows[i]["nombre"].ToString();
                i++;
            }
            for (int loop = 0; loop < count; loop++)
            {
                MenuItem root = new MenuItem();
                root.Value = ParentNode[loop, 0];
                root.Text = ParentNode[loop, 1];
                root.ImageUrl = "../Imagenes/1x1.gif";// +ParentNode[loop, 2];
                root.Selectable = false;
                int hp= Convert.ToInt16(ParentNode[loop, 0]);
                int j = 0;
                DataTable segundonivel = new DataTable();
                segundonivel = conexion.Smenu(hp);
                int recsn = segundonivel.Rows.Count;
                while (j < recsn)
                {
                    if (nivel == "1")
                    {
                            MenuItem child = new MenuItem();
                            child.ImageUrl = "../Imagenes/" + segundonivel.Rows[j]["img"].ToString();
                            child.Value = segundonivel.Rows[j]["id"].ToString();
                            child.Text = " " + segundonivel.Rows[j]["nombre"].ToString();
                            child.NavigateUrl = "../" + segundonivel.Rows[j]["ruta"].ToString() + "?menu=1";
                            child.Target = "principal";
                            root.ChildItems.Add(child);
                    }
                    if (nivel == "2")
                    {
                        if ((segundonivel.Rows[j]["nivel"].ToString() == "2") || (segundonivel.Rows[j]["nivel"].ToString() == "3")) 
                        {
                            MenuItem child = new MenuItem();
                            child.ImageUrl = "../Imagenes/" + segundonivel.Rows[j]["img"].ToString();
                            child.Value = segundonivel.Rows[j]["id"].ToString();
                            child.Text = " " + segundonivel.Rows[j]["nombre"].ToString();
                            child.NavigateUrl = "../" + segundonivel.Rows[j]["ruta"].ToString() + "?menu=1";
                            child.Target = "principal";
                            root.ChildItems.Add(child);
                        }
                    }
                    if (nivel == "3")
                    {
                        if (segundonivel.Rows[j]["nivel"].ToString() == "3")
                        {
                            MenuItem child = new MenuItem();
                            child.ImageUrl = "../Imagenes/" + segundonivel.Rows[j]["img"].ToString();
                            child.Value = segundonivel.Rows[j]["id"].ToString();
                            child.Text = " " + segundonivel.Rows[j]["nombre"].ToString();
                            child.NavigateUrl = "../" + segundonivel.Rows[j]["ruta"].ToString() + "?menu=1";
                            child.Target = "principal";
                            root.ChildItems.Add(child);
                        }
                    }
                    j++;

                }
                Menu1.Items.Add(root);
            }
        }
        protected void Finalizar(object sender, EventArgs e)
        {
            System.Configuration.ConfigurationManager.AppSettings["Session"] = "";
            System.Configuration.ConfigurationManager.AppSettings["Us"] = "";
            System.Configuration.ConfigurationManager.AppSettings["Nbr"] = "";
            System.Configuration.ConfigurationManager.AppSettings["Nvl"] = "";         
            Response.Redirect("../salida.aspx");
        }
    }
}
