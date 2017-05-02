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
using System.Text;

namespace soporte.Reportes
{
    public partial class frmReporte7 : System.Web.UI.Page
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
                        string nombusuario = (string)this.Session["Us"];
                        conector.IAuditoria(nombusuario, hmenu);
                        DDcapacidad.Visible = false;
                        modelo.Visible = false;
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
        protected void PDF(object sender, EventArgs e)
        {
            if ((htipo.SelectedValue == "0") || ((DDcapacidad.SelectedValue == "0")&&(modelo.Text=="")))
            {
                Label1.Text = "Faltan datos para continuar!";
            }
            else
            {
                        Response.Redirect("reporte7.aspx?htipo=" +
                                        System.Web.HttpUtility.UrlEncode(htipo.SelectedValue) +
                                        "&capacidad=" + System.Web.HttpUtility.UrlEncode(DDcapacidad.SelectedItem.Text) +
                                        "&modelo=" + System.Web.HttpUtility.UrlEncode(modelo.Text));
            }
        }
        protected void htdispositivo(object sender, EventArgs e)
        {
            DBConnect conector = new DBConnect();
            string idtipo = htipo.SelectedValue;
            DDcapacidad.Items.Clear();
            modelo.Text = "";
            if ((idtipo == "7") || (idtipo == "9"))
            {
                if (idtipo == "7")
                {
                    modelo.Visible = false;
                    DDcapacidad.Visible = true;
                    DataTable lista = conector.Scapacidaddd();
                    ListItem opct = new ListItem();
                    opct.Text = "Seleccione";
                    opct.Value = "0";
                    DDcapacidad.Items.Add(opct);
                    ListItem opctodos = new ListItem();
                    opctodos.Text = "TODOS";
                    opctodos.Value = "99";
                    DDcapacidad.Items.Add(opctodos);
                    for (int i = 0; i < lista.Rows.Count; i++)
                    {
                        ListItem opct2 = new ListItem();
                        opct2.Text = lista.Rows[i]["nombre"].ToString();
                        opct2.Value = lista.Rows[i]["id"].ToString();
                        DDcapacidad.Items.Add(opct2);
                    }
                    DDcapacidad.DataBind();
                }
                if (idtipo == "9")
                {
                    modelo.Visible = false;
                    DDcapacidad.Visible = true;
                    DataTable lista = conector.Scapacidadram();
                    ListItem opct = new ListItem();
                    opct.Text = "Seleccione";
                    opct.Value = "0";
                    DDcapacidad.Items.Add(opct);
                    ListItem opctodos = new ListItem();
                    opctodos.Text = "TODOS";
                    opctodos.Value = "99";
                    DDcapacidad.Items.Add(opctodos);
                    for (int i = 0; i < lista.Rows.Count; i++)
                    {
                        ListItem opct2 = new ListItem();
                        opct2.Text = lista.Rows[i]["nombre"].ToString();
                        opct2.Value = lista.Rows[i]["id"].ToString();
                        DDcapacidad.Items.Add(opct2);
                    }
                    DDcapacidad.DataBind();
                }
            }
            else
            {
                modelo.Visible = true;
                ListItem opct = new ListItem();
                opct.Text = "Seleccione";
                opct.Value = "0";
                DDcapacidad.Items.Add(opct);
                DDcapacidad.SelectedItem.Text = "Seleccione";
                DDcapacidad.SelectedValue = "0";
                DDcapacidad.Visible = false;
            }
        }

    }
}