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

namespace soporte.Reportes
{
    public partial class reporte3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int mmm = 0;
            string menu = Server.HtmlEncode(Request.QueryString["menu"]);
            if (menu == "1")
            {
                mmm++;
            }
            else
            {
                Response.Redirect("../Default.aspx");
            }
            DBConnect conexion = new DBConnect();
            DataTable DTv6 = conexion.Sv6();
            int rec = DTv6.Rows.Count;
            decimal d = rec / 25;
            int t = Convert.ToInt16(decimal.Round(d, 1));
            int n = 0;
            Response.ContentType = "application/pdf";
            //System.Web.HttpContext.Current.Server.MapPath
            sharpPDF.pdfDocument myDoc = new sharpPDF.pdfDocument("Sample Application", "Me", false);
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/encabezado.gif"), "encabezado");
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/piedepagina.gif"), "pie");
            /*Table's creation*/
            int k = 25;
            int i = 0;
            for (n = 0; n <= t; n++)
            {
                sharpPDF.pdfPage myFirstPage = myDoc.addPage(748, 1024);
                //sharpPDF.pdfPage myFirstPage = myDoc.addPage(210, 297);
                sharpPDF.Tables.pdfTable myTable = new sharpPDF.Tables.pdfTable(myDoc);
                myTable.borderSize = 1;
                myTable.borderColor = new sharpPDF.pdfColor(0, 0, 0);
                myTable.coordX = 20;
                myTable.coordY = 600;
                myTable.tableHeader.addColumn(150);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(60);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(60);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(60);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(60);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(60);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(40);
                myTable.tableHeader.addColumn(60); 
                myFirstPage.addImage(myDoc.getImageReference("encabezado"), 20, 690);
                myFirstPage.addText("FALLAS DE HARDWARE REPORTADAS Y SOLVENTADAS POR CADA DEPARTAMENTO", 80, 650, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 20);
                sharpPDF.Tables.pdfTableRow myRow = myTable.createRow();
                myRow[0].addText("DEPARTAMENTO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[1].addText("CPU", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[2].addText("CPUP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[3].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[4].addText("IMP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[5].addText("IMPP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[6].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[7].addText("MON", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[8].addText("MONP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[9].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[10].addText("TEC", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[11].addText("TECP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[12].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[13].addText("MOU", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[14].addText("MOUP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[15].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[16].addText("REG", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[17].addText("REGP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myRow[18].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                myTable.addRow(myRow);
                myRow = null;
                while (i < k)
                {
                    if (i < rec)
                    {
                        sharpPDF.Tables.pdfTableRow myRow2 = myTable.createRow();
                        myRow2[0].addText(DTv6.Rows[i]["departamento"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[1].addText(DTv6.Rows[i]["cpurep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[2].addText(DTv6.Rows[i]["cpures"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[3].addText(DTv6.Rows[i]["cpup"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[4].addText(DTv6.Rows[i]["impresorarep"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[5].addText(DTv6.Rows[i]["impresorares"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[6].addText(DTv6.Rows[i]["impresorap"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[7].addText(DTv6.Rows[i]["monitorrep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[8].addText(DTv6.Rows[i]["monitorres"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[9].addText(DTv6.Rows[i]["cmonitor"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[10].addText(DTv6.Rows[i]["tecladorep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[11].addText(DTv6.Rows[i]["tecladores"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[12].addText(DTv6.Rows[i]["tecladop"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[13].addText(DTv6.Rows[i]["mouserep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[14].addText(DTv6.Rows[i]["mouseres"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[15].addText(DTv6.Rows[i]["mousep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[16].addText(DTv6.Rows[i]["reguladorrep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[17].addText(DTv6.Rows[i]["reguladorres"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                        myRow2[18].addText(DTv6.Rows[i]["reguladorp"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
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
                myFirstPage.drawRectangle(20, 45, 990, 10, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                myFirstPage.addText("CPU = CPU Reportados", 30, 35, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("CPUP = Fallas de CPU resueltas", 30, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("IMP = Impresoras reportadas", 230, 35, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("IMPP = Fallas de Impresoras resueltas", 230, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("MON = Monitores Reportados", 430, 35, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("MONP = Fallas de Monitores Resueltas", 430, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("TEC = Teclados Reportados", 630, 35, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("TECP = Fallas de Teclados Resueltas", 630, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("MOU = Mouse Reportados", 780, 35, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("MOUP = Fallas de Mouse Resueltas", 780, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("REG = Reguladores Reportados", 30, 15, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myFirstPage.addText("REP = Fallas de Mouse Resueltas", 230, 15, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                myTable = null;
                myFirstPage = null;
                k = k + 25;
            }
            myDoc.createPDF(Response.OutputStream);
            myDoc = null;
        }
    }
}
