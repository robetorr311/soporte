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
    public partial class reporte5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fechainicio = Server.HtmlEncode(Request.QueryString["fechainicio"]);
            string fechafinal = Server.HtmlEncode(Request.QueryString["fechafinal"]);
            string dmyi = Server.HtmlEncode(Request.QueryString["dmyi"]);
            string dmyf = Server.HtmlEncode(Request.QueryString["dmyf"]);
            string tipo = Server.HtmlEncode(Request.QueryString["tipo"]);
            string eq = "";
            if (tipo == "1")
            {
                eq="C.P.U";
            }
            if (tipo == "2")
            {
                eq = "MONITOR";
            }
            if (tipo == "3")
            {
                eq = "TECLADO";
            }
            if (tipo == "4")
            {
                eq = "MOUSE";
            }
            if (tipo == "5")
            {
                eq = "IMPRESORA";
            }
            if (tipo == "6")
            {
                eq = "REGULADOR";
            }
            if (tipo == "15")
            {
                eq = "SWITCHE";
            }
            DBConnect conexion = new DBConnect();
            DataTable DTrptAllequipos = conexion.RPTAllequipos(tipo, fechainicio, fechafinal);
            DataTable datos = new DataTable();
            DataColumn columna1 = new DataColumn("Equipo");
            DataColumn columna2 = new DataColumn("Pendiente");
            DataColumn columna3 = new DataColumn("Revision");
            DataColumn columna4 = new DataColumn("Culminado");
            DataColumn columna5 = new DataColumn("Total");
            columna1.AllowDBNull = true;
            columna2.AllowDBNull = true;
            columna3.AllowDBNull = true;
            columna4.AllowDBNull = true;
            columna5.AllowDBNull = true;
            datos.Columns.Add(columna1);
            datos.Columns.Add(columna2);
            datos.Columns.Add(columna3);
            datos.Columns.Add(columna4);
            datos.Columns.Add(columna5);
            int dd = 0;
            if (DTrptAllequipos.Rows.Count > 0)
            {
                for (dd = 0; dd < DTrptAllequipos.Rows.Count; dd++)
                {
                    DataTable DTrptpendiente = conexion.RPTequipos(DTrptAllequipos.Rows[dd]["nequipo"].ToString(), tipo, "0", fechainicio, fechafinal);
                    DataTable DTrptenrevision = conexion.RPTequipos(DTrptAllequipos.Rows[dd]["nequipo"].ToString(), tipo, "1", fechainicio, fechafinal);
                    DataTable DTrptculminado = conexion.RPTequipos(DTrptAllequipos.Rows[dd]["nequipo"].ToString(), tipo, "2", fechainicio, fechafinal);
                    DataRow dr = datos.NewRow();
                    dr["Equipo"] = DTrptAllequipos.Rows[dd]["nequipo"].ToString();
                    dr["Pendiente"] = DTrptpendiente.Rows[0]["count"].ToString();
                    dr["Revision"] = DTrptenrevision.Rows[0]["count"].ToString();
                    dr["Culminado"] = DTrptculminado.Rows[0]["count"].ToString();
                    dr["Total"] = DTrptAllequipos.Rows[dd]["count"].ToString();
                    datos.Rows.Add(dr);
                }
            }
            int rec = datos.Rows.Count;
            decimal d = rec / 25;
            int t = Convert.ToInt16(decimal.Round(d, 1));
            int n = 0;
            Response.ContentType = "application/pdf";
            sharpPDF.pdfDocument myDoc = new sharpPDF.pdfDocument("Sample Application", "Me", false);
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/encabezado.gif"), "encabezado");
            myDoc.addImageReference(System.Web.HttpContext.Current.Server.MapPath("../Imagenes/piedepagina.gif"), "pie");
            int k = 25;
            int i = 0;
            for (n = 0; n <= t; n++)
            {
                sharpPDF.pdfPage myFirstPage = myDoc.addPage();
                sharpPDF.Tables.pdfTable myTable = new sharpPDF.Tables.pdfTable(myDoc);
                myTable.borderSize = 1;
                myTable.borderColor = new sharpPDF.pdfColor(0, 0, 0);
                myTable.coordX = 20;
                myTable.coordY = 650;
                myTable.tableHeader.addColumn(150);
                myTable.tableHeader.addColumn(80);
                myTable.tableHeader.addColumn(80);
                myTable.tableHeader.addColumn(80);
                myTable.tableHeader.addColumn(80);
                myFirstPage.addImage(myDoc.getImageReference("encabezado"), 50, 700);
                myFirstPage.addText("ACTIVIDADES REALIZADAS  DURANTE EL PERIODO" + dmyi + " AL " + dmyf, 20, 680, myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelvetica), 12);
                sharpPDF.Tables.pdfTableRow myRow = myTable.createRow();
                myRow[0].addText("EQUIPOS (" + eq + ")", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.Black);
                myRow[1].addText("PENDIENTE", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.Black);
                myRow[2].addText("EN REVISION", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.Black);
                myRow[3].addText("CULMINADO", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.Black);
                myRow[4].addText("TOTAL", myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaBold), 10, sharpPDF.pdfColor.Black);
                myTable.addRow(myRow);
                myRow = null;
                while (i < k)
                {
                    if (i < rec)
                    {
                        sharpPDF.Tables.pdfTableRow myRow2 = myTable.createRow();
                        myRow2[0].addText(datos.Rows[i]["Equipo"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 10, sharpPDF.pdfColor.Black);
                        myRow2[1].addText(datos.Rows[i]["Pendiente"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 10, sharpPDF.pdfColor.Black);
                        myRow2[2].addText(datos.Rows[i]["Revision"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 10, sharpPDF.pdfColor.Black);
                        myRow2[3].addText(datos.Rows[i]["Culminado"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 10, sharpPDF.pdfColor.Black);
                        myRow2[4].addText(datos.Rows[i]["Total"].ToString(), myDoc.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourier), 10, sharpPDF.pdfColor.Black);
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