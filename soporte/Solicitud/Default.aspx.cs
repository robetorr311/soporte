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
namespace soporte.Solicitud
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!IsPostBack)
                {
                    rbcpu.Enabled = false;
                    rbcr.Enabled = false;
                    rbimp.Enabled = false;
                    rbmou.Enabled = false;
                    rbtec.Enabled = false;
                    rbci.Enabled = false;
                    rbmon.Enabled = false;
                    rbreg.Enabled = false;
                    rbss.Enabled = false;
                    rbsa.Enabled = false;
                    rbso.Enabled = false;
                    rbapp.Enabled = false;
                    rboff.Enabled = false;
                    rbotr.Enabled = false;
                    rbswit.Enabled = false;
                    fallasoft.Enabled = false;
                    DateTime dt = DateTime.Now;
                    int d = dt.Day;
                    int m = dt.Month;
                    int y = dt.Year;
                    string dia;
                    string mes;
                    if (d < 10)
                    {
                        dia = "0" + Convert.ToString(d);
                    }
                    else
                    {
                        dia = Convert.ToString(d);
                    }
                    if (m < 10)
                    {
                        mes = "0" + Convert.ToString(m);
                    }
                    else
                    {
                        mes = Convert.ToString(m);
                    }
                    lblfecha.Text = dia + "/" + mes + "/" + y;
                    string menu = Server.HtmlEncode(Request.QueryString["menu"]);
                    if (menu == "1")
                    {
                        if (Session["Session"] != null)
                        {
                            string nombre2 = (string)this.Session["Nbr"];
                            string nombusuario2 = (string)this.Session["Us"];
                            string nivel2 = (string)this.Session["Nvl"];
                            string hdep2 = (string)this.Session["hdep"];
                            DBConnect conector = new DBConnect();
                            string hmenu = Server.HtmlEncode(Request.QueryString["hmenu"]);
                            vhmenu.Value = hmenu;
                            string nombusuario = (string)this.Session["Us"];
                            conector.IAuditoria(nombusuario, hmenu);
                            DataTable depart = conector.SDep(hdep2);
                            ListItem opciond = new ListItem();
                            opciond.Text = depart.Rows[0]["nombre"].ToString();
                            opciond.Value = depart.Rows[0]["id"].ToString();
                            departamento.Items.Add(opciond);
                            departamento.DataBind();
                            departamento.Enabled = false;
                            DataTable listado2 = conector.SAllTipoequipo();
                            ListItem opciont = new ListItem();
                            opciont.Text = "Seleccione";
                            opciont.Value = "0";
                            htipo.Items.Add(opciont);
                            for (int i = 0; i < listado2.Rows.Count; i++)
                            {
                                ListItem opciont2 = new ListItem();
                                opciont2.Text = listado2.Rows[i]["nombre"].ToString();
                                opciont2.Value = listado2.Rows[i]["id"].ToString();
                                htipo.Items.Add(opciont2);
                            }
                            htipo.DataBind();
                            solicitante.Text = nombre2;
                            solicitante.Enabled = false;
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
                nequipo.Items.Clear();
                DBConnect conector = new DBConnect();
                DataTable telefono = conector.StelDepartamentos(departamento.SelectedValue);
                for (int i = 0; i < telefono.Rows.Count; i++)
                {
                    lbltelefono.Text = telefono.Rows[i][0].ToString();
                }
                ListItem opcioneq = new ListItem();
                opcioneq.Text = "Seleccione";
                opcioneq.Value = "0";
                nequipo.Items.Add(opcioneq);
                DataTable datos = conector.SAllequiposdep(hdep2, nivel2);
                DataTable datos2 = conector.SelectSwitcheDep(hdep2, nivel2);
                DataTable datos3 = new DataTable();
                DataColumn columna1 = new DataColumn("Id");
                DataColumn columna2 = new DataColumn("Nombre");
                columna1.AllowDBNull = true;
                columna2.AllowDBNull = true;
                datos3.Columns.Add(columna1);
                datos3.Columns.Add(columna2);
                int rec = 0;
                if (datos.Rows.Count > 0)
                {
                    for (rec = 0; rec < datos.Rows.Count; rec++)
                    {
                        DataRow dr = datos3.NewRow();
                        dr["Id"] = datos.Rows[rec]["Id"].ToString();
                        dr["Nombre"] = datos.Rows[rec]["Nombre"].ToString(); ;
                        datos3.Rows.Add(dr);
                    }
                    if (datos2.Rows.Count > 0)
                    {
                        rec = 0;
                        for (rec = 0; rec < datos2.Rows.Count; rec++)
                        {
                            DataRow dr = datos3.NewRow();
                            dr["Id"] = datos2.Rows[rec]["Id"].ToString();
                            dr["Nombre"] = datos2.Rows[rec]["Nombre"].ToString(); ;
                            datos3.Rows.Add(dr);
                        }
                    }
                }
                rec = 0;
                if (datos3.Rows.Count > 0)
                {
                    for (rec = 0; rec < datos3.Rows.Count; rec++)
                    {
                        ListItem opcion2 = new ListItem();
                        opcion2.Text = datos3.Rows[rec]["Nombre"].ToString();
                        opcion2.Value = datos3.Rows[rec]["Id"].ToString();
                        nequipo.Items.Add(opcion2);
                    }
                    nequipo.DataBind();
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
        protected void cambiatipo(object sender, EventArgs e)
        {
            DBConnect conector2 = new DBConnect();
            DataTable cpu = conector2.Selecthtipo(nequipo.SelectedItem.Text, "1");
            DataTable monitor = conector2.Selecthtipo(nequipo.SelectedItem.Text, "2");
            DataTable teclado = conector2.Selecthtipo(nequipo.SelectedItem.Text, "3");
            DataTable mouse = conector2.Selecthtipo(nequipo.SelectedItem.Text, "4");
            DataTable impresora = conector2.Selecthtipo(nequipo.SelectedItem.Text, "5");
            DataTable regulador = conector2.Selecthtipo(nequipo.SelectedItem.Text, "6");
            DataTable switche = conector2.Selecthtipo(nequipo.SelectedItem.Text, "15");
            htipo.Items.Clear();
            ListItem opciont = new ListItem();
            opciont.Text = "Seleccione";
            opciont.Value = "0";
            htipo.Items.Add(opciont);
            if (cpu.Rows.Count > 0)
            {
                ListItem opciont2 = new ListItem();
                opciont2.Text = "CPU";
                opciont2.Value = "1";
                htipo.Items.Add(opciont2);
            }
            if (monitor.Rows.Count > 0)
            {
                ListItem opciont2 = new ListItem();
                opciont2.Text = "MONITOR";
                opciont2.Value = "2";
                htipo.Items.Add(opciont2);
            }
            if (teclado.Rows.Count > 0)
            {
                ListItem opciont2 = new ListItem();
                opciont2.Text = "TECLADO";
                opciont2.Value = "3";
                htipo.Items.Add(opciont2);
            }
            if (mouse.Rows.Count > 0)
            {
                ListItem opciont2 = new ListItem();
                opciont2.Text = "MOUSE";
                opciont2.Value = "4";
                htipo.Items.Add(opciont2);
            }
            if (impresora.Rows.Count > 0)
            {
                ListItem opciont2 = new ListItem();
                opciont2.Text = "IMPRESORA";
                opciont2.Value = "5";
                htipo.Items.Add(opciont2);
            }
            if (regulador.Rows.Count > 0)
            {
                ListItem opciont2 = new ListItem();
                opciont2.Text = "REGULADOR";
                opciont2.Value = "6";
                htipo.Items.Add(opciont2);
            }
            if (switche.Rows.Count > 0)
            {
                ListItem opciont2 = new ListItem();
                opciont2.Text = "SWITCHE (RED)";
                opciont2.Value = "15";
                htipo.Items.Add(opciont2);
            }
            htipo.DataBind();
        }
        protected void controles(object sender, EventArgs e)
        {
            if (Session["Session"] != null)
            {
                string nombre2 = (string)this.Session["Nbr"];
                string nombusuario2 = (string)this.Session["Us"];
                string nivel2 = (string)this.Session["Nvl"];
                string hdep2 = (string)this.Session["hdep"];
                nequipo.Items.Clear();
                int rec = 0;
                DBConnect conector = new DBConnect();
                if (htipo.SelectedValue == "1")
                {
                    ListItem opcioneq = new ListItem();
                    DataTable equipos = conector.SAllequiposdep(departamento.SelectedValue, nivel2);
                    opcioneq.Text = "Seleccione";
                    opcioneq.Value = "0";
                    nequipo.Items.Add(opcioneq);
                    for (rec = 0; rec < equipos.Rows.Count; rec++)
                    {
                        ListItem opcioneq2 = new ListItem();
                        opcioneq2.Text = equipos.Rows[rec]["Nombre"].ToString();
                        opcioneq2.Value = equipos.Rows[rec]["Id"].ToString();
                        nequipo.Items.Add(opcioneq2);
                    }
                    nequipo.DataBind();
                    rbcpu.Enabled = true;
                    rbcr.Checked = false;
                    rbimp.Checked = false;
                    rbmou.Checked = false;
                    rbtec.Checked = false;
                    rbci.Checked = false;
                    rbmon.Checked = false;
                    rbreg.Checked = false;
                    rbswit.Checked = false;
                    rbss.Enabled = true;
                    rbsa.Enabled = true;
                    rbso.Enabled = true;
                    rbapp.Enabled = true;
                    rboff.Enabled = true;
                    rbotr.Enabled = true;
                    fallasoft.Enabled = true;
                }
                if (htipo.SelectedValue == "2")
                {
                    ListItem opcioneq = new ListItem();
                    DataTable equipos = conector.SVPerifericosDep("2", departamento.SelectedValue, nivel2);
                    opcioneq.Text = "Seleccione";
                    opcioneq.Value = "0";
                    nequipo.Items.Add(opcioneq);
                    for (rec = 0; rec < equipos.Rows.Count; rec++)
                    {
                        ListItem opcioneq2 = new ListItem();
                        opcioneq2.Text = equipos.Rows[rec]["Nombre"].ToString();
                        opcioneq2.Value = equipos.Rows[rec]["Id"].ToString();
                        nequipo.Items.Add(opcioneq2);
                    }
                    nequipo.DataBind();
                    rbcpu.Checked = false;
                    rbcr.Checked = false;
                    rbimp.Checked = false;
                    rbmou.Checked = false;
                    rbtec.Checked = false;
                    rbci.Checked = false;
                    rbswit.Checked = false;
                    rbmon.Checked = true;
                    rbreg.Checked = false;
                    rbss.Enabled = false;
                    rbsa.Enabled = false;
                    rbso.Enabled = false;
                    rbapp.Enabled = false;
                    rboff.Enabled = false;
                    rbotr.Enabled = false;
                    fallasoft.Enabled = false;
                }
                if (htipo.SelectedValue == "3")
                {
                    ListItem opcioneq = new ListItem();
                    DataTable equipos = conector.SVPerifericosDep("3", departamento.SelectedValue, nivel2);
                    opcioneq.Text = "Seleccione";
                    opcioneq.Value = "0";
                    nequipo.Items.Add(opcioneq);
                    for (rec = 0; rec < equipos.Rows.Count; rec++)
                    {
                        ListItem opcioneq2 = new ListItem();
                        opcioneq2.Text = equipos.Rows[rec]["Nombre"].ToString();
                        opcioneq2.Value = equipos.Rows[rec]["Id"].ToString();
                        nequipo.Items.Add(opcioneq2);
                    }
                    nequipo.DataBind();
                    rbcpu.Checked = false;
                    rbcr.Checked = false;
                    rbimp.Checked = false;
                    rbmou.Checked = false;
                    rbtec.Checked = true;
                    rbci.Checked = false;
                    rbswit.Checked = false;
                    rbmon.Checked = false;
                    rbreg.Checked = false;
                    rbss.Enabled = false;
                    rbsa.Enabled = false;
                    rbso.Enabled = false;
                    rbapp.Enabled = false;
                    rboff.Enabled = false;
                    rbotr.Enabled = false;
                    fallasoft.Enabled = false;
                }
                if (htipo.Text == "4")
                {
                    ListItem opcioneq = new ListItem();
                    DataTable equipos = conector.SVPerifericosDep("4", departamento.SelectedValue, nivel2);
                    opcioneq.Text = "Seleccione";
                    opcioneq.Value = "0";
                    nequipo.Items.Add(opcioneq);
                    for (rec = 0; rec < equipos.Rows.Count; rec++)
                    {
                        ListItem opcioneq2 = new ListItem();
                        opcioneq2.Text = equipos.Rows[rec]["Nombre"].ToString();
                        opcioneq2.Value = equipos.Rows[rec]["Id"].ToString();
                        nequipo.Items.Add(opcioneq2);
                    }
                    nequipo.DataBind();
                    rbcpu.Checked = false;
                    rbcr.Checked = false;
                    rbimp.Checked = false;
                    rbmou.Checked = true;
                    rbtec.Checked = false;
                    rbci.Checked = false;
                    rbswit.Checked = false;
                    rbmon.Checked = false;
                    rbreg.Checked = false;
                    rbss.Enabled = false;
                    rbsa.Enabled = false;
                    rbso.Enabled = false;
                    rbapp.Enabled = false;
                    rboff.Enabled = false;
                    rbotr.Enabled = false;
                    fallasoft.Enabled = false;
                }
                if (htipo.SelectedValue == "5")
                {
                    ListItem opcioneq = new ListItem();
                    DataTable equipos = conector.SVPerifericosDep("5", departamento.SelectedValue, nivel2);
                    opcioneq.Text = "Seleccione";
                    opcioneq.Value = "0";
                    nequipo.Items.Add(opcioneq);
                    for (rec = 0; rec < equipos.Rows.Count; rec++)
                    {
                        ListItem opcioneq2 = new ListItem();
                        opcioneq2.Text = equipos.Rows[rec]["Nombre"].ToString();
                        opcioneq2.Value = equipos.Rows[rec]["Id"].ToString();
                        nequipo.Items.Add(opcioneq2);
                    }
                    nequipo.DataBind();
                    rbcpu.Checked = false;
                    rbcr.Checked = false;
                    rbimp.Checked = true;
                    rbmou.Checked = false;
                    rbtec.Checked = false;
                    rbci.Checked = false;
                    rbmon.Checked = false;
                    rbswit.Checked = false;
                    rbreg.Checked = false;
                    rbss.Enabled = false;
                    rbsa.Enabled = false;
                    rbso.Enabled = false;
                    rbapp.Enabled = false;
                    rboff.Enabled = false;
                    rbotr.Enabled = false;
                    fallasoft.Enabled = false;
                }
                if (htipo.SelectedValue == "6")
                {
                    ListItem opcioneq = new ListItem();
                    DataTable equipos = conector.SVPerifericosDep("6", departamento.SelectedValue, nivel2);
                    opcioneq.Text = "Seleccione";
                    opcioneq.Value = "0";
                    nequipo.Items.Add(opcioneq);
                    for (rec = 0; rec < equipos.Rows.Count; rec++)
                    {
                        ListItem opcioneq2 = new ListItem();
                        opcioneq2.Text = equipos.Rows[rec]["Nombre"].ToString();
                        opcioneq2.Value = equipos.Rows[rec]["Id"].ToString();
                        nequipo.Items.Add(opcioneq2);
                    }
                    nequipo.DataBind();
                    rbcpu.Checked = false;
                    rbcr.Checked = false;
                    rbimp.Checked = false;
                    rbmou.Checked = false;
                    rbswit.Checked = false;
                    rbtec.Checked = false;
                    rbci.Checked = false;
                    rbmon.Checked = false;
                    rbreg.Checked = true;
                    rbss.Enabled = false;
                    rbsa.Enabled = false;
                    rbso.Enabled = false;
                    rbapp.Enabled = false;
                    rboff.Enabled = false;
                    rbotr.Enabled = false;
                    fallasoft.Enabled = false;
                }
                if (htipo.SelectedValue == "15")
                {
                    ListItem opcioneq = new ListItem();
                    DataTable equipos = conector.SVPerifericosDep("15", departamento.SelectedValue, nivel2);
                    opcioneq.Text = "Seleccione";
                    opcioneq.Value = "0";
                    nequipo.Items.Add(opcioneq);
                    for (rec = 0; rec < equipos.Rows.Count; rec++)
                    {
                        ListItem opcioneq2 = new ListItem();
                        opcioneq2.Text = equipos.Rows[rec]["Nombre"].ToString();
                        opcioneq2.Value = equipos.Rows[rec]["Id"].ToString();
                        nequipo.Items.Add(opcioneq2);
                    }
                    nequipo.DataBind();
                    Label1.Text = "";
                    rbcpu.Checked = false;
                    rbcr.Checked = false;
                    rbimp.Checked = false;
                    rbmou.Checked = false;
                    rbtec.Checked = false;
                    rbci.Checked = false;
                    rbmon.Checked = false;
                    rbreg.Checked = false;
                    rbss.Enabled = false;
                    rbsa.Enabled = false;
                    rbso.Enabled = false;
                    rbapp.Enabled = false;
                    rboff.Enabled = false;
                    rbotr.Enabled = false;
                    rbswit.Checked = true;
                    fallasoft.Enabled = false;
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
        protected void Guardar(object sender, EventArgs e)
        {
            int sa=0;
            int ss = 0;
            int so = 0;
            int app = 0;
            int win = 0;
            int off = 0;
            int cpu = 0;
            int imp = 0;
            int mon = 0;
            int tec = 0;
            int mou = 0;
            int reg = 0;
            int ci = 0;
            int cr = 0;
            int otr = 0;
            int swi = 0;
            if (rbsa.Checked)
            {
                sa = 1;
            }
            if (rbss.Checked)
            {
                ss = 1;
            }
            if (rbso.Checked)
            {
                so = 1;
            }
            if (rbapp.Checked)
            {
                app = 1;
            }
            if (rboff.Checked)
            {
                off = 1;
            }
            if (rbotr.Checked)
            {
                otr = 1;
            }
            if (rbcpu.Checked)
            {
                cpu = 1;
            }
            if (rbimp.Checked)
            {
                imp = 1;
            }
            if (rbmon.Checked)
            {
                mon = 1;
            }
            if (rbtec.Checked)
            {
                tec = 1;
            }
            if (rbmou.Checked)
            {
                mou = 1;
            }
            if (rbreg.Checked)
            {
                reg = 1;
            }
            if (rbcr.Checked)
            {
                cr = 1;
            }
            if (rbci.Checked)
            {
                ci = 1;
            }
            if (rbswit.Checked)
            {
                swi = 1;
            } 
            int Vdepartamento = Convert.ToInt16(departamento.SelectedValue);
            string Vsolicitante = solicitante.Text;
            string Vfallasoft = fallasoft.Text;
            string Vfallahard = fallahard.Text;
            DBConnect conector = new DBConnect();
            DataTable datos = conector.Selecthtipo(nequipo.SelectedItem.Text, htipo.Text);
            if (datos.Rows.Count > 0)
            {
                string vid = datos.Rows[0]["id"].ToString();
                int iddoc = conector.IDocumento(Vdepartamento, Vsolicitante, Vfallasoft, cpu, imp, mon, tec, mou, reg, cr, ci, sa, ss, so, app, win, off, otr, Vfallahard, vid,nequipo.SelectedItem.Text,htipo.SelectedValue, swi);
                Response.Redirect("insert.aspx?codigo=" + iddoc + "&serial=" + iddoc + "&hmenu=" + vhmenu.Value);
            }
            else
            {
                MiMensaje.verCalendario(this, "mensaje", "Error. No existe en la Base de Datos un equipo con el nombre " + nequipo.SelectedItem.Text + "!!");
                Label1.Text = "Error. No existe en la Base de Datos un equipo con el nombre " + nequipo.SelectedItem.Text + "!!";
                ImageButton1.Enabled = false;
            }
        } 
    }
}
