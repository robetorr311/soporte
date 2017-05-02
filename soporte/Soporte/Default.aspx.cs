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
using System.Collections.Generic;
using System.Text;

namespace soporte.Soporte
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
                        DataTable lsoporte = conector.SusuNiv2();
                        ListItem inicio = new ListItem();
                        inicio.Text = "Seleccione";
                        inicio.Value = "0";
                        usuario.Items.Add(inicio);
                        for (int i = 0; i < lsoporte.Rows.Count; i++)
                        {
                            ListItem opcion = new ListItem();
                            opcion.Text = lsoporte.Rows[i]["nombre"].ToString();
                            opcion.Value = lsoporte.Rows[i]["id"].ToString();
                            usuario.Items.Add(opcion);
                        }
                        usuario.DataBind();
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
            DBConnect conector = new DBConnect();
            conector.ISoporte(TextBox1.Text,usuario.SelectedValue);
            conector.UestatusU(usuario.SelectedValue,"1");
            Response.Redirect("insert.aspx?hmenu=" + vhmenu.Value);
        } 
    }
}