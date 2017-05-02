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

namespace soporte.Equipos
{
    public partial class video : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBConnect conexion = new DBConnect();
                Button2.Visible = false;
                string ide = Server.HtmlEncode(Request.QueryString["idequipo"]);
                idequipo.Value = ide;
                if (idequipo.Value == "")
                {
                    idequipo.Value = "0";
                }
                Int64 i = conexion.IDram(ide, "8");
                if (i > 0)
                {
                    DataTable datos = conexion.Stemporal(ide, "8");
                    string ser = datos.Rows[0]["Serial"].ToString();
                    string marc = datos.Rows[0]["Marca"].ToString();
                    string num = datos.Rows[0]["Numero"].ToString();
                    TextBox1.Text = ser;
                    TextBox2.Text = marc;
                    TextBox3.Text = num;
                    HiddenField2.Value = datos.Rows[0]["Id"].ToString();
                    Button1.Visible = false;
                    Button2.Visible = true;
                }
                HiddenField1.Value = Convert.ToString(conexion.IDram(ide, "8"));
            }
        }
        protected void Guardar(object sender, EventArgs e)
        {
            DBConnect conexion = new DBConnect();
            string serial = TextBox1.Text;
            string marca = TextBox2.Text;
            string numero = TextBox3.Text;
            string heq = idequipo.Value;
            string htdisp = "0";
            string key = "0";
            conexion.ITemporal(key, serial, marca, numero, htdisp, "null", "8", heq);
            HiddenField1.Value = Convert.ToString(conexion.IDram(heq, "8"));
            string devuelveFecha = "<script language='JavaScript'>" +
                "returnValue = document.getElementById('HiddenField1').value;" +
                "close();</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
        }
        protected void Actualizar(object sender, EventArgs e)
        {
            DBConnect conexion = new DBConnect();
            string idp = HiddenField2.Value;
            string heq = idequipo.Value;
            string serial = TextBox1.Text;
            string marca = TextBox2.Text;
            string numero = TextBox3.Text;
            string sql = conexion.UTemporal(idp, serial, marca, numero, "null");
            Label1.Text = sql;
            HiddenField1.Value = Convert.ToString(conexion.IDram(heq, "8"));
            string devuelveFecha = "<script language='JavaScript'>" +
                "returnValue = document.getElementById('HiddenField1').value;" +
                "close();</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
        }
    }
}
