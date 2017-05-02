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
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Text;


class DBConnect
{
    private System.Data.IDbConnection connection;
    private string server;
    private string database;
    private string uid;
    private string password;
    //Constructor
    public DBConnect()
    {
        Initialize();
    }
    //Initialize values
    private void Initialize()
    {
        server = "10.34.1.6";
        database = "soporte";
        uid = "soporte";
        password = "soport3";
        string connectionString;
        connectionString = "SERVER=" + server + ";" + "DATABASE=" + database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";
        connection = new MySqlConnection(connectionString);

    }
    //open connection to database
    private bool OpenConnection()
    {
        int i = 0;
        try
        {
            connection.Open();
            return true;
        }
        catch (MySqlException ex)
        {
            if ((ex.Number == 411) || (ex.Number == 415) || (ex.Number == 417))
            {
                i++;

            }
            return false;
        }
    }
    //Close connection
    private bool CloseConnection()
    {
        int i = 0;
        try
        {
            connection.Close();
            return true;
        }
        catch (MySqlException ex)
        {
            if ((ex.Number == 411) || (ex.Number == 415) || (ex.Number == 417))
            {
                i++;
            }
            return false;
        }
    }
    //Insert statement
    public void IDepartamentos(string nombre, string responsable, string telefono, string descripcion, string codigo,int estatus)
    {
            OpenConnection(); 
            System.Data.IDbCommand dbcmd = connection.CreateCommand();
            string sql = "call proc001('" + nombre + "','" +
                            responsable + "','" +
                            telefono + "','" +
                            descripcion + "','" +
                            codigo + "'," +
                            estatus + ");";
            dbcmd.CommandText = sql;
            System.Data.IDataReader reader = dbcmd.ExecuteReader();
            CloseConnection();
    }
    public int IDocumento(int hdepartamento, 
                           string solicitante,
                           string observaciones,
                           int cpu,
                           int imp,
                           int mon,
                           int tec,
                           int mou,
                           int reg,
                           int cor,
                           int coi,
                           int sa,
                           int ss,
                           int so,
                           int app,
                           int win,
                           int off,
                           int otr,
                           string esp,
                           string ideq,
                           string equipo,
                           string htipo,
                           int swi)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "call proc006(" +
                        hdepartamento + ",'" +
                        solicitante + "','" +
                        observaciones + "'," +
                        cpu + "," +
                        imp + "," +
                        mon + "," +
                        tec + "," +
                        mou + "," +
                        reg + "," +
                        cor + "," +
                        coi + "," +
                        sa + "," +
                        ss + "," +
                        so + "," +
                        app + "," +
                        win + "," +
                        off + "," +
                        otr + ",'" +
                        esp + "'," + 
                        ideq + ",'" +
                        equipo + "'," +
                        htipo + "," +
                        swi + ");";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        int iddoc = 0;
        for (int i = 0; reader.Read(); i++)
        {
            string lista = reader.GetValue(reader.GetOrdinal("LAST_INSERT_ID()")).ToString();
            iddoc = Convert.ToInt16(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return iddoc;
    }
    public void IRespuesta(int iddoc, string solucion, string observaciones)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "call proc009(" + iddoc + ",'" +
                        solucion + "','" +
                        observaciones + "');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null; 
        CloseConnection();
    }
    public void IRevision(int iddoc, int soporte, string falla, string observaciones)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "call proc007(" + iddoc + "," +
                        soporte + ",'" +
                        falla + "','" +
                        observaciones + "');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public List<string[]> SAllDepartamentos()
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id, nombre from departamento order by nombre;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[2];
            lista[0] = reader.GetString(0);
            lista[1] = reader.GetString(1);
            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado; 
    }
    public List<string[]> StelDepartamentos(string id)
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select telefono from departamento where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[2];
            lista[0] = reader.GetString(0);
            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado; 
    }
    public List<string[]> SSolicitud(string id)
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        if (id == null)
        {
            id = "0";
        }
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from v1 where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[22];
            lista[0] = reader.GetString(0);
            lista[1] = reader.GetString(1);
            lista[2] = reader.GetString(2);
            lista[3] = reader.GetString(3);
            lista[4] = reader.GetString(4);
            lista[5] = reader.GetString(5);
            lista[6] = reader.GetString(6);
            lista[7] = reader.GetString(7);
            lista[8] = reader.GetString(8);
            lista[9] = reader.GetString(9);
            lista[10] = reader.GetString(10);
            lista[11] = reader.GetString(11);
            lista[12] = reader.GetString(12);
            lista[13] = reader.GetString(13);
            lista[14] = reader.GetString(14);
            lista[15] = reader.GetString(15);
            lista[16] = reader.GetString(16);
            lista[17] = reader.GetString(17);
            lista[18] = reader.GetString(18);
            lista[19] = reader.GetString(19);
            lista[20] = reader.GetString(20);
            lista[21] = reader.GetString(22); 
            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }

    public List<string[]> SSoportes()
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from soporte;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[21];
            lista[0] = reader.GetString(0);
            lista[1] = reader.GetString(1);
            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable SSolicitudes()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id, fecha, departamento, solicitante from v1 where estatus=0;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable solicitudes = new DataTable();
        solicitudes.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return solicitudes;
    }
    public DataTable SRevisados()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id, fecha, departamento, solicitante from v1 where estatus=1;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable solicitudes = new DataTable();
        solicitudes.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return solicitudes;
    }
    public List<string[]> Srespuesta(string id)
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from v2 where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[26];
            lista[0] = reader.GetString(0);
            lista[1] = reader.GetString(1);
            lista[2] = reader.GetString(2);
            lista[3] = reader.GetString(3);
            lista[4] = reader.GetString(4);
            lista[5] = reader.GetString(5);
            lista[6] = reader.GetString(6);
            lista[7] = reader.GetString(7);
            lista[8] = reader.GetString(8);
            lista[9] = reader.GetString(9);
            lista[10] = reader.GetString(10);
            lista[11] = reader.GetString(11);
            lista[12] = reader.GetString(12);
            lista[13] = reader.GetString(13);
            lista[14] = reader.GetString(14);
            lista[15] = reader.GetString(15);
            lista[16] = reader.GetString(16);
            lista[17] = reader.GetString(17);
            lista[18] = reader.GetString(18);
            lista[19] = reader.GetString(19);
            lista[20] = reader.GetString(20);
            lista[21] = reader.GetString(21);
            lista[22] = reader.GetString(22);
            lista[23] = reader.GetString(23);
            lista[24] = reader.GetString(24);
            lista[25] = reader.GetString(25); 
            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public List<string[]> SAllTipoequipo()
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from tipoequipo where id in (1,2,3,4,5,6,15) order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[2];
            lista[0] = reader.GetString(0);
            lista[1] = reader.GetString(1);
            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public List<string[]> SAllSoperativo()
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from soperativo order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[2];
            lista[0] = reader.GetString(0);
            lista[1] = reader.GetString(1);
            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public List<string[]> STipoequipo(string id)
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from v3 where serial='" + id + "';";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[5];
            lista[0] = reader.GetString(1);
            lista[1] = reader.GetString(2);
            lista[2] = reader.GetString(3);
            lista[3] = reader.GetString(4);

            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable Sv10(string fechainicio, string fechafinal)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "SELECT " +
        "soporte as soporte," +
        "sum(sa) as sa,"+
        "sum(ss) as ss,"+
        "sum(so) as so,"+
        "sum(app) as app,"+
        "sum(win) as win,"+
        "sum(off) as off,"+
        "sum(otr) as otr,"+
        "sum(cpu) as cpu,"+
        "sum(impresora) as impresora,"+
        "sum(monitor) as monitor,"+
        "sum(teclado) as teclado,"+
        "sum(mouse) as mouse,"+
        "sum(regulador) as regulador,"+
        "sum(conexionr) as conexionr,"+
        "sum(conexioni) as conexioni"+
        " from v10 "+
        "where "+
        "fecha BETWEEN '"+
        fechainicio +
        "' and '"  +
        fechafinal +
        "' " +
        "group by soporte;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable v10 = new DataTable();
        v10.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return v10;
    }
    public DataTable Sv9()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from v9 order by departamento;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable v9 = new DataTable();
        v9.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return v9;
    }
    public DataTable Sv6()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from v6 order by departamento;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable v6 = new DataTable();
        v6.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return v6;
    }
    public void IUsuario(string login, string clave, string nombre, string estatus, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "insert into usuario " + 
            "(loggin, " +
            "password, " +
            "nombre, " +
            "estatus, " +
            "hnivel) " +
            "values " +
            "('" + login + "', " +
            "md5('" + clave + "'), " +
            "'" + nombre + "'," + estatus + "," + nivel + ");";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public List<string[]> SNiveles()
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from nivel;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[21];
            lista[0] = reader.GetString(0);
            lista[1] = reader.GetString(1);
            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable Smenu(int hpadre)
    {
        string sql = "";
        OpenConnection();
        if (hpadre == 0)
        {
        }
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        if (hpadre == 0)
        {
            sql = "select * from menu where hpadre is null and estatus=1;;";
        }
        else
        {
            sql = "select * from menu where hpadre="+ hpadre + " and estatus=1;";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable menu = new DataTable();
        menu.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return menu;
    }
    public DataTable Susuarios(string log, string pass)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from usuario "+ "where " +
            "loggin='" + log +
            "' and password=md5('" + pass + "');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuario = new DataTable();
        usuario.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuario;
    }
    public DataTable Sprocesados()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id as Id,fechasol as Fecha, departamento as Departamento, solicitante as Solicitante from v2 order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable procesados = new DataTable();
        procesados.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return procesados;
    }
    public DataTable Spendientes()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select documento.id as Id,documento.fechasol as Fecha, departamento.nombre as Departamento, documento.solicitante as Solicitante from documento, departamento where departamento.id=documento.hdepartamento and documento.estatus=0 order by documento.id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable pendientes = new DataTable();
        pendientes.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return pendientes;
    }
    public long IDequipo()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from equipos;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        int i = 0;
        while (reader.Read()) 
        {
            i++;
        }
        DateTime dt = DateTime.Now;
        int d = dt.Day;
        int m = dt.Month;
        int y = dt.Year;
        int h = dt.Hour;
        int min = dt.Minute;
        int s = dt.Second;
        int ms = dt.Millisecond;
        string sid = Convert.ToString(d) +
                    Convert.ToString(m) +
                    Convert.ToString(y) +
                    Convert.ToString(h) +
                    Convert.ToString(min) +
                    Convert.ToString(s) +
                    Convert.ToString(ms) +
                    Convert.ToString(i);

        long id = Convert.ToInt64(sid);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return id;
    }
    public void ITemporal(
                            string key,
                            string serial, 
                            string marca,
                            string numero,
                            string htdispositivo,
                            string capacidad,
                            string htipo,
                            string hequipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "insert into temporal " +
            "(clave, " + 
            "serial, " +
            "marca, " +
            "numero, " +
            "htdispositivo, " +
            "capacidad, " +
            "htipo, " +
            "hequipo) " +
            "values " +
            "(" +  key + ",'" +
                   serial + "','" + 
                   marca + "','" +
                   numero + "'," +
                   htdispositivo + ",'" +
                   capacidad + "'," +
                   htipo + "," + 
                   hequipo + ");";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public DataTable Stemporal(string hequipo, string htipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id as Id, serial as Serial, marca as Marca, numero as Numero, capacidad as Capacidad from temporal where hequipo=" + hequipo + " and htipo=" + htipo + " order by id";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public long IDdiscoduro()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from discoduro;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        long i = 0;
        while (reader.Read())
        {
            i++;
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return i;
    }
    public long IDram(string hequipo, string htipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from temporal where hequipo=" + hequipo + " and htipo=" + htipo + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        long i = 0;
        while (reader.Read())
        {
            i++;
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return i;
    }
    public void Dtemporal(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "delete from temporal where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
    }
    public string UTemporal(  string id,
                            string serial,
                            string marca,
                            string numero,
                            string capacidad)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update temporal set serial='" +
                     serial +
                     "', marca='"
                     + marca +
                     "', numero='"
                     + numero +
                     "', capacidad='"
                     + capacidad + 
                     "' where id=" + 
                     id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return sql;
    }
    public void IDispositivo(
                            string id,
                            string serial,
                            string marca,
                            string numero,
                            string htdispositivo,
                            string capacidad,
                            string htipo,
                            string hequipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        if (htipo == "7")
        {
            sql = "insert into discoduro " +
             "(id, " +
             "serial, " +
             "marca, " +
             "numero, " +
             "htdispositivo, " +
             "capacidad, " +
             "hequipo) " +
             "values " +
             "(" + id + ",'" +
                    serial + "','" +
                    marca + "','" +
                    numero + "'," +
                    htdispositivo + ",'" +
                    capacidad + "'," +
                    hequipo + ");";
        }
        if (htipo == "8")
        {
            sql = "insert into video " +
             "(id, " +
             "serial, " +
             "numero, " +
             "marca, " +
             "modelo, " +
             "htdispositivo, " +
             "hequipo) " +
             "values " +
             "(" + id + ",'" +
                    serial + "','" +
                    numero + "','" +
                    marca + "','" +
                    capacidad + "'," +
                    htdispositivo + "," +
                    hequipo + ");";
        }
        if (htipo == "9")
        {
            sql = "insert into ram " +
             "(id, " +
             "serial, " +
             "numero, " +
             "marca, " +
             "capacidad, " +
             "hequipo) " +
             "values " +
             "(" + id + ",'" +
                    serial + "','" +
                    numero + "','" +
                    marca + "','" +
                    capacidad + "'," +
                    hequipo + ");";
        }
        if (htipo == "10")
        {
            sql = "insert into procesador " +
             "(id, " +
             "serial, " +
             "modelo, " +
             "marca, " +
             "numero, " +
             "hequipo) " +
             "values " +
             "(" + id + ",'" +
                    serial + "','" +
                    capacidad + "','" +
                    marca + "','" +
                    numero + "'," +
                    hequipo + ");";
        }
        if (htipo == "11")
        {
            sql = "insert into motherboard " +
             "(id, " +
             "serial, " +
             "modelo, " +
             "marca, " +
             "numero, " +
             "hequipo) " +
             "values " +
             "(" + id + ",'" +
                    serial + "','" +
                    capacidad + "','" +
                    marca + "','" +
                    numero + "'," +
                    hequipo + ");";
        }
        if (htipo == "12")
        {
            sql = "insert into sonido " +
             "(id, " +
             "serial, " +
             "modelo, " +
             "marca, " +
             "numero, " +
             "htdispositivo, " +
             "hequipo) " +
             "values " +
             "(" + id + ",'" +
                    serial + "','" +
                    capacidad + "','" +
                    marca + "','" +
                    numero + "'," +
                    htdispositivo + "," +
                    hequipo + ");";
        }
        if (htipo == "14")
        {
            sql = "insert into lan " +
             "(id, " +
             "serial, " +
             "modelo, " +
             "marca, " +
             "numero, " +
             "htdispositivo, " +
             "hequipo) " +
             "values " +
             "(" + id + ",'" +
                    serial + "','" +
                    capacidad + "','" +
                    marca + "','" +
                    numero + "'," +
                    htdispositivo + "," +
                    hequipo + ");";
        }
        if (htipo == "16")
        {
            sql = "insert into cdrom " +
             "(id, " +
             "serial, " +
             "modelo, " +
             "numero, " +
             "htdispositivo, " +
             "hequipo) " +
             "values " +
             "(" + id + ",'" +
                    serial + "','" +
                    capacidad + "','" +
                    numero + "'," +
                    htdispositivo + "," +
                    hequipo + ");";
        } 
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public DataTable SAlltemporal(string hequipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from temporal where hequipo=" + hequipo + " order by id";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public string IEquipo(string id,
                        string serial,
                        string marca,
                        string numero,
                        string htipo,
                        string responsable,
                        string hdepartamento,
                        string observaciones,
                        string nombre,
                        string estatus,
                        string hsoftware,
                        string modelo,
                        string htdispositivo
                       )
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        if (htipo == "1")
        {
            sql = "insert into equipos " +
                               "(id," +
                               "serial," +
                               "marca," +
                               "numero," +
                               "htipo," +
                               "responsable," +
                               "hdepartamento," +
                               "estatus," +
                               "hsoftware," +
                               "observaciones," +
                               "nombre) values (" +
                               id + ",'" +
                               serial + "','" +
                               marca + "','" +
                               numero + "'," +
                               htipo + ",'" +
                               responsable + "'," +
                               hdepartamento + "," +
                               estatus + "," +
                               hsoftware + ",'" +
                               observaciones + "','" +
                               nombre + "');";
        }
        if (htipo == "2")
        {
            sql = "insert into monitores " +
                               "(id," +
                               "marca," +
                               "serial," +
                               "numero," +
                               "responsable," +
                               "hdepartamento," +
                               "estatus," +
                               "observaciones," +
                               "htipo," +
                               "nombre) values (" +
                               id + ",'" +
                               marca + "','" +
                               serial + "','" +
                               numero + "','" +
                               responsable + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               observaciones + "'," +
                               htipo + ",'" +
                               nombre + "');";
        }
        if (htipo == "3")
        {
            sql = "insert into teclados " +
                               "(id," +
                               "serial," +
                               "marca," +
                               "numero," +
                               "htipo," +
                               "responsable," +
                               "hdepartamento," +
                               "estatus," +
                               "observaciones," +
                               "nombre) values (" +
                               id + ",'" +
                               serial + "','" +
                               marca + "','" +
                               numero + "'," +
                               htipo + ",'" +
                               responsable + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               observaciones + "','" +
                               nombre + "');";
        }
        if (htipo == "4")
        {
            sql = "insert into mouse " +
                               "(id," +
                               "marca," +
                               "modelo," +
                               "serial," +
                               "htdispositivo," +
                               "numero," +
                               "responsable," +
                               "hdepartamento," +
                               "estatus," +
                               "observaciones," +
                               "nombre," +
                               "htipo) values (" +
                               id + ",'" +
                               marca + "','" +
                               modelo + "','" +
                               serial + "'," +
                               htdispositivo + ",'" +
                               numero + "','" +
                               responsable + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               observaciones + "','" +
                               nombre + "'," +
                               htipo + ");";
        }
        if (htipo == "5")
        {
            sql = "insert into impresoras " +
                               "(id," +
                               "marca," +
                               "modelo," +
                               "serial," +
                               "htdispositivo," +
                               "responsable," +
                               "hdepartamento," +
                               "estatus," +
                               "numero," +
                               "observaciones," +
                               "htipo," +
                               "nombre) values (" +
                               id + ",'" +
                               marca + "','" +
                               modelo + "','" +
                               serial + "'," +
                               htdispositivo + ",'" +
                               responsable + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               numero + "','" +
                               observaciones + "'," +
                               htipo + ",'" +
                               nombre + "');";
        }
        if (htipo == "6")
        {
            sql = "insert into reguladores " +
                               "(id," +
                               "serial," +
                               "marca," +
                               "numero," +
                               "htipo," +
                               "responsable," +
                               "hdepartamento," +
                               "estatus," +
                               "observaciones," +
                               "nombre) values (" +
                               id + ",'" +
                               serial + "','" +
                               marca + "','" +
                               numero + "'," +
                               htipo + ",'" +
                               responsable + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               observaciones + "','" +
                               nombre + "');";
        }
        if (htipo == "15")
        {
            sql = "insert into switches " +
                               "(id," +
                               "serial," +
                               "marca," +
                               "numero," +
                               "responsable," +
                               "hdepartamento," +
                               "estatus," +
                               "observaciones) values (" +
                               id + ",'" +
                               serial + "','" +
                               marca + "','" +
                               numero + "','" +
                               responsable + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               observaciones + "');";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return sql;
    }
    public int ISoftware(string hso,
                         string aplicaciones,
                         string sistemas,
                         string observaciones)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "call proc008(" +
                        hso + ",'" +
                        aplicaciones + "','" +
                        sistemas + "','" +
                        observaciones + "');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        int iddoc = 0;
        for (int i = 0; reader.Read(); i++)
        {
            string lista = reader.GetValue(reader.GetOrdinal("LAST_INSERT_ID()")).ToString();
            iddoc = Convert.ToInt16(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return iddoc;
    }
    public void EliminarTemp(string hequipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "delete from temporal where hequipo=" + hequipo + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public List<string[]> Shtdisp(string htipo)
    {
        List<string[]> listado = new List<string[]>();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from tdispositivo where htipo=" + htipo + " order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            string[] lista = new string[2];
            lista[0] = reader.GetString(0);
            lista[1] = reader.GetString(1);
            listado.Add(lista);
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable SAllequipos()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select equipos.id as Id, equipos.nombre as Nombre, equipos.responsable as responsable, departamento.nombre as Departamento from equipos, departamento where departamento.id=equipos.hdepartamento order by equipos.nombre";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable Selecthtipo(string nequipo,string htipo)
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        if (htipo == "1")
        {
            sql = "select * from equipos where nombre='" + nequipo + "';";
        }
        if (htipo == "2")
        {
            sql = "select * from monitores where nombre='" + nequipo + "';";
        }
        if (htipo == "3")
        {
            sql = "select * from teclados where nombre='" + nequipo + "';";
        }
        if (htipo == "4")
        {
            sql = "select * from mouse where nombre='" + nequipo + "';";
        }
        if (htipo == "5")
        {
            sql = "select * from impresoras where nombre='" + nequipo + "';";
        }
        if (htipo == "6")
        {
            sql = "select * from reguladores where nombre='" + nequipo + "';";
        }
        if (htipo == "15")
        {
            sql = "select * from switches where nombre='" + nequipo + "';";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuario = new DataTable();
        usuario.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuario;
    }
    public DataTable SelectSwitche()
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        sql = "select id as Id, nombre as Nombre from switches order by nombre";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuario = new DataTable();
        usuario.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuario;
    }
    public DataTable SelectPlanilla(string nombre)
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        sql = "select * from v11 where nombre='" + nombre + "';";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuario = new DataTable();
        usuario.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuario;
    }
    public DataTable SelectDiscoDuro(string idequipo)
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        sql = "select * from vdiscoduros where hequipo= "+idequipo +";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuario = new DataTable();
        usuario.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuario;
    }
    public DataTable SelectRAM(string idequipo)
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        sql = "select * from ram where hequipo= " + idequipo + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuario = new DataTable();
        usuario.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuario;
    }
    public DataTable SAllimpresoras()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select impresoras.id as Id, impresoras.nombre as Nombre, impresoras.responsable as responsable, departamento.nombre as Departamento from impresoras, departamento where departamento.id=impresoras.hdepartamento order by impresoras.nombre";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable SAllmonitores()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select monitores.id as Id, monitores.nombre as Nombre, monitores.responsable as responsable, departamento.nombre as Departamento from monitores, departamento where departamento.id=monitores.hdepartamento order by monitores.nombre";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable SVImpresoras(string idimpresora)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from vimpresoras where id=" + idimpresora;
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable SVMonitores(string idmonitor)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from vmonitores where id=" + idmonitor;
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable SEquProcesados(string idequipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id as Id,fechasol as Fecha, departamento as Departamento, solicitante as Solicitante from v2 where hequipo=" + idequipo + " order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable procesados = new DataTable();
        procesados.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return procesados;
    }
    public DataTable SEquServicio(string idequipo, string estatus)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select documento.id as Id,"+
                     "documento.fechasol as Fecha," +
                     "departamento.nombre as Departamento," +
                     "documento.solicitante as Solicitante" +
                     " from documento, departamento "+
                     "where departamento.id=documento.hdepartamento and hequipo=" + 
                     idequipo + 
                     " and estatus=" + 
                     estatus + 
                     " order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable procesados = new DataTable();
        procesados.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return procesados;
    }
    public DataTable SAllequiposdep(string departamento)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select equipos.id as Id, equipos.nombre as Nombre, equipos.responsable as responsable, departamento.nombre as Departamento from equipos, departamento where departamento.id=equipos.hdepartamento and equipos.hdepartamento=" + departamento + " order by equipos.nombre";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable SelectSwitcheDep(string departamento)
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        sql = "select id as Id, nombre as Nombre from switches where hdepartamento=" + departamento + " order by nombre";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuario = new DataTable();
        usuario.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuario;
    }
    public DataTable SelectComputadora()
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        sql = "select ideq as Id, nombre as Nombre, responsable as Responsable, departamento as Departamento from v11 group by nombre;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuario = new DataTable();
        usuario.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuario;
    }
    public DataTable SEquSol(string idequipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select Id,Fecha, Departamento, Solicitante,Tipo,Estatus from vistadocumento where Equipo='" + idequipo + "' order by Id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable procesados = new DataTable();
        procesados.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return procesados;
    }
    public DataTable SUsuSol(string usuario)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select Id,Fecha, Departamento, Solicitante,Tipo,Estatus from vistadocumento where Solicitante='" + usuario + "' order by Id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable procesados = new DataTable();
        procesados.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return procesados;
    }
    public DataTable SSol()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select Id,Fecha, Departamento, Solicitante,Tipo,Estatus from vistadocumento order by Fecha;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable procesados = new DataTable();
        procesados.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return procesados;
    }
    public DataTable EnRevision(string iddoc)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string hfalla = "";
        string sql = "select hfalla from documento where id="+ iddoc +";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        while (reader.Read())
        {
            hfalla = reader.GetValue(reader.GetOrdinal("hfalla")).ToString();
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        OpenConnection();
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();
        string sql2 = "select falla, observaciones from fsoporte where id=" + hfalla + ";";
        dbcmd2.CommandText = sql2;
        System.Data.IDataReader reader2 = dbcmd2.ExecuteReader();
        DataTable procesados = new DataTable();
        procesados.Load(reader2);
        CloseConnection();
        reader2.Close();
        reader2 = null;
        dbcmd2.Dispose();
        dbcmd2 = null;
        return procesados;
    }
    public DataTable BuscaSoporte(string iddoc)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string hsoporte = "";
        string sql = "select hsoporte from documento where id=" + iddoc + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        while (reader.Read())
        {
            hsoporte = reader.GetValue(reader.GetOrdinal("hsoporte")).ToString();
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        OpenConnection();
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();
        string sql2 = "select * from soporte where id=" + hsoporte + ";";
        dbcmd2.CommandText = sql2;
        System.Data.IDataReader reader2 = dbcmd2.ExecuteReader();
        DataTable procesados = new DataTable();
        procesados.Load(reader2);
        CloseConnection();
        reader2.Close();
        reader2 = null;
        dbcmd2.Dispose();
        dbcmd2 = null;
        return procesados;
    }
    public DataTable  SDepUsu(string loggin)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string hdepartamento = "";
        string sql = "select hdepartamento from usuario where loggin='" + loggin + "';";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        while (reader.Read())
        {
            hdepartamento = reader.GetValue(reader.GetOrdinal("hdepartamento")).ToString();
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        OpenConnection();
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();
        string sql2 = "select id, nombre from departamento where id=" + hdepartamento + ";";
        dbcmd2.CommandText = sql2;
        System.Data.IDataReader reader2 = dbcmd2.ExecuteReader();
        DataTable procesados = new DataTable();
        procesados.Load(reader2);
        CloseConnection();
        reader2.Close();
        reader2 = null;
        dbcmd2.Dispose();
        dbcmd2 = null;
        return procesados;
    }

}
