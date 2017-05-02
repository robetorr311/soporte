﻿using System;
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

namespace soporte.Reportes
{
    public partial class solicitudpdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id= Server.HtmlEncode(Request.QueryString["id"]);
            string serial = Server.HtmlEncode(Request.QueryString["serial"]);
            string fecha="";
            string departamento="";
            string solicitante = "";
            string sa = "";
            string ss = "";
            string so = "";
            string app = "";
            string win = "";
            string off = "";
            string otr = "";
            string observacioness = "";
            string scpu = "";
            string impresora = "";
            string monitor = "";
            string teclado = "";
            string mouse = "";
            string regulador = "";
            string conexionr = "";
            string conexioni = "";
            string switche = "";
            string observacionesh = "";
            DBConnect conector = new DBConnect();
            List<string[]> listado = conector.SSolicitud(id);
            for (int i = 0; i < listado.Count; i++)
            {
                string[] lista = new string[22];
                lista = listado[i];
                ListItem opcion = new ListItem();
                fecha= lista[1];
                departamento=lista[2];
                solicitante =lista[3];
                sa =lista[4];
                ss =lista[5];
                so =lista[6];
                app =lista[7];
                win =lista[8];
                off = lista[9];
                otr =lista[10];
                observacioness =lista[11];
                scpu =lista[12];
                impresora =lista[13];
                monitor =lista[14];
                teclado =lista[15];
                mouse =lista[16];
                regulador =lista[17];
                conexionr =lista[18];
                conexioni =lista[19];
                observacionesh =lista[20];
                switche = lista[21];
                lista = null;
            }
            Response.ContentType = "application/pdf";
            //System.Web.HttpContext.Current.Server.MapPath
            sharpPDF.pdfDocument myDoc = new sharpPDF.pdfDocument("Sample Application", "Me", false);
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/encabezadorpt.gif"), "encabezado");
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/piedepagina.gif"), "pie");
            /*Table's creation*/
            sharpPDF.pdfPage myFirstPage = myDoc.addPage();
            sharpPDF.Tables.pdfTable myTable = new sharpPDF.Tables.pdfTable(myDoc);
            myTable.borderSize = 1;
            myTable.borderColor = new sharpPDF.pdfColor(0, 0, 0);
            myTable.coordX = 60;
            myTable.coordY = 640;
            myTable.tableHeader.addColumn(100);
            myTable.tableHeader.addColumn(210);
            myTable.tableHeader.addColumn(67);
            myTable.tableHeader.addColumn(115);       
            myFirstPage.addImage(myDoc.getImageReference("encabezado"), 50, 700);
            myFirstPage.addText("SOLICITUD DE SERVICIO", 60, 650, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 20);
            sharpPDF.Tables.pdfTableRow myRow = myTable.createRow();
            myRow[0].addText("Departamento:", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 12, new sharpPDF.pdfColor(0, 51, 153));
            myRow[1].addText(departamento, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 12, new sharpPDF.pdfColor(0, 51, 153));
            myRow[2].addText("Telefono:", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 12, new sharpPDF.pdfColor(0, 51, 153));
            myRow[3].addText("0243-2721295", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 12, new sharpPDF.pdfColor(0, 51, 153));
            myTable.addRow(myRow);
            myRow = null;
            myFirstPage.addTable(myTable, 600);
            sharpPDF.Tables.pdfTable myTable2 = new sharpPDF.Tables.pdfTable(myDoc);
            myTable2.borderSize = 1;
            myTable2.borderColor = new sharpPDF.pdfColor(0, 0, 0);
            myTable2.coordX = 60;
            myTable2.coordY = 617;
            myTable2.tableHeader.addColumn(146);
            myTable2.tableHeader.addColumn(164);
            myTable2.tableHeader.addColumn(49);
            myTable2.tableHeader.addColumn(133);
            sharpPDF.Tables.pdfTableRow myRow2 = myTable2.createRow();
            myRow2[0].addText("Nombre del Solicitante:", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 12, new sharpPDF.pdfColor(0, 51, 153));
            myRow2[1].addText(solicitante, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 12, new sharpPDF.pdfColor(0, 51, 153));
            myRow2[2].addText("Fecha:", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 12, new sharpPDF.pdfColor(0, 51, 153));
            myRow2[3].addText(fecha, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 12, new sharpPDF.pdfColor(0, 51, 153));
            myTable2.addRow(myRow2);
            myRow2 = null;
            myFirstPage.addTable(myTable2, 600);
            myFirstPage.addText("Descripcion del Tipo de Falla", 60, 580, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12);
            myFirstPage.drawRectangle(60,578, 552, 497,new sharpPDF.pdfColor(0,0,0), new sharpPDF.pdfColor(255,255,255));
            myFirstPage.addText("Software", 65, 560, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0,51,153));
            if (sa == "1")
            {
                myFirstPage.drawRectangle(65, 540, 75, 550, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Sistemas Administrativos", 80, 540, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(65, 540, 75, 550, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Sistemas Administrativos", 80, 540, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (ss == "1")
            {
                myFirstPage.drawRectangle(220, 540, 230, 550, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Sistemas de Salud", 235, 540, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(220, 540, 230, 550, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Sistemas de Salud", 235, 540, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (so == "1")
            {
                myFirstPage.drawRectangle(340, 540, 350, 550, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Sistema Operativo", 355, 540, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(340, 540, 350, 550, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Sistema Operativo", 355, 540, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (app == "1")
            {
                myFirstPage.drawRectangle(460, 540, 470, 550, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Aplicaciones", 475, 540, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(460, 540, 470, 550, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Aplicaciones", 475, 540, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (win == "1")
            {
                myFirstPage.drawRectangle(65, 520, 75, 530, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Windows", 80, 520, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(65, 520, 75, 530, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Windows", 80, 520, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (off == "1")
            {
                myFirstPage.drawRectangle(220, 520, 230, 530, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Office", 235, 520, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(220, 520, 230, 530, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Office", 235, 520, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (otr == "1")
            {
                myFirstPage.drawRectangle(340, 520, 350, 530, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Otro", 355, 520, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(340, 520, 350, 530, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Otro", 355, 520, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }

            myFirstPage.addText(observacioness, 65, 500, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
/// hardware

            myFirstPage.drawRectangle(60, 497, 552, 409, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("Hardware", 65, 477, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));

            if (scpu == "1")
            {
                myFirstPage.drawRectangle(65, 457, 75, 467, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("C.P.U.", 80, 457, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(65, 457, 75, 467, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("C.P.U.", 80, 457, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (impresora == "1")
            {
                myFirstPage.drawRectangle(220, 457, 230, 467, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Impresora", 235, 457, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(220, 457, 230, 467, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Impresora", 235, 457, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (monitor == "1")
            {
                myFirstPage.drawRectangle(340, 457, 350, 467, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Monitor", 355, 457, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(340, 457, 350, 467, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Monitor", 355, 457, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (teclado == "1")
            {
                myFirstPage.drawRectangle(460, 457, 470, 467, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Teclado", 475, 457, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(460, 457, 470, 467, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Teclado", 475, 457, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (mouse == "1")
            {
                myFirstPage.drawRectangle(65, 437, 75, 447, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Mouse", 80, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(65, 437, 75, 447, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Mouse", 80, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (regulador == "1")
            {
                myFirstPage.drawRectangle(220, 437, 230, 447, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Regulador", 235, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(220, 437, 230, 447, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Regulador", 235, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (conexionr == "1")
            {
                myFirstPage.drawRectangle(340, 437, 350, 447, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Conexion de Red", 355, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(340, 437, 350, 447, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Conexion de Red", 355, 437, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (conexioni == "1")
            {
                myFirstPage.drawRectangle(65, 417, 75, 427, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Conexion de Internet", 80, 417, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(65, 417, 75, 427, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Conexion de Internet", 80, 417, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            if (switche == "1")
            {
                myFirstPage.drawRectangle(220, 417, 230, 427, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(0, 0, 0));
                myFirstPage.addText("Switche de Red", 235, 417, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            else
            {
                myFirstPage.drawRectangle(220, 417, 230, 427, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("Switche de Red", 235, 417, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            }
            myFirstPage.addText(observacioness, 220, 417, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            myFirstPage.addText("Datos del Servicio", 200, 395, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            myFirstPage.drawRectangle(60, 390, 552, 320, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(276, 390, 552, 375, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("Conforme Notificacion", 280, 377, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            myFirstPage.drawRectangle(276, 375, 414, 360, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("Firma Solicitante", 280, 362, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            myFirstPage.drawRectangle(414, 375, 552, 360, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("Firma Tecnico", 416, 362, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            myFirstPage.drawRectangle(276, 360, 414, 320, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(414, 360, 552, 320, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("Fecha de notificacion al Tecnico:", 75, 375, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            myFirstPage.addText(fecha, 90, 360, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12, new sharpPDF.pdfColor(0, 51, 153));
            myTable = null;
            myFirstPage = null;
            myDoc.createPDF(Response.OutputStream);
            myDoc = null;
        }
    }
}
