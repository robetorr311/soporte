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

namespace soporte.Reportes
{
    public partial class reporte2 : System.Web.UI.Page
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
            DataTable DTv9 = conexion.Sv9();
            int rec = DTv9.Rows.Count;
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
                    myFirstPage.addImage(myDoc.getImageReference("encabezado"), 20, 690);
                    myFirstPage.addText("FALLAS DE SOFTWARE REPORTADAS Y SOLVENTADAS POR CADA DEPARTAMENTO", 80, 650, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 20);
                    sharpPDF.Tables.pdfTableRow myRow = myTable.createRow();
                    myRow[0].addText("DEPARTAMENTO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[1].addText("SA", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[2].addText("SAP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[3].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[4].addText("SS", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[5].addText("SSP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[6].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[7].addText("SO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[8].addText("SOP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[9].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[10].addText("AP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[11].addText("APP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[12].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[13].addText("WIN", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[14].addText("WINP", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myRow[15].addText("%", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    myTable.addRow(myRow);
                    myRow = null;
                    while (i < k)
                    {
                        if (i < rec)
                        {
                            sharpPDF.Tables.pdfTableRow myRow2 = myTable.createRow();
                            myRow2[0].addText(DTv9.Rows[i]["departamento"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[1].addText(DTv9.Rows[i]["sarep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[2].addText(DTv9.Rows[i]["saresp"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[3].addText(DTv9.Rows[i]["sap"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[4].addText(DTv9.Rows[i]["ssrep"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[5].addText(DTv9.Rows[i]["ssresp"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[6].addText(DTv9.Rows[i]["ssp"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[7].addText(DTv9.Rows[i]["sorep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[8].addText(DTv9.Rows[i]["soresp"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[9].addText(DTv9.Rows[i]["sop"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[10].addText(DTv9.Rows[i]["apprep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[11].addText(DTv9.Rows[i]["appresp"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[12].addText(DTv9.Rows[i]["appp"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[13].addText(DTv9.Rows[i]["winrep"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[14].addText(DTv9.Rows[i]["winresp"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[15].addText(DTv9.Rows[i]["winp"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
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
                    myFirstPage.drawRectangle(20, 55, 990, 20, new sharpPDF.pdfColor(0, 0, 0), new sharpPDF.pdfColor(255, 255, 255));
                    myFirstPage.addText("SA = Sistemas Administrativos", 30, 45, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myFirstPage.addText("SAP = Fallas de Sistemas Administrativos Procesados", 30, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myFirstPage.addText("SS = Sistemas de Salud", 230, 45, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myFirstPage.addText("SSP = Fallas de Sistemas de Salud Procesados", 230, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myFirstPage.addText("SO = Sistemas Operativos", 430, 45, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myFirstPage.addText("SOP = Fallas de Sistemas Operativos Procesados", 430, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myFirstPage.addText("AP = Aplicaciones", 630, 45, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myFirstPage.addText("APP = Aplicaciones Procesadas", 630, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myFirstPage.addText("WIN = Windows", 780, 45, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myFirstPage.addText("WINP = Fallas de Windows Procesadas",780, 25, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 8, new sharpPDF.pdfColor(0, 51, 153));
                    myTable = null;
                    myFirstPage = null;
                    k = k + 25;
                }
            myDoc.createPDF(Response.OutputStream);
            myDoc = null;
        }
    }
}
