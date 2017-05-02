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
                RFVsoperativo.Enabled = false;
                RFVaplicaciones.Enabled = false;
                RFVsistemas.Enabled = false;
                RFVhtdisp.Enabled = false;
                RFVmodelo.Enabled = false;
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
                    DBConnect conector = new DBConnect();
                    List<string[]> listado = conector.SAllDepartamentos();
                    ListItem opciond = new ListItem();
                    opciond.Text = "Seleccione";
                    opciond.Value = "0";
                    departamento.Items.Add(opciond);
                    for (int i = 0; i < listado.Count; i++)
                    {
                        string[] lista = new string[2];
                        lista = listado[i];
                        ListItem opcion = new ListItem();
                        opcion.Text = lista[1];
                        opcion.Value = lista[0];
                        departamento.Items.Add(opcion);
                        lista = null;
                    }
                    departamento.DataBind();
                    DBConnect conector2 = new DBConnect();
                    List<string[]> listado2 = conector2.SAllTipoequipo();
                    ListItem opciont = new ListItem();
                    opciont.Text = "Seleccione";
                    opciont.Value = "0";
                    tipo.Items.Add(opciont);
                    for (int i = 0; i < listado2.Count; i++)
                    {
                        string[] lista2 = new string[2];
                        lista2 = listado2[i];
                        ListItem opciont2 = new ListItem();
                        opciont2.Text = lista2[1];
                        opciont2.Value = lista2[0];
                        tipo.Items.Add(opciont2);
                        lista2 = null;
                    }
                    tipo.DataBind();
                    DBConnect conector3 = new DBConnect();
                    List<string[]> listado3 = conector3.SAllSoperativo();
                    ListItem opcions = new ListItem();
                    opcions.Text = "Seleccione";
                    opcions.Value = "0";
                    soperativo.Items.Add(opcions);
                    for (int i = 0; i < listado3.Count; i++)
                    {
                        string[] lista3 = new string[2];
                        lista3 = listado3[i];
                        ListItem opcions2 = new ListItem();
                        opcions2.Text = lista3[1];
                        opcions2.Value = lista3[0];
                        soperativo.Items.Add(opcions2);
                        lista3 = null;
                    }
                    soperativo.DataBind();
                    DBConnect conector4 = new DBConnect();
                    string idequipo = Convert.ToString(conector4.IDequipo());
                    HiddenField1.Value = idequipo;
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
            }

        }
        protected void controles(object sender, EventArgs e)
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
                RFVsoperativo.Enabled = true;
                RFVaplicaciones.Enabled = true;
                RFVsistemas.Enabled = true;
                Label3.Visible = false;
                Label4.Visible = false;
                modelo.Visible = false;
                htdisp.Visible = false;
                RFVhtdisp.Enabled = false;
                RFVmodelo.Enabled = false;
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
                RFVsoperativo.Enabled = false;
                RFVaplicaciones.Enabled = false;
                RFVsistemas.Enabled = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                RFVhtdisp.Enabled = true;
                RFVmodelo.Enabled = true;
                DBConnect conector = new DBConnect();
                List<string[]> listado = conector.Shtdisp("2");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Count; i++)
                {
                    string[] lista = new string[2];
                    lista = listado[i];
                    ListItem opcion = new ListItem();
                    opcion.Text = lista[1];
                    opcion.Value = lista[0];
                    htdisp.Items.Add(opcion);
                    lista = null;
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
                RFVsoperativo.Enabled = false;
                RFVaplicaciones.Enabled = false;
                RFVsistemas.Enabled = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                RFVhtdisp.Enabled = true;
                RFVmodelo.Enabled = true;
                DBConnect conector = new DBConnect();
                List<string[]> listado = conector.Shtdisp("3");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Count; i++)
                {
                    string[] lista = new string[2];
                    lista = listado[i];
                    ListItem opcion = new ListItem();
                    opcion.Text = lista[1];
                    opcion.Value = lista[0];
                    htdisp.Items.Add(opcion);
                    lista = null;
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
                RFVsoperativo.Enabled = false;
                RFVaplicaciones.Enabled = false;
                RFVsistemas.Enabled = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                RFVhtdisp.Enabled = true;
                RFVmodelo.Enabled = true;
                DBConnect conector = new DBConnect();
                List<string[]> listado = conector.Shtdisp("4");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Count; i++)
                {
                    string[] lista = new string[2];
                    lista = listado[i];
                    ListItem opcion = new ListItem();
                    opcion.Text = lista[1];
                    opcion.Value = lista[0];
                    htdisp.Items.Add(opcion);
                    lista = null;
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
                RFVsoperativo.Enabled = false;
                RFVaplicaciones.Enabled = false;
                RFVsistemas.Enabled = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                RFVhtdisp.Enabled = true;
                RFVmodelo.Enabled = true;
                DBConnect conector = new DBConnect();
                List<string[]> listado = conector.Shtdisp("5");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Count; i++)
                {
                    string[] lista = new string[2];
                    lista = listado[i];
                    ListItem opcion = new ListItem();
                    opcion.Text = lista[1];
                    opcion.Value = lista[0];
                    htdisp.Items.Add(opcion);
                    lista = null;
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
                RFVsoperativo.Enabled = false;
                RFVaplicaciones.Enabled = false;
                RFVsistemas.Enabled = false;
                Label3.Visible = true;
                Label4.Visible = true;
                modelo.Visible = true;
                htdisp.Visible = true;
                RFVhtdisp.Enabled = true;
                RFVmodelo.Enabled = true;
                DBConnect conector = new DBConnect();
                List<string[]> listado = conector.Shtdisp("6");
                ListItem opciond = new ListItem();
                opciond.Text = "Seleccione";
                opciond.Value = "0";
                htdisp.Items.Add(opciond);
                for (int i = 0; i < listado.Count; i++)
                {
                    string[] lista = new string[2];
                    lista = listado[i];
                    ListItem opcion = new ListItem();
                    opcion.Text = lista[1];
                    opcion.Value = lista[0];
                    htdisp.Items.Add(opcion);
                    lista = null;
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
                RFVsoperativo.Enabled = false;
                RFVaplicaciones.Enabled = false;
                RFVsistemas.Enabled = false;
                Label3.Visible = false;
                Label4.Visible = false;
                modelo.Visible = false;
                htdisp.Visible = false;
                RFVhtdisp.Enabled = false;
                RFVmodelo.Enabled = false;

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
                if (Vmodelo == "")
                {
                    Vmodelo="0";
                }
                if (Vhtdisp == "")
                {
                    Vhtdisp = "0";
                }
                if (Vtipo == "1")
                {
                    if ((Vram == "0") || (Vdd == "0") || (Vprocesador == "0") || (Vmb == "0") || (Vcdrom == "0") || (Vvideo == "0") || (Vsonido == "0") || (Vlan == "0"))
                    {
                            Label1.Text = "No se ha completado la informacion de los componentes internos del equipo!!";
                    }
                    else
                    {
                        string idsoft = Convert.ToString(conector.ISoftware(Vsoperativo, Vaplicaciones, Vsistemas, Vobservacioness));
                        Label2.Text=conector.IEquipo(idequipo, Vserial, Vmarca, Vnumero, Vtipo, Vresponsable, Vdepartamento, Vobservacionesh, Vnombre, "1", idsoft, Vmodelo, Vhtdisp);
                        DataTable temporales = conector.SAlltemporal(idequipo);
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
                                    temporales.Rows[j]["hequipo"].ToString());
                            }
                         conector.EliminarTemp(idequipo);
                         Response.Redirect("insert.aspx");
                      }
                }
                else
                {
                    Label2.Text = conector.IEquipo(idequipo, Vserial, Vmarca, Vnumero, Vtipo, Vresponsable, Vdepartamento, Vobservacionesh, Vnombre, "1", "0", Vmodelo, Vhtdisp);
                    Response.Redirect("insert.aspx");
                }
        }
        protected void discoduro(object sender, EventArgs e)
        {
            Modal.verDiscoduro(this, "dd",HiddenField1.Value);
        }
        protected void vram(object sender, EventArgs e)
        {
            Modal.verRam(this, "ram", HiddenField1.Value);
        }
        protected void vprocesador(object sender, EventArgs e)
        {
            Modal.verProcesador(this, "procesador", HiddenField1.Value);
        }
        protected void vmotherboard(object sender, EventArgs e)
        {
            Modal.verMotherBoard(this, "motherboard", HiddenField1.Value);
        }
        protected void vlan(object sender, EventArgs e)
        {
            Modal.verLAN(this, "lan", HiddenField1.Value);
        }
        protected void vvideo(object sender, EventArgs e)
        {
            Modal.verVideo(this, "video", HiddenField1.Value);
        }
        protected void vsonido(object sender, EventArgs e)
        {
            Modal.verSonido(this, "sonido", HiddenField1.Value);
        }
        protected void vcdrom(object sender, EventArgs e)
        {
            Modal.verCdRom(this, "cdrom", HiddenField1.Value);
        }
        protected void activar(object sender, EventArgs e)
        {
            Button1.Enabled = true;
        }
    }
}
