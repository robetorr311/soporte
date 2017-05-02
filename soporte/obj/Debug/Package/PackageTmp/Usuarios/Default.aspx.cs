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
using System.Collections.Generic;
using System.Text;

namespace soporte.Usuarios
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
                        DBConnect conector = new DBConnect();
                        List<string[]> listado = conector.SNiveles();
                        ListItem opciond = new ListItem();
                        opciond.Text = "Seleccione";
                        opciond.Value = "0";
                        DropDownList1.Items.Add(opciond);
                        for (int i = 0; i < listado.Count; i++)
                        {
                            string[] lista = new string[2];
                            lista = listado[i];
                            ListItem opcion = new ListItem();
                            opcion.Text = lista[1];
                            opcion.Value = lista[0];
                            DropDownList1.Items.Add(opcion);
                            lista = null;
                        }
                        DropDownList1.DataBind();
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
            conector.IUsuario(TextBox1.Text, TextBox2.Text, TextBox3.Text, "1", DropDownList1.SelectedValue);
            Response.Redirect("insert.aspx");
        } 
    }
}
