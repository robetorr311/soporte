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
//            string modal = "showPopWin('frmEditaEquipos.aspx?id=" + vhidequipo.Value + "', 900, 450, null);";

namespace soporte.Consultas
{
    public partial class frmEditaEquipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Session["modal"] = "1";
                string vid = Server.HtmlEncode(Request.QueryString["id"]);
                vhequipo.Value = vid;
                FillCustomerInGrid();
            }
        }
        private void FillCustomerInGrid()
        {
            DBConnect conector = new DBConnect();
            DataTable discoduro = new DataTable();
            DataTable video = new DataTable();
            DataTable ram = new DataTable();
            DataTable procesador = new DataTable();
            DataTable motherboard = new DataTable();
            DataTable sonido = new DataTable();
            DataTable lan = new DataTable();
            DataTable cdrom = new DataTable();
            discoduro = conector.SelectComponente(vhequipo.Value, "7");
            video = conector.SelectComponente(vhequipo.Value, "8");
            ram = conector.SelectComponente(vhequipo.Value, "9");
            procesador = conector.SelectComponente(vhequipo.Value, "10");
            motherboard = conector.SelectComponente(vhequipo.Value, "11");
            sonido = conector.SelectComponente(vhequipo.Value, "12");
            lan = conector.SelectComponente(vhequipo.Value, "14");
            cdrom = conector.SelectComponente(vhequipo.Value, "16");
            DataTable datos = new DataTable();
            DataColumn columna1 = new DataColumn("Id");
            DataColumn columna2 = new DataColumn("Serial");
            DataColumn columna3 = new DataColumn("Numero");
            DataColumn columna4 = new DataColumn("Marca");
            DataColumn columna5 = new DataColumn("Capacidad");
            DataColumn columna6 = new DataColumn("Tipo");
            DataColumn columna7 = new DataColumn("Dispositivo");
            columna1.AllowDBNull = true;
            columna2.AllowDBNull = true;
            columna3.AllowDBNull = true;
            columna4.AllowDBNull = true;
            columna5.AllowDBNull = true;
            columna6.AllowDBNull = true;
            columna7.AllowDBNull = true;
            datos.Columns.Add(columna1);
            datos.Columns.Add(columna2);
            datos.Columns.Add(columna3);
            datos.Columns.Add(columna4);
            datos.Columns.Add(columna5);
            datos.Columns.Add(columna6);
            datos.Columns.Add(columna7);
            int dd = 0;
            int v = 0;
            int rm = 0;
            int cpu = 0;
            int mb = 0;
            int sn = 0;
            int net = 0;
            int cd = 0;
            if (discoduro.Rows.Count > 0)
            {
                for (dd = 0; dd < discoduro.Rows.Count; dd++)
                {
                    DataRow dr = datos.NewRow();
                    dr["Id"] = discoduro.Rows[dd]["id"].ToString();
                    dr["Serial"] = discoduro.Rows[dd]["serial"].ToString(); ;
                    dr["Numero"] = discoduro.Rows[dd]["numero"].ToString();
                    dr["Marca"] = discoduro.Rows[dd]["marca"].ToString();
                    dr["Capacidad"] = discoduro.Rows[dd]["capacidad"].ToString();
                    dr["Dispositivo"] = "Disco Duro";
                    dr["Tipo"] = conector.Buscahtdispositivo(discoduro.Rows[dd]["htdispositivo"].ToString());
                    datos.Rows.Add(dr);
                }
            }
            if (video.Rows.Count > 0)
            {
                for (v = 0; v < video.Rows.Count; v++)
                {
                    DataRow dr = datos.NewRow();
                    dr["Id"] = video.Rows[v]["id"].ToString();
                    dr["Serial"] = video.Rows[v]["serial"].ToString(); ;
                    dr["Numero"] = video.Rows[v]["numero"].ToString();
                    dr["Marca"] = video.Rows[v]["marca"].ToString();
                    dr["Capacidad"] = video.Rows[v]["modelo"].ToString();
                    dr["Dispositivo"] = "Video";
                    dr["Tipo"] = conector.Buscahtdispositivo(video.Rows[v]["htdispositivo"].ToString());
                    datos.Rows.Add(dr);
                }
            }
            if (ram.Rows.Count > 0)
            {
                for (rm = 0; rm < ram.Rows.Count; rm++)
                {
                    DataRow dr = datos.NewRow();
                    dr["Id"] = ram.Rows[rm]["id"].ToString();
                    dr["Serial"] = ram.Rows[rm]["serial"].ToString(); ;
                    dr["Numero"] = ram.Rows[rm]["numero"].ToString();
                    dr["Marca"] = ram.Rows[rm]["marca"].ToString();
                    dr["Capacidad"] = ram.Rows[rm]["capacidad"].ToString();
                    dr["Dispositivo"] = "RAM";
                    dr["Tipo"] = conector.Buscahtdispositivo(ram.Rows[rm]["htdispositivo"].ToString());
                    datos.Rows.Add(dr);
                }
            }
            if (procesador.Rows.Count > 0)
            {
                for (cpu = 0; cpu < procesador.Rows.Count; cpu++)
                {
                    DataRow dr = datos.NewRow();
                    dr["Id"] = procesador.Rows[cpu]["id"].ToString();
                    dr["Serial"] = procesador.Rows[cpu]["serial"].ToString(); ;
                    dr["Numero"] = procesador.Rows[cpu]["numero"].ToString();
                    dr["Marca"] = procesador.Rows[cpu]["marca"].ToString();
                    dr["Capacidad"] = procesador.Rows[cpu]["modelo"].ToString();
                    dr["Dispositivo"] = "Procesador";
                    dr["Tipo"] = conector.Buscahtdispositivo(procesador.Rows[cpu]["htdispositivo"].ToString());
                    datos.Rows.Add(dr);
                }
            }
            if (motherboard.Rows.Count > 0)
            {
                for (mb = 0; mb < motherboard.Rows.Count; mb++)
                {
                    DataRow dr = datos.NewRow();
                    dr["Id"] = motherboard.Rows[mb]["id"].ToString();
                    dr["Serial"] = motherboard.Rows[mb]["serial"].ToString(); ;
                    dr["Numero"] = motherboard.Rows[mb]["numero"].ToString();
                    dr["Marca"] = motherboard.Rows[mb]["marca"].ToString();
                    dr["Capacidad"] = motherboard.Rows[mb]["modelo"].ToString();
                    dr["Dispositivo"] = "Motherboard";
                    dr["Tipo"] = conector.Buscahtdispositivo(motherboard.Rows[mb]["htdispositivo"].ToString());
                    datos.Rows.Add(dr);
                }
            }
            if (sonido.Rows.Count > 0)
            {
                for (sn = 0; sn < sonido.Rows.Count; sn++)
                {
                    DataRow dr = datos.NewRow();
                    dr["Id"] = sonido.Rows[sn]["id"].ToString();
                    dr["Serial"] = sonido.Rows[sn]["serial"].ToString(); ;
                    dr["Numero"] = sonido.Rows[sn]["numero"].ToString();
                    dr["Marca"] = sonido.Rows[sn]["marca"].ToString();
                    dr["Capacidad"] = sonido.Rows[sn]["modelo"].ToString();
                    dr["Dispositivo"] = "Sonido";
                    dr["Tipo"] = conector.Buscahtdispositivo(sonido.Rows[sn]["htdispositivo"].ToString());
                    datos.Rows.Add(dr);
                }
            }
            if (lan.Rows.Count > 0)
            {
                for (net = 0; net < lan.Rows.Count; net++)
                {
                    DataRow dr = datos.NewRow();
                    dr["Id"] = lan.Rows[net]["id"].ToString();
                    dr["Serial"] = lan.Rows[net]["serial"].ToString(); ;
                    dr["Numero"] = lan.Rows[net]["numero"].ToString();
                    dr["Marca"] = lan.Rows[net]["marca"].ToString();
                    dr["Capacidad"] = lan.Rows[net]["modelo"].ToString();
                    dr["Dispositivo"] = "Red (LAN)";
                    dr["Tipo"] = conector.Buscahtdispositivo(lan.Rows[net]["htdispositivo"].ToString());
                    datos.Rows.Add(dr);
                }
            }
            if (cdrom.Rows.Count > 0)
            {
                for (cd = 0; cd < cdrom.Rows.Count; cd++)
                {
                    DataRow dr = datos.NewRow();
                    dr["Id"] = cdrom.Rows[cd]["id"].ToString();
                    dr["Serial"] = cdrom.Rows[cd]["serial"].ToString(); ;
                    dr["Numero"] = cdrom.Rows[cd]["numero"].ToString();
                    dr["Marca"] = cdrom.Rows[cd]["marca"].ToString();
                    dr["Capacidad"] = cdrom.Rows[cd]["modelo"].ToString();
                    dr["Dispositivo"] = "CdRom";
                    dr["Tipo"] = conector.Buscahtdispositivo(cdrom.Rows[cd]["htdispositivo"].ToString());
                    datos.Rows.Add(dr);
                }
            }
            GridView1.DataSource = datos;
            GridView1.DataBind();
            if (!FaltanDispositivos())
            {
                Label1.Text = "";
                Button2.Visible = true;
            }
            else
            {
                Label1.Text = "Faltan dispositivos indispensables para el funcionamiento del equipo!! Debe completar la informacion!!";
                Button2.Visible = false;
            }

        }
        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            FillCustomerInGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void gridView_SelectedIndex(object sender, EventArgs e)
        {
            string id = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[2].Text.ToString();
            string nombre = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[3].Text.ToString();
            string responsable = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[4].Text.ToString();
            string departamento = GridView1.Rows[Convert.ToInt32(GridView1.SelectedIndex.ToString())].Cells[5].Text.ToString();
            ImageButton ImageButton1 = (ImageButton)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("ImageButton1");
            ImageButton ImageButton2 = (ImageButton)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("ImageButton2");
            ImageButton ImageButton7 = (ImageButton)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("ImageButton7");
            ImageButton ImageButton8 = (ImageButton)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("ImageButton8");
            Label LblID = (Label)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("LblID") as Label;
            Label Lbltdispositivo = (Label)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("Lbltdispositivo");
            ImageButton1.Enabled = true;
            ImageButton2.Enabled = true;
            ImageButton7.Enabled = true;
            ImageButton8.Enabled = true;
        }
        protected void gridView_DeletedIndex(object sender, GridViewDeleteEventArgs e)
        {
            DBConnect conector = new DBConnect();
            string sql = "";
            if (vhiddispositivo.Value == "")
            {
                sql = "Seleccione la fila para poder eliminar el registro;";
                Label1.Text = sql;
            }
            else
            {
                //conector.Dsoporte(vhsoporte.Value);
                FillCustomerInGrid();
                Label1.Text = "";
                vhiddispositivo.Value = "";
            }

        }
        protected void Fin(object sender, EventArgs e)
        {
            if (!FaltanDispositivos())
            {
                string devuelveFecha = "<script language='JavaScript'>" +
                    "window.close();</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
            }
            else
            {
                Label1.Text = "Faltan dispositivos indispensables para el funcionamiento del equipo!! Debe completar la informacion!!";
            }
        }
        protected void Cerrar(object sender, EventArgs e)
        {
            this.Session["modal"] = "0";
        }
        protected void Agregar(object sender, EventArgs e)
        {
            DropDownList capacidadram = (DropDownList)GridView1.FooterRow.FindControl("DDcapacidadram");
            DropDownList capacidaddd = (DropDownList)GridView1.FooterRow.FindControl("DDcapacidaddd");
            capacidadram.Visible = false;
            capacidaddd.Visible = false;
            GridView1.FooterRow.Visible = true;
        }
        protected void Editar(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillCustomerInGrid();
            DBConnect conexion = new DBConnect();
            Label Dispositivo = (Label)GridView1.Rows[e.NewEditIndex].FindControl("Lbltdispositivo");
            TextBox TBXcapacidad = (TextBox)GridView1.Rows[e.NewEditIndex].FindControl("TBXcapacidad");
            DropDownList capacidadram = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DDcapacidadram");
            DropDownList capacidaddd = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DDcapacidaddd");
            if ((Dispositivo.Text == "RAM") || (Dispositivo.Text == "Disco Duro"))
            {
                if (Dispositivo.Text == "RAM")
                {
                    TBXcapacidad.Visible = false;
                    capacidadram.Visible = true;
                    capacidaddd.Visible = false;
                    DataTable lista = conexion.Scapacidadram();
                    ListItem opct = new ListItem();
                    opct.Text = "Seleccione";
                    opct.Value = "0";
                    capacidadram.Items.Add(opct);
                    for (int i = 0; i < lista.Rows.Count; i++)
                    {
                        ListItem opct2 = new ListItem();
                        opct2.Text = lista.Rows[i]["nombre"].ToString();
                        opct2.Value = lista.Rows[i]["id"].ToString();
                        capacidadram.Items.Add(opct2);
                    }
                    capacidadram.DataBind();
                }
                if (Dispositivo.Text == "Disco Duro")
                {
                    TBXcapacidad.Visible = false;
                    capacidadram.Visible = false;
                    capacidaddd.Visible = true;
                    DataTable lista = conexion.Scapacidaddd();
                    ListItem opct = new ListItem();
                    opct.Text = "Seleccione";
                    opct.Value = "0";
                    capacidaddd.Items.Add(opct);
                    for (int i = 0; i < lista.Rows.Count; i++)
                    {
                        ListItem opct2 = new ListItem();
                        opct2.Text = lista.Rows[i]["nombre"].ToString();
                        opct2.Value = lista.Rows[i]["id"].ToString();
                        capacidaddd.Items.Add(opct2);
                    }
                    capacidaddd.DataBind();
                }
            }
            else 
            {
                TBXcapacidad.Visible = true;
                capacidadram.Visible = false;
                capacidaddd.Visible = false; 
            }
        }
        protected void Cancelar(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillCustomerInGrid();
        }
        protected void Borrar(object sender, GridViewDeleteEventArgs e)
        {
            Label LblID = (Label)GridView1.Rows[e.RowIndex].FindControl("LblID");
            Label Lbltdispositivo = (Label)GridView1.Rows[e.RowIndex].FindControl("Lbltdispositivo");
            DBConnect conector = new DBConnect();
            if (Lbltdispositivo.Text == "Disco Duro")
            {
                conector.DDispositivo(LblID.Text, "7");
            }
            if (Lbltdispositivo.Text == "Video")
            {
                conector.DDispositivo(LblID.Text, "8");
            }
            if (Lbltdispositivo.Text == "RAM")
            {
                conector.DDispositivo(LblID.Text, "9");
            }
            if (Lbltdispositivo.Text == "Procesador")
            {
                conector.DDispositivo(LblID.Text, "10");
            }
            if (Lbltdispositivo.Text == "Motherboard")
            {
                conector.DDispositivo(LblID.Text, "11");
            }
            if (Lbltdispositivo.Text == "Sonido")
            {
                conector.DDispositivo(LblID.Text, "12");
            }
            if (Lbltdispositivo.Text == "Red (LAN)")
            {
                conector.DDispositivo(LblID.Text, "14");
            }
            if (Lbltdispositivo.Text == "CdRom")
            {
                conector.DDispositivo(LblID.Text, "16");
            }
            GridView1.EditIndex = -1;
            FillCustomerInGrid();
        }
        protected void upd(object sender, GridViewUpdateEventArgs e)
        {
            DBConnect conector = new DBConnect();
            Label LblID = (Label)GridView1.Rows[e.RowIndex].FindControl("LblID");
            Label Lblserial = (Label)GridView1.Rows[e.RowIndex].FindControl("Lblserial");
            Label Lblnumero = (Label)GridView1.Rows[e.RowIndex].FindControl("Lblnumero");
            Label Lblmarca = (Label)GridView1.Rows[e.RowIndex].FindControl("Lblmarca");
            Label Lblcapacidad = (Label)GridView1.Rows[e.RowIndex].FindControl("Lblcapacidad");
            Label Lbltdispositivo = (Label)GridView1.Rows[e.RowIndex].FindControl("Lbltdispositivo");
            Label LblTipo = (Label)GridView1.Rows[e.RowIndex].FindControl("LblTipo");
            TextBox TBXserial = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXserial");
            TextBox TBXnumero = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXnumero");
            TextBox TBXmarca = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXmarca");
            TextBox TBXcapacidad = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TBXcapacidad");
            DropDownList capacidadram = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DDcapacidadram");
            DropDownList capacidaddd = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DDcapacidaddd");
            GridView1.EditIndex = -1;
            if (Lbltdispositivo.Text == "Disco Duro")
            {
                conector.UDispositivo(LblID.Text, TBXserial.Text, TBXmarca.Text, TBXnumero.Text, capacidaddd.SelectedItem.Text, "7",capacidaddd.SelectedValue);
            }
            if (Lbltdispositivo.Text == "Video")
            {
                conector.UDispositivo(LblID.Text, TBXserial.Text, TBXmarca.Text, TBXnumero.Text, TBXcapacidad.Text, "8","0");
            }
            if (Lbltdispositivo.Text == "RAM")
            {
                conector.UDispositivo(LblID.Text, TBXserial.Text, TBXmarca.Text, TBXnumero.Text, capacidadram.SelectedItem.Text, "9",capacidadram.SelectedValue);
            }
            if (Lbltdispositivo.Text == "Procesador")
            {
                conector.UDispositivo(LblID.Text, TBXserial.Text, TBXmarca.Text, TBXnumero.Text, TBXcapacidad.Text, "10","0");
            }
            if (Lbltdispositivo.Text == "Motherboard")
            {
                conector.UDispositivo(LblID.Text, TBXserial.Text, TBXmarca.Text, TBXnumero.Text, TBXcapacidad.Text, "11","0");
            }
            if (Lbltdispositivo.Text == "Sonido")
            {
                conector.UDispositivo(LblID.Text, TBXserial.Text, TBXmarca.Text, TBXnumero.Text, TBXcapacidad.Text, "12","0");
            }
            if (Lbltdispositivo.Text == "Red (LAN)")
            {
                conector.UDispositivo(LblID.Text, TBXserial.Text, TBXmarca.Text, TBXnumero.Text, TBXcapacidad.Text, "14","0");
            }
            if (Lbltdispositivo.Text == "CdRom")
            {
                conector.UDispositivo(LblID.Text, TBXserial.Text, TBXmarca.Text, TBXnumero.Text, TBXcapacidad.Text, "16","0");
            }
            FillCustomerInGrid();
        }
        protected void Guardar(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Add"))
            {
                string sql = "";
                DBConnect conector = new DBConnect();
                Label LblID = (Label)GridView1.FooterRow.FindControl("LblID") as Label;
                TextBox TBXserial = (TextBox)GridView1.FooterRow.FindControl("TBXserial") as TextBox;
                TextBox TBXnumero = (TextBox)GridView1.FooterRow.FindControl("TBXnumero") as TextBox;
                TextBox TBXmarca = (TextBox)GridView1.FooterRow.FindControl("TBXmarca") as TextBox;
                TextBox TBXcapacidad = (TextBox)GridView1.FooterRow.FindControl("TBXcapacidad") as TextBox;
                DropDownList Dispositivo = (DropDownList)GridView1.FooterRow.Cells[6].FindControl("Dispositivo") as DropDownList;
                DropDownList Tipo = (DropDownList)GridView1.FooterRow.Cells[7].FindControl("Tipo") as DropDownList;
                DropDownList capacidadram = (DropDownList)GridView1.FooterRow.Cells[5].FindControl("DDcapacidadram");
                DropDownList capacidaddd = (DropDownList)GridView1.FooterRow.Cells[5].FindControl("DDcapacidaddd");
                if ((Dispositivo.SelectedValue == "7") || (Dispositivo.SelectedValue == "9"))
                {
                    if (Dispositivo.SelectedValue == "7")
                    {
                        sql = conector.IDispositivo(vhequipo.Value + conector.Uid_temp(),
                                            TBXserial.Text,
                                            TBXmarca.Text,
                                            TBXnumero.Text,
                                            Tipo.SelectedValue,
                                            capacidaddd.SelectedItem.Text,
                                            Dispositivo.SelectedValue,
                                            vhequipo.Value, capacidaddd.SelectedValue);
                    }
                    if (Dispositivo.SelectedValue == "9")
                    {
                        sql = conector.IDispositivo(vhequipo.Value + conector.Uid_temp(),
                                           TBXserial.Text,
                                           TBXmarca.Text,
                                           TBXnumero.Text,
                                           Tipo.SelectedValue,
                                           capacidadram.SelectedItem.Text,
                                           Dispositivo.SelectedValue,
                                           vhequipo.Value, capacidadram.SelectedValue);
                    }
                }
                else
                {
                    sql = conector.IDispositivo(vhequipo.Value + conector.Uid_temp(),
                                        TBXserial.Text,
                                        TBXmarca.Text,
                                        TBXnumero.Text,
                                        Tipo.SelectedValue,
                                        TBXcapacidad.Text,
                                        Dispositivo.SelectedValue,
                                        vhequipo.Value, "0");
                }
                FillCustomerInGrid();
            }
            if (e.CommandName.Equals("Cambio"))
            {
                DBConnect conector = new DBConnect();
                Label LblID = (Label)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("LblID") as Label;
                Label Lbltdispositivo = (Label)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("Lbltdispositivo");
                VerCambio.VerEquipos(this, LblID.Text, Lbltdispositivo.Text, vhequipo.Value);
                FillCustomerInGrid();
            }
            if (e.CommandName.Equals("Desincorpora"))
            {
                DBConnect conector = new DBConnect();
                Label LblID = (Label)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("LblID") as Label;
                Label Lbltdispositivo = (Label)GridView1.Rows[GridView1.SelectedRow.RowIndex].FindControl("Lbltdispositivo");
                DDisp.VerEquipos(this, LblID.Text, Lbltdispositivo.Text, vhequipo.Value,"1");
                FillCustomerInGrid();
            }
            //
            if (e.CommandName.Equals("Cancelar"))
            {
                GridView1.FooterRow.Visible = false;
            }
        }
        protected void htdispositivo(object sender, EventArgs e)
        {
            DBConnect conector = new DBConnect();
            DropDownList Dispositivo = (DropDownList)GridView1.FooterRow.FindControl("Dispositivo") as DropDownList;
            DropDownList Tipo = (DropDownList)GridView1.FooterRow.FindControl("Tipo") as DropDownList;
            TextBox TBXcapacidad = (TextBox)GridView1.FooterRow.FindControl("TBXcapacidad");
            DropDownList capacidadram = (DropDownList)GridView1.FooterRow.Cells[5].FindControl("DDcapacidadram");
            DropDownList capacidaddd = (DropDownList)GridView1.FooterRow.Cells[5].FindControl("DDcapacidaddd");        
            Tipo.Items.Clear();
            string idtipo = Dispositivo.SelectedValue;
            if ((idtipo == "7") || (idtipo == "9"))
            {
                if (idtipo == "7")
                {
                    TBXcapacidad.Visible = false;
                    capacidadram.Visible = false;
                    capacidaddd.Visible = true;
                    DataTable lista = conector.Scapacidaddd();
                    ListItem opct = new ListItem();
                    opct.Text = "Seleccione";
                    opct.Value = "0";
                    capacidaddd.Items.Add(opct);
                    for (int i = 0; i < lista.Rows.Count; i++)
                    {
                        ListItem opct2 = new ListItem();
                        opct2.Text = lista.Rows[i]["nombre"].ToString();
                        opct2.Value = lista.Rows[i]["id"].ToString();
                        capacidaddd.Items.Add(opct2);
                    }
                    capacidaddd.DataBind();
                }
                if (idtipo == "9")
                {
                    TBXcapacidad.Visible = false;
                    capacidadram.Visible = true;
                    capacidaddd.Visible = false;
                    DataTable lista = conector.Scapacidadram();
                    ListItem opct = new ListItem();
                    opct.Text = "Seleccione";
                    opct.Value = "0";
                    capacidadram.Items.Add(opct);
                    for (int i = 0; i < lista.Rows.Count; i++)
                    {
                        ListItem opct2 = new ListItem();
                        opct2.Text = lista.Rows[i]["nombre"].ToString();
                        opct2.Value = lista.Rows[i]["id"].ToString();
                        capacidadram.Items.Add(opct2);
                    }
                    capacidadram.DataBind();
                }
            }
            else 
            {
                TBXcapacidad.Visible = true;
                capacidadram.Visible = false;
                capacidaddd.Visible = false;
            }
            DataTable lsoporte = conector.Shtdispositivo(idtipo);
            ListItem inicio = new ListItem();
            inicio.Text = "Seleccione";
            inicio.Value = "0";
            Tipo.Items.Add(inicio);
            for (int i = 0; i < lsoporte.Rows.Count; i++)
            {
                ListItem opcion = new ListItem();
                opcion.Text = lsoporte.Rows[i]["nombre"].ToString();
                opcion.Value = lsoporte.Rows[i]["id"].ToString();
                Tipo.Items.Add(opcion);
            }
            Tipo.DataBind();
        }
        private bool FaltanDispositivos()
        {
            DBConnect conector = new DBConnect();
            DataTable discoduro = new DataTable();
            DataTable video = new DataTable();
            DataTable ram = new DataTable();
            DataTable procesador = new DataTable();
            DataTable motherboard = new DataTable();
            DataTable sonido = new DataTable();
            DataTable lan = new DataTable();
            DataTable cdrom = new DataTable();
            bool resultado = false;
            discoduro = conector.SelectComponente(vhequipo.Value, "7");
            video = conector.SelectComponente(vhequipo.Value, "8");
            ram = conector.SelectComponente(vhequipo.Value, "9");
            procesador = conector.SelectComponente(vhequipo.Value, "10");
            motherboard = conector.SelectComponente(vhequipo.Value, "11");
            sonido = conector.SelectComponente(vhequipo.Value, "12");
            lan = conector.SelectComponente(vhequipo.Value, "14");
            cdrom = conector.SelectComponente(vhequipo.Value, "16");
            if ((discoduro.Rows.Count > 0) &
                (video.Rows.Count > 0) &
                (ram.Rows.Count > 0) &
                (procesador.Rows.Count > 0) &
                (motherboard.Rows.Count > 0) &
                (sonido.Rows.Count > 0) &
                (lan.Rows.Count > 0) &
                (cdrom.Rows.Count > 0))
            {
                resultado = false;
            }
            else
            {
                resultado = true;
            }
            return resultado;
        }
        protected void cambios()
        {
            FillCustomerInGrid();
            Button1.Visible = false;
        }

    }
}