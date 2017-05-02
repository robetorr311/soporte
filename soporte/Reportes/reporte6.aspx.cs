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

namespace soporte.Reportes
{
    public partial class reporte6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fechainicio = Server.HtmlEncode(Request.QueryString["fechainicio"]);
            string fechafinal = Server.HtmlEncode(Request.QueryString["fechafinal"]);
            string dmyi = Server.HtmlEncode(Request.QueryString["dmyi"]);
            string dmyf = Server.HtmlEncode(Request.QueryString["dmyf"]);
            string departamento = Server.HtmlEncode(Request.QueryString["departamento"]);
            string departamentomay = departamento.ToUpper();
            DBConnect conexion = new DBConnect();
            DataTable DTrptpendiente = conexion.RPTDeppendiente(departamento, fechainicio, fechafinal);
            DataTable DTrptenrevision = conexion.RPTDepenrevision(departamento, fechainicio, fechafinal);
            DataTable DTrptculminado = conexion.RPTDepculminado(departamento, fechainicio, fechafinal);
            // Declaraciones de variables
            string rptString1 = "Solicitudes por:";
            string rptString2 = "Pendiente";
            string rptString3 = "En Revision";
            string rptString4 = "Culminado";
            string rptString5 = "Fallas Sistemas Administrativos";
            string rptString6 = "Fallas Sistemas de Salud";
            string rptString7 = "Fallas de Sistema Operativo";
            string rptString8 = "Fallas en Aplicaciones";
            string rptString9 = "Fallas de Windows";
            string rptString10 = "Fallas del Office";
            string rptString11 = "Otras";
            string rptString12 = "Fallas de Impresora";
            string rptString13 = "Fallas de Monitor";
            string rptString14 = "Fallas de Teclado";
            string rptString15 = "Fallas de Mouse";
            string rptString16 = "Fallas de Regulador";
            string rptString17 = "Fallas de Conexion de Red";
            string rptString18 = "Fallas de Conexion de Internet";
            string rptString19 = "Totales:";
            string rptString20 = "Fallas de CPU (Hardware)";
            string rptString21 = "Estatus de Actividades";
            string sa_pend = "";
            string ss_pend = "";
            string sop_end = "";
            string app_pend = "";
            string win_pend = "";
            string off_pend = "";
            string otr_pend = "";
            string cpu_pend = "";
            string impresora_pend = "";
            string monitor_pend = "";
            string teclado_pend = "";
            string mouse_pend = "";
            string regulador_pend = "";
            string conexionr_pend = "";
            string conexioni_pend = "";
            string total_pend = "";
            string sa_enrev = "";
            string ss_enrev = "";
            string so_enrev = "";
            string app_enrev = "";
            string win_enrev = "";
            string off_enrev = "";
            string otr_enrev = "";
            string cpu_enrev = "";
            string impresora_enrev = "";
            string monitor_enrev = "";
            string teclado_enrev = "";
            string mouse_enrev = "";
            string regulador_enrev = "";
            string conexionr_enrev = "";
            string conexioni_enrev = "";
            string total_enrev = "";
            string sa_culm = "";
            string ss_culm = "";
            string so_culm = "";
            string app_culm = "";
            string win_culm = "";
            string off_culm = "";
            string otr_culm = "";
            string cpu_culm = "";
            string impresora_culm = "";
            string monitor_culm = "";
            string teclado_culm = "";
            string mouse_culm = "";
            string regulador_culm = "";
            string conexionr_culm = "";
            string conexioni_culm = "";
            string total_culm = "";
            // Fin Declaraciones
            //Asignacion de Valores
            sa_pend = DTrptpendiente.Rows[0]["sa"].ToString();
            ss_pend = DTrptpendiente.Rows[0]["ss"].ToString();
            sop_end = DTrptpendiente.Rows[0]["so"].ToString();
            app_pend = DTrptpendiente.Rows[0]["app"].ToString();
            win_pend = DTrptpendiente.Rows[0]["win"].ToString();
            off_pend = DTrptpendiente.Rows[0]["off"].ToString();
            otr_pend = DTrptpendiente.Rows[0]["otr"].ToString();
            cpu_pend = DTrptpendiente.Rows[0]["cpu"].ToString();
            impresora_pend = DTrptpendiente.Rows[0]["impresora"].ToString();
            monitor_pend = DTrptpendiente.Rows[0]["monitor"].ToString();
            teclado_pend = DTrptpendiente.Rows[0]["teclado"].ToString();
            mouse_pend = DTrptpendiente.Rows[0]["mouse"].ToString();
            regulador_pend = DTrptpendiente.Rows[0]["regulador"].ToString();
            conexionr_pend = DTrptpendiente.Rows[0]["conexionr"].ToString();
            conexioni_pend = DTrptpendiente.Rows[0]["conexioni"].ToString();
            total_pend = DTrptpendiente.Rows[0]["total"].ToString();
            sa_enrev = DTrptenrevision.Rows[0]["sa"].ToString();
            ss_enrev = DTrptenrevision.Rows[0]["ss"].ToString();
            so_enrev = DTrptenrevision.Rows[0]["so"].ToString();
            app_enrev = DTrptenrevision.Rows[0]["app"].ToString();
            win_enrev = DTrptenrevision.Rows[0]["win"].ToString();
            off_enrev = DTrptenrevision.Rows[0]["off"].ToString();
            otr_enrev = DTrptenrevision.Rows[0]["otr"].ToString();
            cpu_enrev = DTrptenrevision.Rows[0]["cpu"].ToString();
            impresora_enrev = DTrptenrevision.Rows[0]["impresora"].ToString();
            monitor_enrev = DTrptenrevision.Rows[0]["monitor"].ToString();
            teclado_enrev = DTrptenrevision.Rows[0]["teclado"].ToString();
            mouse_enrev = DTrptenrevision.Rows[0]["mouse"].ToString();
            regulador_enrev = DTrptenrevision.Rows[0]["regulador"].ToString();
            conexionr_enrev = DTrptenrevision.Rows[0]["conexionr"].ToString();
            conexioni_enrev = DTrptenrevision.Rows[0]["conexioni"].ToString();
            total_enrev = DTrptenrevision.Rows[0]["total"].ToString();
            sa_culm = DTrptculminado.Rows[0]["sa"].ToString();
            ss_culm = DTrptculminado.Rows[0]["ss"].ToString();
            so_culm = DTrptculminado.Rows[0]["so"].ToString();
            app_culm = DTrptculminado.Rows[0]["app"].ToString();
            win_culm = DTrptculminado.Rows[0]["win"].ToString();
            off_culm = DTrptculminado.Rows[0]["off"].ToString();
            otr_culm = DTrptculminado.Rows[0]["otr"].ToString();
            cpu_culm = DTrptculminado.Rows[0]["cpu"].ToString();
            impresora_culm = DTrptculminado.Rows[0]["impresora"].ToString();
            monitor_culm = DTrptculminado.Rows[0]["monitor"].ToString();
            teclado_culm = DTrptculminado.Rows[0]["teclado"].ToString();
            mouse_culm = DTrptculminado.Rows[0]["mouse"].ToString();
            regulador_culm = DTrptculminado.Rows[0]["regulador"].ToString();
            conexionr_culm = DTrptculminado.Rows[0]["conexionr"].ToString();
            conexioni_culm = DTrptculminado.Rows[0]["conexioni"].ToString();
            total_culm = DTrptculminado.Rows[0]["total"].ToString();
            //Fin de Asignaciones
            //Comienzo del Reporte
            Response.ContentType = "application/pdf";
            sharpPDF.pdfDocument myDoc = new sharpPDF.pdfDocument("Sample Application", "Me", false);
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/encabezado.gif"), "encabezado");
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/piedepagina.gif"), "pie");
            sharpPDF.pdfPage myFirstPage = myDoc.addPage();
            myFirstPage.addImage(myDoc.getImageReference("encabezado"), 50, 700);
            //Titulo de reporte
            myFirstPage.addText("ACTIVIDADES REALIZADAS PARA EL DEPARTAMENTO DE " + departamentomay , 50, 680, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12);
            myFirstPage.addText("   DURANTE EL PERIODO" + dmyi + " AL " + dmyf, 150, 665, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12);
            //+  Datos Basicos
            myFirstPage.drawRectangle(40, 660, 562, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(40, 660, 562, 645, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(40, 660, 262, 630, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(262, 645, 362, 630, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(362, 645, 462, 630, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(462, 645, 562, 630, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.addText(rptString21, 264, 647, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString1, 42, 632, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString2, 264, 632, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString3, 364, 632, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString4, 464, 632, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(255, 255, 255));
            //Sistemas Administrativos
            myFirstPage.drawRectangle(40, 630, 262, 615, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 630, 362, 615, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 630, 462, 615, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 630, 562, 615, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString5, 42, 617, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(sa_pend, 264, 617, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(sa_enrev, 364, 617, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(sa_culm, 464, 617, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Sistemas de Salud
            myFirstPage.drawRectangle(40, 615, 262, 600, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 615, 362, 600, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 615, 462, 600, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 615, 562, 600, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString6, 42, 602, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(ss_pend, 264, 602, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(ss_enrev, 364, 602, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(ss_culm, 464, 602, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Sistema Operativo
            myFirstPage.drawRectangle(40, 600, 262, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 600, 362, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 600, 462, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 600, 562, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString7, 42, 587, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(sop_end, 264, 587, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(so_enrev, 364, 587, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(so_culm, 464, 587, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Aplicaciones
            myFirstPage.drawRectangle(40, 585, 262, 570, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 585, 362, 570, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 585, 462, 570, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 585, 562, 570, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString8, 42, 572, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(app_pend, 264, 572, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(app_enrev, 364, 572, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(app_culm, 464, 572, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Windows
            myFirstPage.drawRectangle(40, 570, 262, 555, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 570, 362, 555, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 570, 462, 555, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 570, 562, 555, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString9, 42, 557, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(win_pend, 264, 557, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(win_enrev, 364, 557, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(win_culm, 464, 557, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Office
            myFirstPage.drawRectangle(40, 555, 262, 540, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 555, 362, 540, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 555, 462, 540, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 555, 562, 540, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString10, 42, 542, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(off_pend, 264, 542, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(off_enrev, 364, 542, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(off_culm, 464, 542, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Otras
            myFirstPage.drawRectangle(40, 540, 262, 525, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 540, 362, 525, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 540, 462, 525, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 540, 562, 525, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString11, 42, 527, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(otr_pend, 264, 527, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(otr_enrev, 364, 527, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(otr_culm, 464, 527, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Impresora
            myFirstPage.drawRectangle(40, 525, 262, 510, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 525, 362, 510, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 525, 462, 510, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 525, 562, 510, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString12, 42, 512, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(impresora_pend, 264, 512, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(impresora_enrev, 364, 512, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(impresora_culm, 464, 512, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Monitor
            myFirstPage.drawRectangle(40, 510, 262, 495, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 510, 362, 495, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 510, 462, 495, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 510, 562, 495, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString13, 42, 497, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(monitor_pend, 264, 497, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(monitor_enrev, 364, 497, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(monitor_culm, 464, 497, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Teclado
            myFirstPage.drawRectangle(40, 495, 262, 480, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 495, 362, 480, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 495, 462, 480, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 495, 562, 480, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString14, 42, 482, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(teclado_pend, 264, 482, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(teclado_enrev, 364, 482, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(teclado_culm, 464, 482, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Mouse
            myFirstPage.drawRectangle(40, 480, 262, 465, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 480, 362, 465, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 480, 462, 465, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 480, 562, 465, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString15, 42, 467, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(mouse_pend, 264, 467, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(mouse_enrev, 364, 467, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(mouse_culm, 464, 467, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Regulador
            myFirstPage.drawRectangle(40, 465, 262, 450, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 465, 362, 450, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 465, 462, 450, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 465, 562, 450, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString16, 42, 452, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(regulador_pend, 264, 452, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(regulador_enrev, 364, 452, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(regulador_culm, 464, 452, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Red
            myFirstPage.drawRectangle(40, 450, 262, 435, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 450, 362, 435, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 450, 462, 435, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 450, 562, 435, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString17, 42, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(conexionr_pend, 264, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(conexionr_enrev, 364, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(conexionr_culm, 464, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Internet
            myFirstPage.drawRectangle(40, 435, 262, 420, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 435, 362, 420, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 435, 462, 420, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 435, 562, 420, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString18, 42, 422, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(conexioni_pend, 264, 422, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(conexioni_enrev, 364, 422, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(conexioni_culm, 464, 422, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //CPU
            myFirstPage.drawRectangle(40, 420, 262, 405, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 420, 362, 405, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 420, 462, 405, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 420, 562, 405, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString20, 42, 407, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(cpu_pend, 264, 407, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(cpu_enrev, 364, 407, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(cpu_culm, 464, 407, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            //Total
            myFirstPage.drawRectangle(40, 405, 262, 390, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(262, 405, 362, 390, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(362, 405, 462, 390, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(462, 405, 562, 390, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(rptString19, 42, 392, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(total_pend, 264, 392, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(total_enrev, 364, 392, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(total_culm, 464, 392, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage = null;
            myDoc.createPDF(Response.OutputStream);
            myDoc = null;
        }
    }
}