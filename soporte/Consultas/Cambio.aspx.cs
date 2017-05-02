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

namespace soporte.Consultas
{
    public partial class Cambio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Session["modal"] = "1";
                string id = Server.HtmlEncode(Request.QueryString["id"]);
                string tipo = Server.HtmlEncode(Request.QueryString["htipo"]);
                string hequipo = Server.HtmlEncode(Request.QueryString["hequipo"]);
                vhequipo.Value = hequipo;
                txtid.Value = id;
                txttipo.Value = htipo(tipo);
                DBConnect conector = new DBConnect();
                DataTable datos = conector.Stequipos(hequipo);
                ListItem opcions = new ListItem();
                opcions.Text = "Seleccione";
                opcions.Value = "0";
                equipo.Items.Add(opcions);
                for (int i = 0; i < datos.Rows.Count; i++)
                {
                    ListItem opcions2 = new ListItem();
                    opcions2.Text = datos.Rows[i]["nombre"].ToString();
                    opcions2.Value = datos.Rows[i]["id"].ToString();
                    equipo.Items.Add(opcions2);
                }
                equipo.DataBind();

            }

        }
        protected string htipo(string tipo)
        {
            string htipo = "";
            if (tipo == "Disco Duro")
            {
                htipo = "7";
            } 
            if (tipo == "Procesador")
            {
                htipo = "10";
            }
            if (tipo == "Motherboard")
            {
                htipo = "11";
            }
            if (tipo == "Video")
            {
                htipo = "8";
            }
            if (tipo == "RAM")
            {
                htipo = "9";
            }
            if (tipo == "Sonido")
            {
                htipo = "12";
            }
            if (tipo == "CdRom")
            {
                htipo = "16";
            }
            if (tipo == "Red (LAN)")
            {
                htipo = "14";
            }

            return htipo;
        }
        protected void Cerrar(object sender, EventArgs e)
        {
            string devuelveFecha = "<script language='JavaScript'>window.opener.document.location='frmEditaEquipos.aspx?id=" + vhequipo.Value + "'; " + "window.close(); </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
        }
        protected void Cambios(object sender, EventArgs e)
        {
            string id = txtid.Value;
            string hequipo = equipo.SelectedValue;
            string motivo = TextBox2.Text;
            if ((hequipo == "0") | (motivo == ""))
            {
                if (hequipo == "0")
                {
                    equipo.Attributes.Add("CssClass", "selecterror");
                }
                if (motivo == "")
                {
                    TextBox2.CssClass = "campoerror";
                }
                Label1.Text = "Faltan datos!!";
            }
            else
            {
                DBConnect conector = new DBConnect();
                conector.UCambios(txtid.Value, equipo.SelectedValue, txttipo.Value);
                conector.ICambios(vhequipo.Value, equipo.SelectedValue,TextBox2.Text,txttipo.Value,txtid.Value);
                equipo.Enabled = false;
                TextBox2.Enabled = false;
                Button1.Enabled = false;
                Label1.CssClass = "alerta";
                Label1.Text = "Cambio relizado!!";
            }
        }
    }
}