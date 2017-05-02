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
    public partial class frmEditaSoporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string vidsoporte = Server.HtmlEncode(Request.QueryString["id"]);
                string vnombre = Server.HtmlEncode(Request.QueryString["nombre"]);
                string vhusuario = Server.HtmlEncode(Request.QueryString["husuario"]);
                string vestatus = Server.HtmlEncode(Request.QueryString["estatus"]);
                TextBox1.Value = vidsoporte;
                if (vestatus == "5")
                {
                    Lblestatus.Text = "Activa";
                }
                else
                {
                    Lblestatus.Text = "Inactiva";
                }
                Button2.Visible = true;
                Button3.Visible = false;
                Button4.Visible = false;
                nombre.Visible = false;
                usuario.Visible = false;
                estatus.Visible = false;
                Lblnombre.Visible = true;
                Lblusuario.Visible = true;
                Lblestatus.Visible = true;
                RequiredFieldValidator2.Enabled = false;
                RequiredFieldValidator3.Enabled = false;
                RequiredFieldValidator1.Enabled = false;
                nombre.Text = vnombre;
                Lblnombre.Text = vnombre;
                estatus.SelectedValue = vestatus;
                DBConnect conector = new DBConnect();
                DataTable lsoporte = conector.SAllusuarios();
                ListItem inicio = new ListItem();
                inicio.Text = "Seleccione";
                inicio.Value = "0";
                usuario.Items.Add(inicio);
                for (int i = 0; i < lsoporte.Rows.Count; i++)
                {
                    ListItem opcion = new ListItem();
                    opcion.Text = lsoporte.Rows[i]["loggin"].ToString();
                    opcion.Value = lsoporte.Rows[i]["id"].ToString();
                    usuario.Items.Add(opcion);
                }
                usuario.DataBind();
                if (vhusuario == "")
                {
                    Lblusuario.Text = "Null";
                }
                else
                {
                    DataTable ususop = conector.SUsuariosSoporteId(vhusuario);
                    Lblusuario.Text = ususop.Rows[0]["loggin"].ToString();
                    usuario.SelectedValue = vhusuario;
                }
            }
        }
        protected void cerrar(object sender, EventArgs e)
        {
            string devuelveFecha = "<script language='JavaScript'>" +
                "close();</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
        }
        protected void editar(object sender, EventArgs e)
        {
            Lblestatus.Visible = false;
            Lblnombre.Visible = false;
            Lblusuario.Visible = false;
            Button2.Visible = false;
            Button3.Visible = true;
            Button4.Visible = true;
            RequiredFieldValidator2.Enabled = true;
            RequiredFieldValidator3.Enabled = true;
            RequiredFieldValidator1.Enabled = true;
            nombre.Visible = true;
            estatus.Visible = true;
            usuario.Visible = true;
        }
        protected void actualizar(object sender, EventArgs e)
        {
            DBConnect conector = new DBConnect();
            conector.Usoportes(TextBox1.Value, nombre.Text, usuario.SelectedValue, estatus.SelectedValue);
            Lblestatus.Text = estatus.SelectedItem.Text;
            Lblusuario.Text = usuario.SelectedItem.Text;
            Lblnombre.Text = nombre.Text;
            Lblestatus.Visible = true;
            Lblnombre.Visible = true;
            Lblusuario.Visible = true;
            Button2.Visible = true;
            Button3.Visible = false;
            Button4.Visible = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator1.Enabled = false;
            nombre.Visible = false;
            estatus.Visible = false;
            usuario.Visible = false;
        }
        protected void cancelar(object sender, EventArgs e)
        {
            Lblestatus.Visible = true;
            Lblnombre.Visible = true;
            Lblusuario.Visible = true;
            Button2.Visible = true;
            Button3.Visible = false;
            Button4.Visible = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator1.Enabled = false;
            nombre.Visible = false;
            estatus.Visible = false;
            usuario.Visible = false;
        }
    }
}