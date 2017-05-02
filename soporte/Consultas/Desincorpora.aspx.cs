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
    public partial class Desincorpora : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Session["modal"] = "1";
                string id = Server.HtmlEncode(Request.QueryString["id"]);
                string tipo = Server.HtmlEncode(Request.QueryString["htipo"]);
                string hequipo = Server.HtmlEncode(Request.QueryString["hequipo"]);
                string vformulario = Server.HtmlEncode(Request.QueryString["formulario"]);
                vhequipo.Value = hequipo;
                txtid.Value = id;
                if (vformulario == "1")
                {
                    txttipo.Value = htipo(tipo);
                }
                if (vformulario == "2")
                {
                    txttipo.Value = tipo;
                }

                formulario.Value = vformulario;
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
            string motivo = TextBox2.Text;
            string serial = "";
            string marca = "";
            string numero = "";
            string htdispositivo = "";
            string capacidad = "";
            string htipo = "";
            string hequipo = "";
            if (formulario.Value == "1")
            {
                if (motivo == "")
                {
                    TextBox2.CssClass = "campoerror";
                    Label1.Text = "Faltan datos!!";
                }
                else
                {
                    DBConnect conector = new DBConnect();
                    DataTable dispositivo = new DataTable();
                    dispositivo = conector.SDispositivo(id, txttipo.Value);
                    if (txttipo.Value == "7")
                    {
                        serial = dispositivo.Rows[0]["serial"].ToString();
                        marca = dispositivo.Rows[0]["marca"].ToString();
                        numero = dispositivo.Rows[0]["numero"].ToString();
                        htdispositivo = dispositivo.Rows[0]["htdispositivo"].ToString();
                        capacidad = dispositivo.Rows[0]["capacidad"].ToString();
                        htipo = "7";
                        hequipo = dispositivo.Rows[0]["hequipo"].ToString();
                    }
                    if (txttipo.Value == "8")
                    {
                        serial = dispositivo.Rows[0]["serial"].ToString();
                        marca = dispositivo.Rows[0]["marca"].ToString();
                        numero = dispositivo.Rows[0]["numero"].ToString();
                        htdispositivo = dispositivo.Rows[0]["htdispositivo"].ToString();
                        capacidad = dispositivo.Rows[0]["modelo"].ToString();
                        htipo = "8";
                        hequipo = dispositivo.Rows[0]["hequipo"].ToString();
                    }
                    if (txttipo.Value == "9")
                    {
                        serial = dispositivo.Rows[0]["serial"].ToString();
                        marca = dispositivo.Rows[0]["marca"].ToString();
                        numero = dispositivo.Rows[0]["numero"].ToString();
                        htdispositivo = dispositivo.Rows[0]["htdispositivo"].ToString();
                        capacidad = dispositivo.Rows[0]["capacidad"].ToString();
                        htipo = "9";
                        hequipo = dispositivo.Rows[0]["hequipo"].ToString();
                    }
                    if (txttipo.Value == "10")
                    {
                        serial = dispositivo.Rows[0]["serial"].ToString();
                        marca = dispositivo.Rows[0]["marca"].ToString();
                        numero = dispositivo.Rows[0]["numero"].ToString();
                        htdispositivo = dispositivo.Rows[0]["htdispositivo"].ToString();
                        capacidad = dispositivo.Rows[0]["modelo"].ToString();
                        htipo = "10";
                        hequipo = dispositivo.Rows[0]["hequipo"].ToString();
                    }
                    if (txttipo.Value == "11")
                    {
                        serial = dispositivo.Rows[0]["serial"].ToString();
                        marca = dispositivo.Rows[0]["marca"].ToString();
                        numero = dispositivo.Rows[0]["numero"].ToString();
                        htdispositivo = dispositivo.Rows[0]["htdispositivo"].ToString();
                        capacidad = dispositivo.Rows[0]["modelo"].ToString();
                        htipo = "11";
                        hequipo = dispositivo.Rows[0]["hequipo"].ToString();
                    }
                    if (txttipo.Value == "12")
                    {
                        serial = dispositivo.Rows[0]["serial"].ToString();
                        marca = dispositivo.Rows[0]["marca"].ToString();
                        numero = dispositivo.Rows[0]["numero"].ToString();
                        htdispositivo = dispositivo.Rows[0]["htdispositivo"].ToString();
                        capacidad = dispositivo.Rows[0]["modelo"].ToString();
                        htipo = "12";
                        hequipo = dispositivo.Rows[0]["hequipo"].ToString();
                    }
                    if (txttipo.Value == "14")
                    {
                        serial = dispositivo.Rows[0]["serial"].ToString();
                        marca = dispositivo.Rows[0]["marca"].ToString();
                        numero = dispositivo.Rows[0]["numero"].ToString();
                        htdispositivo = dispositivo.Rows[0]["htdispositivo"].ToString();
                        capacidad = dispositivo.Rows[0]["modelo"].ToString();
                        htipo = "14";
                        hequipo = dispositivo.Rows[0]["hequipo"].ToString();
                    }
                    if (txttipo.Value == "16")
                    {
                        serial = dispositivo.Rows[0]["serial"].ToString();
                        marca = dispositivo.Rows[0]["marca"].ToString();
                        numero = dispositivo.Rows[0]["numero"].ToString();
                        htdispositivo = dispositivo.Rows[0]["htdispositivo"].ToString();
                        capacidad = dispositivo.Rows[0]["modelo"].ToString();
                        htipo = "16";
                        hequipo = dispositivo.Rows[0]["hequipo"].ToString();
                    }
                    conector.IDesincorporados(id, serial, marca, numero, htdispositivo, capacidad, txttipo.Value, hequipo, "null", TextBox2.Text);
                    conector.DDispositivo(id, txttipo.Value);
                    TextBox2.Enabled = false;
                    Button1.Enabled = false;
                    Label1.CssClass = "alerta";
                    Label1.Text = "Desincorporacion relizada!!";
                }
            }
            if (formulario.Value == "2")
            {
                if (motivo == "")
                {
                    TextBox2.CssClass = "campoerror";
                    Label1.Text = "Faltan datos!!";
                }
                else
                {
                    DBConnect conector = new DBConnect();
                    DataTable dispositivo = new DataTable();
                    dispositivo = conector.SPeriferico(id, txttipo.Value);
                    serial = dispositivo.Rows[0]["serial"].ToString();
                    marca = dispositivo.Rows[0]["marca"].ToString();
                    numero = dispositivo.Rows[0]["numero"].ToString();
                    htdispositivo = dispositivo.Rows[0]["htdispositivo"].ToString();
                    capacidad = dispositivo.Rows[0]["modelo"].ToString();
                    hequipo = dispositivo.Rows[0]["nombre"].ToString();
                    conector.IDesincorporados(id, serial, marca, numero, htdispositivo, capacidad, txttipo.Value, id, "null", TextBox2.Text);
                    conector.DPerifericos(id, txttipo.Value);
                    TextBox2.Enabled = false;
                    Button1.Enabled = false;
                    Label1.CssClass = "alerta";
                    Label1.Text = "Desincorporacion relizada!!";
                }
            }
        }
    }
}