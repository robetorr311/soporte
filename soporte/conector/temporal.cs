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
using Npgsql;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Text;
class DTtemporal
{
    private static DataTable temporal = new DataTable();
    private static DataColumn columna1 = new DataColumn("id");
    private static DataColumn columna2 = new DataColumn("key");
    private static DataColumn columna3 = new DataColumn("serial");
    private static DataColumn columna4 = new DataColumn("marca");
    private static DataColumn columna5 = new DataColumn("numero");
    private static DataColumn columna6 = new DataColumn("capacidad");
    private static DataColumn columna7 = new DataColumn("htdispositivo");
    private static DataColumn columna8 = new DataColumn("htipo");
    private static DataColumn columna9 = new DataColumn("hequipo");
    public DataTable Inicializar()
    {
        columna1.AutoIncrement = true;
        columna2.AllowDBNull = true;
        columna3.AllowDBNull = true;
        columna4.AllowDBNull = true;
        columna5.AllowDBNull = true;
        columna6.AllowDBNull = true;
        columna7.AllowDBNull = true;
        columna8.AllowDBNull = true;
        columna9.AllowDBNull = true;
        columna1.AutoIncrement = true;
        temporal.Columns.Add(columna1);
        temporal.Columns.Add(columna2);
        temporal.Columns.Add(columna3);
        temporal.Columns.Add(columna4);
        temporal.Columns.Add(columna5);
        temporal.Columns.Add(columna6);
        temporal.Columns.Add(columna7);
        temporal.Columns.Add(columna8);
        temporal.Columns.Add(columna9);
        return temporal;
    }
    public void Finalizar()
    {
        temporal.Dispose();
        temporal.Columns.Clear();
    } 
 
}