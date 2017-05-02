using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;
using System.Collections.Generic;
using System.Text;

namespace soporte.Equipos
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                soperativo.Enabled = false;
                aplicaciones.Enabled = false;
                sistemas.Enabled = false;
                observacioness.Enabled = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
                Button6.Visible = false;
                Button7.Visible = false;
                Button8.Visible = false;
                Button9.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                modelo.Visible = false;
                htdisp.Visible = false;
                ram.Value = "0";
                dd.Value = "0";
                motherboard.Value = "0";
                procesador.Value = "0";
                lan.Value = "0";
                video.Value = "0";
                sonido.Value = "0";
                cdrom.Value = "0";
                modelo.Text = "";
                htdisp.SelectedValue = ""; 
                string menu = Server.HtmlEncode(Request.QueryString["menu"]);
                if (menu == "1")
                {
                    if (Session["Session"] != null)
                    {
                        DataTable temporal = new DataTable();
                        DataColumn columna1 = new DataColumn("id");
                        DataColumn columna2 = new DataColumn("key");
                        DataColumn columna3 = new DataColumn("serial");
                        DataColumn columna4 = new DataColumn("marca");
                        DataColumn columna5 = new DataColumn("numero");
                        DataColumn columna6 = new DataColumn("capacidad");
                        DataColumn columna7 = new DataColumn("htdispositivo");
                        DataColumn columna8 = new DataColumn("htipo");
                        DataColumn columna9 = new DataColumn("hequipo");
                        DataColumn columna10 = new DataColumn("hcapacidadram");
                        columna1.AutoIncrement = true;
                        columna2.AllowDBNull = true;
                        columna3.AllowDBNull = true;
                        columna4.AllowDBNull = true;
                        columna5.AllowDBNull = true;
                        columna6.AllowDBNull = true;
                        columna7.AllowDBNull = true;
                        columna8.AllowDBNull = true;
                        columna9.AllowDBNull = true;
                        columna10.AllowDBNull = true;
                        columna1.AutoIncrement = true;
                        temporal.Columns.Add(columna1);
                        temporal.Columns.Add(columna2);
                        temporal.Columns.Add(columna3);
                        temporal.Columns.Add(columna4);
                        temporal.Columns.Add(columna5);
                        temporal.Columns.Add(columna6);
                        temporal.Columns.Add(columna7);
                        temporal.Columns.Add(columna8);
                        temporal.Columns.Add(columna9);
                        temporal.Columns.Add(columna10);
                        DBConnect conector = new DBConnect();
                        Session.Add("temporal",temporal);
                        string hmenu = Server.HtmlEncode(Request.QueryString["hmenu"]);
                        vhmenu.Value = hmenu;
                        string nombusuario = (string)this.Session["Us"];
                        conector.IAuditoria(nombusuario, hmenu);
                        DataTable listado = conector.SAllDepartamentos();
                        ListItem opciond = new ListItem();
                        opciond.Text = "Seleccione";
                        opciond.Value = "0";
                        departamento.Items.Add(opciond);
                        for (int i = 0; i < listado.Rows.Count; i++)
                        {
                            ListItem opcion = new ListItem();
                            opcion.Text = listado.Rows[i]["nombre"].ToString();
                            opcion.Value = listado.Rows[i]["id"].ToString();
                            departamento.Items.Add(opcion);
                        }
                        departamento.DataBind();
                        DataTable listado2 = conector.SAllTipoequipo();
                        ListItem opciont = new ListItem();
                        opciont.Text = "Seleccione";
                        opciont.Value = "0";
                        tipo.Items.Add(opciont);
                        for (int i = 0; i < listado2.Rows.Count; i++)
                        {
                            ListItem opciont2 = new ListItem();
                            opciont2.Text = listado2.Rows[i]["nombre"].ToString();
                            opciont2.Value = listado2.Rows[i]["id"].ToString();
                            tipo.Items.Add(opciont2);
                        }
                        tipo.DataBind();
                        DataTable listado3 = conector.SAllSoperativo();
                        ListItem opcions = new ListItem();
                        opcions.Text = "Seleccione";
                        opcions.Value = "0";
                        soperativo.Items.Add(opcions);
                        for (int i = 0; i < listado3.Rows.Count; i++)
                        {
                            ListItem opcions2 = new ListItem();
                            opcions2.Text = listado3.Rows[i]["nombre"].ToString();
                            opcions2.Value = listado3.Rows[i]["id"].ToString();
                            soperativo.Items.Add(opcions2);
                        }
                        soperativo.DataBind();
                        string idequipo = Convert.ToString(conector.IDequipo());
                        HiddenField1.Value = idequipo;
                        string modal2 = "showPopWin('discoduro.aspx?id=" + idequipo + "', 600, 400, 2, null);";
                        string modal3 = "showPopWin('ram.aspx?id=" + idequipo + "', 600, 400,3, null);";
                        string modal4 = "showPopWin('procesador.aspx?id=" + idequipo + "', 600, 400, 4, null);";
                        string modal5 = "showPopWin('motherboard.aspx?id=" + idequipo + "', 600, 400, 5, null);";
                        string modal6 = "showPopWin('lan.aspx?id=" + idequipo + "', 600, 400, 6, null);";
                        string modal7 = "showPopWin('video.aspx?id=" + idequipo + "', 600, 400, 7, null);";
                        string modal8 = "showPopWin('sonido.aspx?id=" + idequipo + "', 600, 400, 8, null);";
                        string modal9 = "showPopWin('cdrom.aspx?id=" + idequipo + "', 600, 400, 9, null);";
                        Button2.Attributes.Add("onclick", modal2);
                        Button3.Attributes.Add("onclick", modal3);
                        Button4.Attributes.Add("onclick", modal4);
                        Button5.Attributes.Add("onclick", modal5);
                        Button6.Attributes.Add("onclick", modal6);
                        Button7.Attributes.Add("onclick", modal7);
                        Button8.Attributes.Add("onclick", modal8);
                        Button9.Attributes.Add("onclick", modal9);
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
        protected void controles(object sender,  EventArgs e)
        {

            htdisp.Items.Clear();
            int Stipo = Convert.ToInt16(tipo.SelectedValue);
            if (Stipo == 1)
            {
                soperativo.Enabled = true;
                aplicaciones.Enabled = true;
                sistemas.Enabled = true;
                observacioness.Enabled = true;
                observacionesh.Enabled = true;
                Button2.Visible = true;
                Button3.Visible = true;
                Button4.Visible = true;
                Button5.Visible = true;
                Button6.Visible = true;
                Button7.Visible = true;
                Button8.Visible = true;
                Button9.Visible = true; 
                Label3.Visible = false;
                Label4.Visible = false;
                modelo.Visible = false;
                htdisp.Visible = false;
            }
            if (Stipo == 2)
            {
                soperativo.Enabled = false;
                aplicaciones.Enabled = false;
                sistemas.Enabled = false;
                observacioness.Enabled = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
                Button6.Visible = false;
                Button7.Visible = false;
                Button8.Visible = false;
                Button9.Visible = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                DBConnect conector = new DBConnect();
                DataTable listado = conector.Shtdisp("2");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Rows.Count; i++)
                {
                    ListItem opcion = new ListItem();
                    opcion.Text = listado.Rows[i]["nombre"].ToString();
                    opcion.Value = listado.Rows[i]["id"].ToString();
                    htdisp.Items.Add(opcion);
                }
                htdisp.DataBind();

            }
            if (Stipo == 3)
            {
                soperativo.Enabled = false;
                aplicaciones.Enabled = false;
                sistemas.Enabled = false;
                observacioness.Enabled = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
                Button6.Visible = false;
                Button7.Visible = false;
                Button8.Visible = false;
                Button9.Visible = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                DBConnect conector = new DBConnect();
                DataTable listado = conector.Shtdisp("3");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Rows.Count; i++)
                {
                    ListItem opcion = new ListItem();
                    opcion.Text = listado.Rows[i]["nombre"].ToString();
                    opcion.Value = listado.Rows[i]["id"].ToString();
                    htdisp.Items.Add(opcion);
                }

                htdisp.DataBind();

            }
            if (Stipo == 4)
            {
                soperativo.Enabled = false;
                aplicaciones.Enabled = false;
                sistemas.Enabled = false;
                observacioness.Enabled = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
                Button6.Visible = false;
                Button7.Visible = false;
                Button8.Visible = false;
                Button9.Visible = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                DBConnect conector = new DBConnect();
                DataTable listado = conector.Shtdisp("4");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Rows.Count; i++)
                {
                    ListItem opcion = new ListItem();
                    opcion.Text = listado.Rows[i]["nombre"].ToString();
                    opcion.Value = listado.Rows[i]["id"].ToString();
                    htdisp.Items.Add(opcion);
                }
                htdisp.DataBind();

            }
            if (Stipo == 5)
            {
                soperativo.Enabled = false;
                aplicaciones.Enabled = false;
                sistemas.Enabled = false;
                observacioness.Enabled = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
                Button6.Visible = false;
                Button7.Visible = false;
                Button8.Visible = false;
                Button9.Visible = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                DBConnect conector = new DBConnect();
                DataTable listado = conector.Shtdisp("5");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Rows.Count; i++)
                {
                    ListItem opcion = new ListItem();
                    opcion.Text = listado.Rows[i]["nombre"].ToString();
                    opcion.Value = listado.Rows[i]["id"].ToString();
                    htdisp.Items.Add(opcion);
                }
                htdisp.DataBind();
            }
            if (Stipo == 6)
            {
                soperativo.Enabled = false;
                aplicaciones.Enabled = false;
                sistemas.Enabled = false;
                observacioness.Enabled = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
                Button6.Visible = false;
                Button7.Visible = false;
                Button8.Visible = false;
                Button9.Visible = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                DBConnect conector = new DBConnect();
                DataTable listado = conector.Shtdisp("6");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Rows.Count; i++)
                {
                    ListItem opcion = new ListItem();
                    opcion.Text = listado.Rows[i]["nombre"].ToString();
                    opcion.Value = listado.Rows[i]["id"].ToString();
                    htdisp.Items.Add(opcion);
                }
                htdisp.DataBind();

            }
            if (Stipo == 15)
            {
                soperativo.Enabled = false;
                aplicaciones.Enabled = false;
                sistemas.Enabled = false;
                observacioness.Enabled = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
                Button6.Visible = false;
                Button7.Visible = false;
                Button8.Visible = false;
                Button9.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                modelo.Visible = false;
                htdisp.Visible = false;
            }
        } 
        protected void Guardar(object sender, EventArgs e)
        {
                string Vserial = serial.Text;
                string Vmarca = marca.Text;
                string Vnombre = nombre.Text;
                string Vnumero = numero.Text;
                string Vtipo = tipo.SelectedValue;
                string Vresponsable = responsable.Text;
                string Vdepartamento = departamento.SelectedValue;
                string Vsoperativo = soperativo.SelectedValue;
                string Vaplicaciones = aplicaciones.Text;
                string Vsistemas = sistemas.Text;
                string Vobservacioness = observacioness.Text;
                string Vobservacionesh = observacionesh.Text;
                string Vram = ram.Value;
                string Vdd = dd.Value;
                string Vprocesador = procesador.Value;
                string Vmb = motherboard.Value;
                string Vvideo = video.Value;
                string Vsonido = sonido.Value;
                string Vlan = lan.Value;
                string Vcdrom = cdrom.Value;
                string idequipo=HiddenField1.Value;
                string Vmodelo = modelo.Text;
                string Vhtdisp = htdisp.SelectedValue; 
                DBConnect conector = new DBConnect();
                DataTable tempdd = (DataTable)Session["temporal"];
                tempdd.DefaultView.RowFilter = string.Format("htipo = 7");
                DataTable DTdiscoduro = tempdd.DefaultView.ToTable();
                DataTable tempram = (DataTable)Session["temporal"];
                tempdd.DefaultView.RowFilter = string.Format("htipo = 9");
                DataTable DTram = tempram.DefaultView.ToTable();
                DataTable tempcpu = (DataTable)Session["temporal"];
                tempdd.DefaultView.RowFilter = string.Format("htipo = 10");
                DataTable DTprocesador = tempcpu.DefaultView.ToTable();
                DataTable tempmb = (DataTable)Session["temporal"];
                tempmb.DefaultView.RowFilter = string.Format("htipo = 11");
                DataTable DTmb = tempmb.DefaultView.ToTable();
                DataTable templan = (DataTable)Session["temporal"];
                templan.DefaultView.RowFilter = string.Format("htipo = 12");
                DataTable DTlan = tempmb.DefaultView.ToTable();
                DataTable tempvideo = (DataTable)Session["temporal"];
                tempvideo.DefaultView.RowFilter = string.Format("htipo = 8");
                DataTable DTvideo = tempvideo.DefaultView.ToTable();
                DataTable tempsonido = (DataTable)Session["temporal"];
                tempsonido.DefaultView.RowFilter = string.Format("htipo = 14");
                DataTable DTsonido = tempsonido.DefaultView.ToTable();
                DataTable tempcdrom = (DataTable)Session["temporal"];
                tempcdrom.DefaultView.RowFilter = string.Format("htipo = 16");
                DataTable DTcdrom = tempcdrom.DefaultView.ToTable();
                int idd = DTdiscoduro.Rows.Count;
                int iram = DTram.Rows.Count;
                int icpu = DTprocesador.Rows.Count;
                int imb = DTmb.Rows.Count;
                int ilan = DTlan.Rows.Count;
                int ivid = DTvideo.Rows.Count;
                int ison = DTsonido.Rows.Count;
                int icd = DTcdrom.Rows.Count;
                if (Vtipo == "0")
                {
                    Label1.Text = "Falto seleccionar el tipo de equipo";
                }
                else
                {
                    if (Vtipo == "1")
                    {

                        if (
                            (iram == 0) |
                            (idd == 0) |
                            (icpu == 0) |
                            (imb == 0) |
                            (icd == 0) |
                            (ivid == 0) |
                            (ison == 0) |
                            (ilan == 0) |
                            (Vram == "0") |
                            (Vdd == "0") |
                            (Vprocesador == "0") |
                            (Vmb == "0") |
                            (Vcdrom == "0") |
                            (Vvideo == "0") |
                            (Vsonido == "0") |
                            (Vlan == "0") |
                            (Vserial=="") |
                            (Vmarca=="") |
                            (Vnombre=="") |
                            (Vnumero=="") |
                            (Vtipo=="") |
                            (Vresponsable=="") |
                            (Vdepartamento=="") |
                            (Vsoperativo=="") |
                            (Vaplicaciones=="") |
                            (Vsistemas=="") |
                            (Vobservacioness=="") |
                            (Vobservacionesh=="") 
                            )
                        {
                            if ((Vram == "0") | (iram == 0))
                            {
                                Button3.Attributes.Add("class","buttonserror");
                            }
                            if ((Vdd == "0") | (idd == 0))
                            {
                                Button2.Attributes.Add("class", "buttonserror");
                            }
                            if ((Vprocesador == "0") | (icpu == 0))
                            {
                                Button4.Attributes.Add("class", "buttonserror");
                            }
                            if ((Vmb == "0") | (imb == 0))
                            {
                                Button5.Attributes.Add("class", "buttonserror");
                            }
                            if ((Vcdrom == "0") | (icd == 0))
                            {
                                Button9.Attributes.Add("class", "buttonserror");
                            }
                            if ((Vvideo == "0") | (ivid == 0))
                            {
                                Button7.Attributes.Add("class", "buttonserror");
                            }
                            if ((Vsonido == "0") | (ison == 0))
                            {
                                Button8.Attributes.Add("class", "buttonserror");
                            }
                            if ((Vlan == "0") | (ilan == 0))
                            {
                                Button6.Attributes.Add("class", "buttonserror");
                            }
                            if (Vserial == "")
                            {
                                serial.CssClass = "campoerror";
                            }
                            if (Vmarca=="")
                            {
                                marca.CssClass = "campoerror";
                            }
                            if (Vnombre=="") 
                            {
                                nombre.CssClass = "campoerror";
                            }
                            if (Vnumero=="")
                            {
                                numero.CssClass = "campoerror";
                            }
                            if (Vtipo=="0") 
                            {
                                tipo.ControlStyle.CssClass = "selecterror";
                            }
                            if (Vresponsable=="")
                            {
                                responsable.CssClass = "campoerror";
                            }
                            if (Vdepartamento=="0")
                            {
                                departamento.ControlStyle.CssClass = "selecterror";
                            }
                            if (Vsoperativo=="0")
                            {
                                soperativo.ControlStyle.CssClass = "selecterror";
                            }
                            if (Vaplicaciones=="")
                            {
                                aplicaciones.CssClass = "observacioneserror";
                            }
                            if (Vsistemas=="")
                            {
                                sistemas.CssClass = "observacioneserror";
                            }
                            if (Vobservacioness=="")
                            {
                                observacioness.CssClass = "observacioneserror";
                            }
                            if (Vobservacionesh == "")
                            {
                                observacionesh.CssClass = "observacioneserror";
                            }
                            Label1.Text = "No se ha completado la informacion de los componentes internos del equipo!!";
                        }
                        else
                        {
                            string idsoft = Convert.ToString(conector.ISoftware(Vsoperativo, Vaplicaciones, Vsistemas, Vobservacioness));
                            Label2.Text = conector.IEquipo(idequipo, Vserial, Vmarca, Vnumero, Vtipo, Vresponsable, Vdepartamento, Vobservacionesh, Vnombre, "1", idsoft, Vmodelo, Vhtdisp);
                            DataTable temporales = (DataTable)Session["temporal"];
                            int reg = temporales.Rows.Count;
                            int j = 0;
                            for (j = 0; j < reg; j++)
                            {
                                string iddisp = temporales.Rows[j]["hequipo"].ToString() + temporales.Rows[j]["id"].ToString();
                                conector.IDispositivo(iddisp,
                                    temporales.Rows[j]["serial"].ToString(),
                                    temporales.Rows[j]["marca"].ToString(),
                                    temporales.Rows[j]["numero"].ToString(),
                                    temporales.Rows[j]["htdispositivo"].ToString(),
                                    temporales.Rows[j]["capacidad"].ToString(),
                                    temporales.Rows[j]["htipo"].ToString(),
                                    temporales.Rows[j]["hequipo"].ToString(), 
                                    temporales.Rows[j]["hcapacidadram"].ToString());
                            }
                            temporales.Dispose();
                            temporales.Columns.Clear();
                            Response.Redirect("insert.aspx?hmenu=" + vhmenu.Value);
                        }
                    }
                    else
                    {
                        if (
                            (Vserial == "") |
                            (Vmarca == "") |
                            (Vnombre == "") |
                            (Vnumero == "") |
                            (Vtipo == "") |
                            (Vresponsable == "") |
                            (Vdepartamento == "") |
                            (Vobservacionesh == "") |
                            (Vmodelo == "") |
                            (Vhtdisp == "0")
                            )
                        {
                            if (Vserial == "")
                            {
                                serial.CssClass = "campoerror";
                            }
                            if (Vmarca == "")
                            {
                                marca.CssClass = "campoerror";
                            }
                            if (Vnombre == "")
                            {
                                nombre.CssClass = "campoerror";
                            }
                            if (Vnumero == "")
                            {
                                numero.CssClass = "campoerror";
                            }
                            if (Vtipo == "0")
                            {
                                tipo.Attributes.Add("CssClass", "selecterror");
                            }
                            if (Vresponsable == "")
                            {
                                responsable.CssClass = "campoerror";
                            }
                            if (Vdepartamento == "")
                            {
                                departamento.Attributes.Add("CssClass", "selecterror");
                            }
                            if (Vobservacionesh == "")
                            {
                                observacionesh.CssClass = "observacioneserror";
                            }
                            if (Vmodelo == "")
                            {
                                modelo.CssClass = "campoerror";
                            }
                            if (Vhtdisp == "")
                            {
                                htdisp.Attributes.Add("CssClass","selecterror");
                            } 
                            Label1.Text = "No se ha completado la informacion de los componentes internos del equipo!!";
                        }
                        else
                        {
                            Label2.Text = conector.IEquipo(idequipo, Vserial, Vmarca, Vnumero, Vtipo, Vresponsable, Vdepartamento, Vobservacionesh, Vnombre, "1", "0", Vmodelo, Vhtdisp);
                            Response.Redirect("insert.aspx?hmenu=" + vhmenu.Value);
                        }
                    }
                }
        }
    
    }
}
