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

namespace soporte.Reportes
{
    public partial class reporte7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string htipo = Server.HtmlEncode(Request.QueryString["htipo"]);
            string capacidad = Server.HtmlEncode(Request.QueryString["capacidad"]);
            string modelo = Server.HtmlEncode(Request.QueryString["modelo"]);
            DBConnect conexion = new DBConnect();
            DataTable contar=new DataTable();
            contar = conexion.SCountDisp(htipo, capacidad, modelo);
            int rec = contar.Rows.Count;
            decimal d = rec / 25;
            int t = Convert.ToInt16(decimal.Round(d, 1));
            int n = 0;
            Response.ContentType = "application/pdf";
            sharpPDF.pdfDocument myDoc = new sharpPDF.pdfDocument("Sample Application", "Me", false);
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/encabezado.gif"), "encabezado");
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/piedepagina.gif"), "pie");
            /*Table's creation*/
            int k = 25;
            int i = 0;
            for (n = 0; n <= t; n++)
            {
                   sharpPDF.pdfPage myFirstPage = myDoc.addPage();
                   //sharpPDF.pdfPage myFirstPage = myDoc.addPage(748, 1024);
                    sharpPDF.Tables.pdfTable myTable = new sharpPDF.Tables.pdfTable(myDoc);
                    myTable.borderSize = 1;
                    myTable.borderColor = new sharpPDF.pdfColor(0, 0, 0);
                    myTable.coordX = 50;
                    myTable.coordY = 600;
                    myTable.tableHeader.addColumn(150);
                    myTable.tableHeader.addColumn(160);
                    myTable.tableHeader.addColumn(100);
                    myFirstPage.addImage(myDoc.getImageReference("encabezado"), 20, 690);
                    myFirstPage.addText("CANTIDAD DE DISPOSITIVOS EXISTENTES", 80, 650, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 20);
                    sharpPDF.Tables.pdfTableRow myRow = myTable.createRow();
                    if (htipo == "7")
                    {
                        myRow[0].addText("DISCO DURO TIPO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[1].addText("CAPACIDAD", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[2].addText("TOTAL", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    }
                    if (htipo == "8")
                    {
                        myRow[0].addText("TARJETA TIPO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[1].addText("MODELO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[2].addText("TOTAL", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    }
                    if (htipo == "9")
                    {
                        myRow[0].addText("MEMORIA TIPO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[1].addText("CAPACIDAD", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[2].addText("TOTAL", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    }
                    if (htipo == "10")
                    {
                        myRow[0].addText("PROCESADOR TIPO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[1].addText("MODELO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[2].addText("TOTAL", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    } 
                    if (htipo == "11")
                    {
                        myRow[0].addText("TARJETA TIPO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[1].addText("MODELO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[2].addText("TOTAL", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    }
                    if (htipo == "12")
                    {
                        myRow[0].addText("TARJETA TIPO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[1].addText("MODELO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[2].addText("TOTAL", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    }
                    if (htipo == "14")
                    {
                        myRow[0].addText("TARJETA TIPO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[1].addText("MODELO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[2].addText("TOTAL", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    }
                    if (htipo == "16")
                    {
                        myRow[0].addText("CDROM TIPO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[1].addText("MODELO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                        myRow[2].addText("TOTAL", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.DarkBlue);
                    }
                    myTable.addRow(myRow);
                    myRow = null;
                    while (i < k)
                    {
                        if (i < rec)
                        {
                            sharpPDF.Tables.pdfTableRow myRow2 = myTable.createRow();
                            myRow2[0].addText(contar.Rows[i]["dispositivo"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[1].addText(contar.Rows[i]["capacidad"].ToString().ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
                            myRow2[2].addText(contar.Rows[i]["total"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 9, sharpPDF.pdfColor.Blue);
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
            myDoc.createPDF(Response.OutputStream);
            myDoc = null;
        }

    }
}