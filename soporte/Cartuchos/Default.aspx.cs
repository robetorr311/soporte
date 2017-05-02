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

namespace soporte.Cartuchos
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string menu = Server.HtmlEncode(Request.QueryString["menu"]);
                string hequipo = Server.HtmlEncode(Request.QueryString["hequipo"]);
                string hmenu = Server.HtmlEncode(Request.QueryString["hmenu"]);
                vhmenu.Value = hmenu;
                idequipo.Value = hequipo;
                if (menu == "1")
                {
                    if (Session["Session"] != null)
                    {
                        DBConnect conector = new DBConnect();
                        DataTable limpresoras = new DataTable();
                        string nombusuario = (string)this.Session["Us"];
                        conector.IAuditoria(nombusuario, hmenu);
                        if (idequipo.Value == "")
                        {
                            limpresoras = conector.SAllimpresoras();
                            ListItem inicioimp = new ListItem();
                            inicioimp.Text = "Seleccione";
                            inicioimp.Value = "0";
                            impresoras.Items.Add(inicioimp);
                            for (int i = 0; i < limpresoras.Rows.Count; i++)
                            {
                                ListItem opcionimp2 = new ListItem();
                                opcionimp2.Text = limpresoras.Rows[i]["nombre"].ToString();
                                opcionimp2.Value = limpresoras.Rows[i]["id"].ToString();
                                impresoras.Items.Add(opcionimp2);
                            }
                            impresoras.DataBind();
                            serial.Enabled = false;
                            marca.Enabled = false;
                            modelo.Enabled = false;
                            numero.Enabled = false;
                            htipo.Enabled = false;
                            Button1.Enabled = false;
                        }
                        else
                        {
                            string strtipo = "";
                            DataTable ltipos = new DataTable();
                            string ideq = idequipo.Value.TrimEnd();
                            limpresoras = conector.SAllimpresoras();
                            Label1.Text = strtipo;
                            ListItem iniimp = new ListItem();
                            iniimp.Text = "Seleccione";
                            iniimp.Value = "0";
                            impresoras.Items.Add(iniimp);
                            for (int i = 0; i < limpresoras.Rows.Count; i++)
                            {
                                ListItem opcimp2 = new ListItem();
                                opcimp2.Text = limpresoras.Rows[i]["nombre"].ToString();
                                opcimp2.Value = limpresoras.Rows[i]["id"].ToString();
                                impresoras.Items.Add(opcimp2);
                            }
                            impresoras.DataBind();
                            DataTable limpr = conector.Simpresoras(ideq);
                            for (int i = 0; i < limpr.Rows.Count; i++)
                            {
                                impresoras.SelectedItem.Text = limpr.Rows[i]["nombre"].ToString();
                                impresoras.SelectedValue = limpr.Rows[i]["id"].ToString();
                                strtipo = limpr.Rows[i]["htdispositivo"].ToString();
                            }
                            DataTable lcartuchos = conector.SCartuchos(ideq);
                            if (lcartuchos.Rows.Count > 0)
                            {
                                CargarGrid(idequipo.Value);
                                GridView1.Visible = true;
                            }
                            else
                            {
                                GridView1.Visible = false;
                            }
                            if ((strtipo == "45") || (strtipo == "46"))
                            {
                                ltipos = conector.Shtdispositivo("19");
                                if (lcartuchos.Rows.Count == 1)
                                {
                                    serial.Enabled = false;
                                    marca.Enabled = false;
                                    modelo.Enabled = false;
                                    numero.Enabled = false;
                                    htipo.Enabled = false;
                                    Button1.Enabled = false;
                                }
                                else
                                {
                                    serial.Enabled = true;
                                    marca.Enabled = true;
                                    modelo.Enabled = true;
                                    numero.Enabled = true;
                                    htipo.Enabled = true; 
                                    Button1.Enabled = true;

                                }
                            }
                            if ((strtipo == "47") || (strtipo == "48") || (strtipo == "49") || (strtipo == "50"))
                            {
                                ltipos = conector.Shtdispositivo("18");
                                if ((lcartuchos.Rows.Count == 1) || (lcartuchos.Rows.Count > 1))
                                {
                                    serial.Enabled = false;
                                    marca.Enabled = false;
                                    modelo.Enabled = false;
                                    numero.Enabled = false;
                                    htipo.Enabled = false;
                                    Button1.Enabled = false;
                                }
                                else
                                {
                                    serial.Enabled = true;
                                    marca.Enabled = true;
                                    modelo.Enabled = true;
                                    numero.Enabled = true;
                                    htipo.Enabled = true;
                                    Button1.Enabled = true;
                                }
                            }
                            if ((strtipo == "51") || (strtipo == "52") || (strtipo == "53"))
                            {
                                ltipos = conector.Shtdispositivo("17");
                                if ((lcartuchos.Rows.Count == 2)||(lcartuchos.Rows.Count > 2))
                                {
                                    serial.Enabled = false;
                                    marca.Enabled = false;
                                    modelo.Enabled = false;
                                    numero.Enabled = false;
                                    htipo.Enabled = false;
                                    Button1.Enabled = false;

                                }
                                else
                                {
                                    serial.Enabled = true;
                                    marca.Enabled = true;
                                    modelo.Enabled = true;
                                    numero.Enabled = true;
                                    htipo.Enabled = true;
                                    Button1.Enabled = true;
                                }
                            }
                            htipo.Items.Clear();
                            ListItem iniciotd = new ListItem();
                            iniciotd.Text = "Seleccione";
                            iniciotd.Value = "0";
                            htipo.Items.Add(iniciotd);
                            for (int i = 0; i < ltipos.Rows.Count; i++)
                            {
                                ListItem iniciotd2 = new ListItem();
                                iniciotd2.Text = ltipos.Rows[i]["nombre"].ToString();
                                iniciotd2.Value = ltipos.Rows[i]["id"].ToString();
                                htipo.Items.Add(iniciotd2);
                            }
                            htipo.DataBind();
                        }
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

        protected void tele(object sender, EventArgs e)
        {
            if (Session["Session"] != null)
            {
                string nombre2 = (string)this.Session["Nbr"];
                string nombusuario2 = (string)this.Session["Us"];
                string nivel2 = (string)this.Session["Nvl"];
                string hdep2 = (string)this.Session["hdep"];
                string strtipo = "";
                DBConnect conector = new DBConnect();
                DataTable ltipos = new DataTable();
                DataTable limpresoras = conector.Simpresoras(impresoras.SelectedValue);
                if (limpresoras.Rows.Count > 0)
                {
                    for (int i = 0; i < limpresoras.Rows.Count; i++)
                    {
                        strtipo = limpresoras.Rows[i]["htdispositivo"].ToString();
                    }
                }
                DataTable lcartuchos = conector.SCartuchos(impresoras.SelectedValue);
                if (lcartuchos.Rows.Count > 0)
                {
                    CargarGrid(impresoras.SelectedValue);
                    GridView1.Visible = true;
                }
                else
                {
                    GridView1.Visible = false;
                }
                if ((strtipo == "45") || (strtipo == "46"))
                {
                    ltipos = conector.Shtdispositivo("19");
                    if (lcartuchos.Rows.Count == 1)
                    {
                        serial.Enabled = false;
                        marca.Enabled = false;
                        modelo.Enabled = false;
                        numero.Enabled = false;
                        htipo.Enabled = false;
                        Button1.Enabled = false;
                    }
                    else
                    {
                        serial.Enabled = true;
                        marca.Enabled = true;
                        modelo.Enabled = true;
                        numero.Enabled = true;
                        htipo.Enabled = true;
                        Button1.Enabled = true;
                    }

                }
                if ((strtipo == "47") || (strtipo == "48") || (strtipo == "49") || (strtipo == "50"))
                {
                    ltipos = conector.Shtdispositivo("18");
                    if (lcartuchos.Rows.Count == 1)
                    {
                        serial.Enabled = false;
                        marca.Enabled = false;
                        modelo.Enabled = false;
                        numero.Enabled = false;
                        htipo.Enabled = false;
                        Button1.Enabled = false;
                    }
                    else
                    {
                        serial.Enabled = true;
                        marca.Enabled = true;
                        modelo.Enabled = true;
                        numero.Enabled = true;
                        htipo.Enabled = true;
                        Button1.Enabled = true;
                    }
                }
                if ((strtipo == "51") || (strtipo == "52") || (strtipo == "53"))
                {
                    ltipos = conector.Shtdispositivo("17");
                    if (lcartuchos.Rows.Count == 2)
                    {
                        serial.Enabled = false;
                        marca.Enabled = false;
                        modelo.Enabled = false;
                        numero.Enabled = false;
                        htipo.Enabled = false;
                        Button1.Enabled = false;
                    }
                    else
                    {
                        serial.Enabled = true;
                        marca.Enabled = true;
                        modelo.Enabled = true;
                        numero.Enabled = true;
                        htipo.Enabled = true; 
                        Button1.Enabled = true;

                    }
                }
                htipo.Items.Clear();
                ListItem iniciotd = new ListItem();
                iniciotd.Text = "Seleccione";
                iniciotd.Value = "0";
                htipo.Items.Add(iniciotd);
                for (int i = 0; i < ltipos.Rows.Count; i++)
                {
                    ListItem iniciotd2 = new ListItem();
                    iniciotd2.Text = ltipos.Rows[i]["nombre"].ToString();
                    iniciotd2.Value = ltipos.Rows[i]["id"].ToString();
                    htipo.Items.Add(iniciotd2);
                }
                htipo.DataBind();

            }
            else
            {
                string devuelveFecha = "<script language='JavaScript'>" +
                    "window.document.forms[0].target = '_parent'; window.document.forms[0].action = '../salida.aspx';" +
                    "window.document.forms[0].submit(); </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "CambiaTarget", devuelveFecha);

            }
        }

        private void CargarGrid(string himpresora)
        {
            DBConnect conector = new DBConnect();
            DataTable Datadd = conector.SCartuchos(himpresora);
            if (Datadd.Rows.Count > 0)
            {
                GridView1.DataSource = Datadd;
                GridView1.DataBind();
                GridView1.SelectedIndex = 0;
            }
            else
            {
                DataTable datos2 = new DataTable();
                DataColumn columna1 = new DataColumn("Id");
                DataColumn columna2 = new DataColumn("Marca");
                DataColumn columna3 = new DataColumn("Serial");
                DataColumn columna4 = new DataColumn("Tipo");
                DataColumn columna5 = new DataColumn("Estatus");
                columna1.AllowDBNull = true;
                columna2.AllowDBNull = true;
                columna3.AllowDBNull = true;
                columna4.AllowDBNull = true;
                columna5.AllowDBNull = true;
                datos2.Columns.Add(columna1);
                datos2.Columns.Add(columna2);
                datos2.Columns.Add(columna3);
                datos2.Columns.Add(columna4);
                datos2.Columns.Add(columna5);
                DataRow dr = datos2.NewRow();
                dr["Id"] = null;
                dr["Marca"] = null;
                dr["Serial"] = null;
                dr["Tipo"] = null;
                dr["Estatus"] = null;
                datos2.Rows.Add(dr);
                GridView1.DataSource = datos2;
                GridView1.DataBind();
                int TotalColumns = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                GridView1.Rows[0].Cells[0].Text = "No existen Discos!!";
            }
        }
        protected void Guardar(object sender, EventArgs e)
        {
            DBConnect conector = new DBConnect();
            string sql="";
            string strserial = serial.Text;
            string strmarca = marca.Text;
            string strnumero = numero.Text;
            string htdisp = htipo.SelectedValue;
            string strmodelo = modelo.Text;
            if ((strserial == "") | (strmarca == "") | (strnumero == "") | (htdisp == "0") | (strmodelo == ""))
            {
                if (strserial == "")
                {
                    serial.CssClass = "campoerror";
                }
                if (strmarca == "")
                {
                    marca.CssClass = "campoerror";
                }
                if (strnumero == "")
                {
                    numero.CssClass = "campoerror";
                }
                if (htdisp == "0")
                {
                    htipo.ControlStyle.CssClass = "selecterror";
                }
                if (strmodelo == "")
                {
                    modelo.CssClass = "campoerror";
                }
                Label1.CssClass = "alerta";
                Label1.Text = "Faltan Datos no es posible guardar!! Por favor complete los campos marcados como vacios!!";
            }
            else
            {
                sql=conector.ICartucho(strmarca, strmodelo, strserial, htipo.SelectedValue, "1", strnumero, "NINGUNA", "17", impresoras.SelectedValue);
                Label1.Text = sql;
                Response.Redirect("Default.aspx?menu=1&hmenu=" + System.Web.HttpUtility.UrlEncode(vhmenu.Value) + "&hequipo=" + System.Web.HttpUtility.UrlEncode(impresoras.SelectedValue));
            }
        }
        protected void Cerrar(object sender, EventArgs e)
        {
            string devuelveFecha = "<script language='JavaScript'>" +
                "returnValue = document.getElementById('HiddenField1').value;" +
                "close();</script>";

            ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
        }
        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrid(impresoras.SelectedValue);
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DBConnect conexion = new DBConnect();
            string iddram = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[2].Text.ToString();
            conexion.Dcartuchos(iddram);
            Response.Redirect("Default.aspx?menu=1&hmenu=" + System.Web.HttpUtility.UrlEncode(vhmenu.Value) + "&hequipo=" + System.Web.HttpUtility.UrlEncode(impresoras.SelectedValue));
        }

    }
}