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
    public partial class equipopdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idmonitor = Server.HtmlEncode(Request.QueryString["idmonitor"]);
            string usuario = "";
            string departamento = "";
            string marca = "";
            string serial = "";
            string numero = "";
            string nombre = "";
            string tipo = "";
            DBConnect conector = new DBConnect();
            DataTable listado = conector.SVPCs(idmonitor);
            if (listado.Rows.Count > 0)
            {
                usuario = listado.Rows[0]["responsable"].ToString();
                departamento = listado.Rows[0]["departamento"].ToString();
                marca = listado.Rows[0]["marca"].ToString();
                serial = listado.Rows[0]["serial"].ToString();
                numero = listado.Rows[0]["numero"].ToString();
                nombre = listado.Rows[0]["nombre"].ToString();
            }
            Response.ContentType = "application/pdf";
            sharpPDF.pdfDocument myDoc = new sharpPDF.pdfDocument("Sample Application", "Me", false);
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/encabezadorptinv.gif"), "encabezado");
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/piedepagina.gif"), "pie");
            sharpPDF.pdfPage myFirstPage = myDoc.addPage();
            myFirstPage.addImage(myDoc.getImageReference("encabezado"), 50, 700);
            //Titulo de reporte
            myFirstPage.addText("PLANILLA DE INVENTARIO DE EQUIPOS DE COMPUTACION", 60, 670, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12);
            //Datos Basicos
            myFirstPage.drawRectangle(40, 660, 562, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(40, 660, 562, 645, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.addText("1. Datos Básicos del Equipo", 45, 647, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(40, 645, 214, 630, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(214, 645, 388, 630, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(388, 645, 562, 630, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.addText("1.1 Usuario Responsable", 45, 632, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("1.2 Departamento al cual pertenece", 219, 632, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("1.3 Telefono", 393, 632, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(40, 630, 214, 615, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(214, 630, 388, 615, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(388, 630, 562, 615, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(usuario, 45, 617, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(departamento, 219, 617, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText("Telefono", 393, 617, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.drawRectangle(40, 615, 170, 600, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(170, 615, 300, 600, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(300, 615, 430, 600, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(430, 615, 562, 600, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.addText("1.4 Nombre del Equipo", 45, 602, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("1.5 Marca del Equipo", 175, 602, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("1.6 Serial del Equipo", 305, 602, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("1.7 Numero BE", 435, 602, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(40, 600, 170, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(170, 600, 300, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(300, 600, 430, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.drawRectangle(430, 600, 562, 585, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(nombre, 45, 587, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(marca, 175, 587, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(serial, 305, 587, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.addText(numero, 435, 587, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.drawRectangle(40, 575, 562, 560, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(40, 560, 562, 545, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("1.8 Tipo", 45, 562, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText(tipo, 45, 547, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage.drawRectangle(40, 545, 562, 530, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(128, 128, 128));
            myFirstPage.drawRectangle(40, 530, 562, 500, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("1.9 Observaciones", 45, 532, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(255, 255, 255));
            myFirstPage.addText("", 45, 502, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 10, new sharpPDF.pdfColor(0, 0, 0));
            myFirstPage = null;
            myDoc.createPDF(Response.OutputStream);
            myDoc = null;

        }

    }
}