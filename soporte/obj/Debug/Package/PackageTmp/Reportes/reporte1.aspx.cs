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
using System.Text;

namespace soporte.Reportes
{
    public partial class reporte1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fechainicio = Server.HtmlEncode(Request.QueryString["fechainicio"]);
            string fechafinal = Server.HtmlEncode(Request.QueryString["fechafinal"]);
            int ts = Convert.ToInt16(Server.HtmlEncode(Request.QueryString["htipo"]));
            DBConnect conexion = new DBConnect();
            DataTable DTv10 = conexion.Sv10(fechainicio,fechafinal);
            int rec = DTv10.Rows.Count;
            decimal d = rec / 25;
            int t = Convert.ToInt16(decimal.Round(d, 1));
            int n = 0;
            Response.ContentType = "application/pdf";
            //System.Web.HttpContext.Current.Server.MapPath
            sharpPDF.pdfDocument myDoc = new sharpPDF.pdfDocument("Sample Application", "Me", false);
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/encabezado.gif"), "encabezado");
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/piedepagina.gif"), "pie");
            /*Table's creation*/
            if (ts == 1)
            {
                int k = 25;
                int i = 0;
                for (n = 0; n <= t; n++)
                {
                    sharpPDF.pdfPage myFirstPage = myDoc.addPage(748, 1024);
                    //sharpPDF.pdfPage myFirstPage = myDoc.addPage(210, 297);
                    sharpPDF.Tables.pdfTable myTable = new sharpPDF.Tables.pdfTable(myDoc);
                    myTable.borderSize = 1;
                    myTable.borderColor = new sharpPDF.pdfColor(0, 0, 0);
                    myTable.coordX = 50;
                    myTable.coordY = 600;
                    myTable.tableHeader.addColumn(150);
                    myTable.tableHeader.addColumn(60);
                    myTable.tableHeader.addColumn(100);
                    myTable.tableHeader.addColumn(70);
                    myTable.tableHeader.addColumn(70);
                    myTable.tableHeader.addColumn(80);
                    myTable.tableHeader.addColumn(100);
                    myTable.tableHeader.addColumn(110);
                    myTable.tableHeader.addColumn(140);
                    myFirstPage.addImage(myDoc.getImageReference("encabezado"), 20, 690);
                    myFirstPage.addText("ACTIVIDADES REALIZADAS HARDWARE", 80, 650, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 20);
                    sharpPDF.Tables.pdfTableRow myRow = myTable.createRow();
                    myRow[0].addText("SOPORTE TÉCNICO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[1].addText("CPU", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[2].addText("IMPRESORA", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[3].addText("MONITOR", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[4].addText("TECLADO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[5].addText("MOUSE", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[6].addText("REGULADOR", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[7].addText("CONEXION DE RED", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[8].addText("CONEXION DE INTERNET", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myTable.addRow(myRow);
                    myRow = null;
                    while (i < k)
                    {
                        if (i < rec)
                        {
                            sharpPDF.Tables.pdfTableRow myRow2 = myTable.createRow();
                            myRow2[0].addText(DTv10.Rows[i]["soporte"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[1].addText(DTv10.Rows[i]["cpu"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[2].addText(DTv10.Rows[i]["impresora"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[3].addText(DTv10.Rows[i]["monitor"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[4].addText(DTv10.Rows[i]["teclado"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[5].addText(DTv10.Rows[i]["mouse"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[6].addText(DTv10.Rows[i]["regulador"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[7].addText(DTv10.Rows[i]["conexionr"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[8].addText(DTv10.Rows[i]["conexioni"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myTable.addRow(myRow2);
                            myRow2 = null;
                            i++;
                        }
                        else
                        {
                            i++;
                        }
                    }
                    myFirstPage.addTable(myTable, 600);
                    myTable = null;
                    myFirstPage = null;
                    k = k + 25;
                }
            }
            if (ts == 2)
            {
                int k = 25;
                int i = 0;
                for (n = 0; n <= t; n++)
                {
                    sharpPDF.pdfPage myFirstPage = myDoc.addPage(748, 1024);
                    //sharpPDF.pdfPage myFirstPage = myDoc.addPage(210, 297);
                    sharpPDF.Tables.pdfTable myTable = new sharpPDF.Tables.pdfTable(myDoc);
                    myTable.borderSize = 1;
                    myTable.borderColor = new sharpPDF.pdfColor(0, 0, 0);
                    myTable.coordX = 50;
                    myTable.coordY = 600;
                    myTable.tableHeader.addColumn(150);
                    myTable.tableHeader.addColumn(160);
                    myTable.tableHeader.addColumn(145);
                    myTable.tableHeader.addColumn(145);
                    myTable.tableHeader.addColumn(115);
                    myTable.tableHeader.addColumn(80);
                    myTable.tableHeader.addColumn(60);
                    myTable.tableHeader.addColumn(60);
                    myFirstPage.addImage(myDoc.getImageReference("encabezado"), 20, 690);
                    myFirstPage.addText("ACTIVIDADES REALIZADAS SOFTWARE", 80, 650, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 20);
                    sharpPDF.Tables.pdfTableRow myRow = myTable.createRow();
                    myRow[0].addText("SOPORTE TÉCNICO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[1].addText("SISTEMAS ADMINISTRATIVOS", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[2].addText("SISTEMAS DE SALUD", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[3].addText("SISTEMA OPERATIVO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[4].addText("APLICACIONES", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[5].addText("WINDOWS", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[6].addText("OFFICE", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[7].addText("OTROS", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myTable.addRow(myRow);
                    myRow = null;
                    while (i < k)
                    {
                        if (i < rec)
                        {
                            sharpPDF.Tables.pdfTableRow myRow2 = myTable.createRow();
                            myRow2[0].addText(DTv10.Rows[i]["soporte"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[1].addText(DTv10.Rows[i]["sa"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[2].addText(DTv10.Rows[i]["ss"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[3].addText(DTv10.Rows[i]["so"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[4].addText(DTv10.Rows[i]["app"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[5].addText(DTv10.Rows[i]["win"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[6].addText(DTv10.Rows[i]["off"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[7].addText(DTv10.Rows[i]["otr"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myTable.addRow(myRow2);
                            myRow2 = null;
                            i++;
                        }
                        else
                        {
                            i++;
                        }
                    }
                    myFirstPage.addTable(myTable, 600);
                    myTable = null;
                    myFirstPage = null;
                    k = k + 25;
                }
            } 
            myDoc.createPDF(Response.OutputStream);
            myDoc = null;
        }
    }
}
