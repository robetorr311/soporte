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
class DBConnect
{
    static NpgsqlConnection connection = new NpgsqlConnection();
    static string CadenaDeConexion = "server=localhost; port=5432; User Id=soporte; Password=soport3; Database=soporte;";
    private void OpenConnection()
    {
        if (connection.State != ConnectionState.Open)
        {
            connection.ConnectionString = CadenaDeConexion;
            //Abrimos la conexión.
            connection.Open();
        }
    }
    public static void CloseConnection()
    {
        //Cerramos la conexión.
        connection.Close();
    }
    public int EquipoDocumento(string id)
    {
        DataTable equipos = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from documento where hequipo=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        equipos.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        int eq = equipos.Rows.Count;
        return eq;
    }
    public void IDepartamentos(string nombre, string responsable, string telefono, string descripcion, string codigo,int estatus)
    {
            OpenConnection(); 
            System.Data.IDbCommand dbcmd = connection.CreateCommand();
            string sql = "select proc001('" + nombre.ToUpper() + "','" +
                            responsable.ToUpper() + "','" +
                            telefono.ToUpper() + "','" +
                            descripcion.ToUpper() + "','" +
                            codigo + "'," +
                            estatus + ");";
            dbcmd.CommandText = sql;
            System.Data.IDataReader reader = dbcmd.ExecuteReader();
            reader.Close();
            reader = null;
            dbcmd.Dispose();
            dbcmd = null;
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
        string sql = "select proc006(" +
                        hdepartamento + ",'" +
                        solicitante.ToUpper() + "','" +
                        observaciones.ToUpper() + "'," +
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
            string lista = reader.GetValue(reader.GetOrdinal("proc006")).ToString();
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
        string sql = "select proc009(" + iddoc + ",'" +
                        solucion.ToUpper() + "','" +
                        observaciones.ToUpper() + "');";
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
        string sql = "select proc007(" + iddoc + "," +
                        soporte + ",'" +
                        falla.ToUpper() + "','" +
                        observaciones.ToUpper() + "');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public DataTable SAllDepartamentos()
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id, nombre from departamento order by nombre;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado; 
    }
    public string Buscaestatus(string nombre)
    {
        string dispositivo = "";
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from estatus where nombre='" + nombre + "';";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            dispositivo = reader.GetValue(reader.GetOrdinal("id")).ToString();
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return dispositivo;
    }
    public string Buscahnivel(string nombre)
    {
        string dispositivo = "";
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from nivel where nombre='" + nombre + "';";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            dispositivo = reader.GetValue(reader.GetOrdinal("id")).ToString();
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return dispositivo;
    }
    public string Buscahdepartamento(string nombre)
    {
        string dispositivo = "";
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from departamento where nombre='" + nombre + "';";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            dispositivo = reader.GetValue(reader.GetOrdinal("id")).ToString();
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return dispositivo;
    }
    public string Buscahtdispositivo(string id)
    {
        string dispositivo = "";
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from tdispositivo where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            dispositivo = reader.GetValue(reader.GetOrdinal("nombre")).ToString();
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return dispositivo;
    }
    public DataTable SestatusUsu()
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from estatus where id in (5,6);";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable Shtdispositivo(string id)
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from tdispositivo where htipo=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable StelDepartamentos(string id)
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select telefono from departamento where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado; 
    }
    public DataTable SSolicitud(string id)
    {
        DataTable listado = new DataTable();
        OpenConnection();
        if (id == null)
        {
            id = "0";
        }
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from v1 where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable SSoportes()
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from soporte;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }

    public int Svususop(string husuario)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql1 = "select * from vusuariossoporte where loggin='" + husuario + "';";
        dbcmd.CommandText = sql1;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable solicitudes = new DataTable();
        solicitudes.Load(reader);
        int registros = solicitudes.Rows.Count;
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return registros;
    }
    public DataTable SUsuariosSoporte(string loggin)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql1 = "select * from vusuariossoporte where loggin='" + loggin + "';";
        dbcmd.CommandText = sql1;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuariossoporte = new DataTable();
        usuariossoporte.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuariossoporte;
    }
    public DataTable SUsuariosSoporteId(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql1 = "select * from vusuariossoporte21 where idusuario=" + id + ";";
        dbcmd.CommandText = sql1;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuariossoporte = new DataTable();
        usuariossoporte.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return usuariossoporte;
    }
    public int SRNv2(string husuario)
    {
        OpenConnection();
        string sql2 = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql1 = "select * from vusuariossoporte where loggin='" + husuario + "';";
        dbcmd.CommandText = sql1;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuariossoporte = new DataTable();
        usuariossoporte.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        OpenConnection();
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();
        if (usuariossoporte.Rows.Count > 0)
        {
            sql2 = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=1 and hsoporte=" + usuariossoporte.Rows[0]["idsoporte"].ToString() + ";";
        }
        else
        {
            sql2 = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=1 and hsoporte=0;";
        }
        dbcmd2.CommandText = sql2;
        System.Data.IDataReader reader2 = dbcmd2.ExecuteReader();
        DataTable solicitudes = new DataTable();
        solicitudes.Load(reader2);
        CloseConnection();
        reader2.Close();
        reader2 = null;
        dbcmd2.Dispose();
        dbcmd2 = null;
        return solicitudes.Rows.Count;
    }
    public int SSNv2(string husuario)
    {
        OpenConnection();
        string sql2 = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql1 = "select * from vusuariossoporte where loggin='" + husuario + "';";
        dbcmd.CommandText = sql1;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuariossoporte = new DataTable();
        usuariossoporte.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        OpenConnection();
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();
        if (usuariossoporte.Rows.Count > 0)
        {
            sql2 = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=0 and hsoporte=" + usuariossoporte.Rows[0]["idsoporte"].ToString() + ";";
        }
        else
        {
            sql2 = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=0 and hsoporte=0;";
        }
        dbcmd2.CommandText = sql2;
        System.Data.IDataReader reader2 = dbcmd2.ExecuteReader();
        DataTable solicitudes = new DataTable();
        solicitudes.Load(reader2);
        CloseConnection();
        reader2.Close();
        reader2 = null;
        dbcmd2.Dispose();
        dbcmd2 = null;
        return solicitudes.Rows.Count;
    }
    public DataTable SSolicNiv2(string husuario)
    {
        OpenConnection();
        string sql2 = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql1 = "select * from vusuariossoporte where loggin='" + husuario + "';";
        dbcmd.CommandText = sql1;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuariossoporte = new DataTable();
        usuariossoporte.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        OpenConnection();
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();
        if (usuariossoporte.Rows.Count > 0)
        {
            sql2 = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=0 and hsoporte=" + usuariossoporte.Rows[0]["idsoporte"].ToString() + ";";
        }
        else
        {
            sql2 = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=0 and hsoporte=0;";
        }
        dbcmd2.CommandText = sql2;
        System.Data.IDataReader reader2 = dbcmd2.ExecuteReader();
        DataTable solicitudes = new DataTable();
        solicitudes.Load(reader2);
        CloseConnection();
        reader2.Close();
        reader2 = null;
        dbcmd2.Dispose();
        dbcmd2 = null;
        return solicitudes;
    }
    public DataTable SSolicitudesA()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=0 and hsoporte is null;";
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
    public DataTable SRevNiv2(string husuario)
    {
        OpenConnection();
        string sql2 = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql1 = "select * from vusuariossoporte where loggin='" + husuario + "';";
        dbcmd.CommandText = sql1;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable usuariossoporte = new DataTable();
        usuariossoporte.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        OpenConnection();
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();
        if (usuariossoporte.Rows.Count > 0)
        {
            sql2 = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=1 and hsoporte=" + usuariossoporte.Rows[0]["idsoporte"].ToString() + ";";
        }
        else
        {
            sql2 = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=1 and hsoporte=0;";
        }
        dbcmd2.CommandText = sql2;
        System.Data.IDataReader reader2 = dbcmd2.ExecuteReader();
        DataTable solicitudes = new DataTable();
        solicitudes.Load(reader2);
        CloseConnection();
        reader2.Close();
        reader2 = null;
        dbcmd2.Dispose();
        dbcmd2 = null;
        return solicitudes;
    }
    public DataTable SRevSop()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id, fecha, departamento, solicitante from vdocumentosoporte where estatus=1;";
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
    public DataTable Srespuesta(string id)
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from v2 where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable Sperifericos()
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from tipoequipo where id in (2,3,4,5,6) order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable SAllTipoequipo()
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from tipoequipo where id in (1,2,3,4,5,6,15) order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable SAllSoperativo()
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from soperativo order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable STipoequipo(string id)
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from v3 where serial='" + id + "';";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
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
    public void ISoporte(string login, string usuario)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "insert into soporte " +
            "(nombre,husuario,estatus) " +
            "values " +
            "('" + login + "'," + usuario + ",1);";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public void IUsuario(string login, string clave, string nombre, string estatus, string nivel, string hdepartamento)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "insert into usuario " + 
            "(loggin, " +
            "password, " +
            "nombre, " +
            "estatus, " +
            "hnivel,hdepartamento) " +
            "values " +
            "('" + login + "', " +
            "md5('" + clave + "'), " +
            "'" + nombre.ToUpper() + "'," + estatus + "," + nivel + "," + hdepartamento + ");";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public DataTable SNiveles()
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from nivel;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
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
    public DataTable SAllusuarios()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from usuario where hnivel in (1,2);";
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
    public DataTable Svistausuarios()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from vistausuarios;";
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
    public DataTable SusuNiv2()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from usuario where hnivel=2 and estatus=0;";
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
        string sql = "select last_value from id_equipo;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        int i = 0;
        while (reader.Read()) 
        {
            i = Convert.ToInt32(reader.GetValue(reader.GetOrdinal("last_value")).ToString());
        }
        i++;
        string sql2 = "select setval('id_equipo'," + i + ",true);";
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();     
        dbcmd2.CommandText = sql2;
        System.Data.IDataReader reader2 = dbcmd2.ExecuteReader();
        DateTime dt = DateTime.Now;
        int ms = dt.Millisecond;
        string sid = Convert.ToString(i) + Convert.ToString(ms);
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
                   tilde(serial).ToUpper() + "','" +
                   tilde(marca).ToUpper() + "','" +
                   tilde(numero).ToUpper() + "'," +
                   htdispositivo + ",'" +
                   tilde(capacidad).ToUpper() + "'," +
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
    public void IAuditoria(string loggin,string hmenu)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "insert into auditoria " +
            "(loggin, fechayhora,hmenu) values ('" +
            loggin + "',now()," + hmenu +");";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
    }
    public void IAsignaciones(
        string hsoporte,
        string hdocumento,
        string hestatus
        )
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "insert into asignadas " +
            "(hsoporte, fechayhora, hdocumento, estatus) values (" +
            hsoporte + ",now()," +
            hdocumento + ",0);";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
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
    public void Dcartuchos(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "delete from cartuchos where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
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
    public void Dequipo(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "delete from equipos where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
    }
    public void dusuario(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "delete from usuario where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
    }
    public void Dsoporte(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "delete from soporte where id=" + id + ";";
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
                     tilde(serial).ToUpper() +
                     "', marca='"
                     + tilde(marca).ToUpper() +
                     "', numero='"
                     + tilde(numero).ToUpper() +
                     "', capacidad='"
                     + tilde(capacidad).ToUpper() + 
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
    public void Uestatus(string iddoc, string estatus)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update documento set estatus=" +
                     estatus +
                     " where id=" +
                     iddoc + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public void UestatusU(string id, string estatus)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update usuario set estatus=" +
                     estatus +
                     " where id=" +
                     id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public string Uusuario(string id,
                         string loggin, 
                         string password, 
                         string nombre,
                         string estatus,
                         string hnivel,
                         string hdepartamento)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update usuario set loggin='" + loggin +
                     "', password=md5('" + password + "') " +
                     ", "  + "nombre='" + nombre + 
                     "', estatus=" + estatus +
                     ", hnivel=" + hnivel +
                     " , hdepartamento="+ hdepartamento + " where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return sql;
    }
    public void Uasignadas(string hsoporte, string hdocumento, string estatus)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update asignadas set estatus=1" +
                     " where hdocumento=" +
                     hdocumento + " and hsoporte=" + hsoporte + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public void UDocSop(string iddoc, string hsoporte)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update documento set hsoporte=" +
                     hsoporte +
                     " where id=" +
                     iddoc + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public string ICartucho(string marca,
                            string modelo,
                            string serial,
                            string htdispositivo,
                            string estatus,
                            string numero,
                            string observaciones,
                            string htipo,
                            string himpresora)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        sql = "insert into cartuchos " +
             "(marca, " +
             "modelo, " +
             "serial, " +
             "htdispositivo, " +
             "estatus, " +
             "numero, observaciones, htipo, himpresora) " +
             "values " +
             "('" +  tilde(marca).ToUpper() + "','" +
                    tilde(modelo).ToUpper() + "','" +
                    tilde(serial).ToUpper() + "'," +
                    htdispositivo + "," +
                    estatus + ",'" +
                    tilde(numero).ToUpper() + "','" +
                    tilde(observaciones).ToUpper() + "'," +
                    htipo + "," +
                    himpresora + ");";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return sql;
    }
    public string IDispositivo(
                            string id,
                            string serial,
                            string marca,
                            string numero,
                            string htdispositivo,
                            string capacidad,
                            string htipo,
                            string hequipo,
                            string hcapacidadram)
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
             "hequipo, hcapacidaddd) " +
             "values " +
             "(" + id + "7,'" +
                    tilde(serial).ToUpper() + "','" +
                    tilde(marca).ToUpper() + "','" +
                    tilde(numero).ToUpper() + "'," +
                    htdispositivo + ",'" +
                    tilde(capacidad).ToUpper() + "'," +
                    hequipo + ", " + hcapacidadram + ");";
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
             "(" + id + "8,'" +
                    tilde(serial).ToUpper() + "','" +
                    tilde(numero).ToUpper() + "','" +
                    tilde(marca).ToUpper() + "','" +
                    tilde(capacidad).ToUpper() + "'," +
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
             "htdispositivo, " +
             "hequipo,hcapacidadram) " +
             "values " +
             "(" + id + "9,'" +
                    tilde(serial).ToUpper() + "','" +
                    tilde(numero).ToUpper() + "','" +
                    tilde(marca).ToUpper() + "','" +
                    tilde(capacidad).ToUpper() + "'," +
                    htdispositivo + "," +
                    hequipo + ", " + hcapacidadram + ");";
        }
        if (htipo == "10")
        {
            sql = "insert into procesador " +
             "(id, " +
             "serial, " +
             "modelo, " +
             "marca, " +
             "numero, " +
             "htdispositivo, " +
             "hequipo) " +
             "values " +
             "(" + id + "10,'" +
                    tilde(serial).ToUpper() + "','" +
                    tilde(capacidad).ToUpper() + "','" +
                    tilde(marca).ToUpper() + "','" +
                    tilde(numero).ToUpper() + "'," +
                    htdispositivo + "," +
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
             "htdispositivo, " +
             "hequipo) " +
             "values " +
             "(" + id + "11,'" +
                    tilde(serial).ToUpper() + "','" +
                    tilde(capacidad).ToUpper() + "','" +
                    tilde(marca).ToUpper() + "','" +
                    tilde(numero).ToUpper() + "'," +
                    htdispositivo + "," +
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
             "(" + id + "12,'" +
                    tilde(serial).ToUpper() + "','" +
                    tilde(capacidad).ToUpper() + "','" +
                    tilde(marca).ToUpper() + "','" +
                    tilde(numero).ToUpper() + "'," +
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
             "(" + id + "14,'" +
                    tilde(serial).ToUpper() + "','" +
                    tilde(capacidad).ToUpper() + "','" +
                    tilde(marca).ToUpper() + "','" +
                    tilde(numero).ToUpper() + "'," +
                    htdispositivo + "," +
                    hequipo + ");";
        }
        if (htipo == "16")
        {
            sql = "insert into cdrom " +
             "(id, " +
             "serial, " +
             "marca, " +
             "modelo, " +
             "numero, " +
             "htdispositivo, " +
             "hequipo) " +
             "values " +
             "(" + id + "16,'" +
                    tilde(serial).ToUpper() + "','" +
                    tilde(marca).ToUpper() + "','" +
                    tilde(capacidad).ToUpper() + "','" +
                    tilde(numero).ToUpper() + "'," +
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
        return sql;
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
                               tilde(serial).ToUpper() + "','" +
                               tilde(marca).ToUpper() + "','" +
                               tilde(numero).ToUpper() + "'," +
                               htipo + ",'" +
                               tilde(responsable).ToUpper() + "'," +
                               hdepartamento + "," +
                               estatus + "," +
                               hsoftware + ",'" +
                               tilde(observaciones).ToUpper() + "','" +
                               tilde(nombre).ToUpper() + "');";
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
                               "nombre,modelo,htdispositivo) values (" +
                               id + ",'" +
                               tilde(marca).ToUpper() + "','" +
                               tilde(serial).ToUpper() + "','" +
                               tilde(numero).ToUpper() + "','" +
                               tilde(responsable).ToUpper() + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               tilde(observaciones).ToUpper() + "'," +
                               htipo + ",'" +
                               tilde(nombre).ToUpper() + "','" +
                               tilde(modelo).ToUpper() + "'," +
                               htdispositivo + ");";
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
                               "nombre,modelo,htdispositivo) values (" +
                               id + ",'" +
                               tilde(serial).ToUpper() + "','" +
                               tilde(marca).ToUpper() + "','" +
                               tilde(numero).ToUpper() + "'," +
                               htipo + ",'" +
                               tilde(responsable).ToUpper() + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               tilde(observaciones).ToUpper() + "','" +
                               tilde(nombre).ToUpper() + "','" +
                               tilde(modelo).ToUpper() + "'," +
                               htdispositivo + ");"; 
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
                               tilde(marca).ToUpper() + "','" +
                               tilde(modelo).ToUpper() + "','" +
                               tilde(serial).ToUpper() + "'," +
                               htdispositivo + ",'" +
                               tilde(numero).ToUpper() + "','" +
                               tilde(responsable).ToUpper() + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               tilde(observaciones).ToUpper() + "','" +
                               tilde(nombre).ToUpper() + "'," +
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
                               tilde(marca).ToUpper() + "','" +
                               tilde(modelo).ToUpper() + "','" +
                               tilde(serial).ToUpper() + "'," +
                               htdispositivo + ",'" +
                               tilde(responsable).ToUpper() + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               tilde(numero).ToUpper() + "','" +
                               tilde(observaciones).ToUpper() + "'," +
                               htipo + ",'" +
                               tilde(nombre).ToUpper() + "');";
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
                               "nombre,modelo,htdispositivo) values (" +
                               id + ",'" +
                               tilde(serial).ToUpper() + "','" +
                               tilde(marca).ToUpper() + "','" +
                               tilde(numero).ToUpper() + "'," +
                               htipo + ",'" +
                               tilde(responsable).ToUpper() + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               tilde(observaciones).ToUpper() + "','" +
                               tilde(nombre).ToUpper() + "','" +
                               tilde(modelo).ToUpper() + "'," +
                               htdispositivo + ");";
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
                               tilde(serial).ToUpper() + "','" +
                               tilde(marca).ToUpper() + "','" +
                               tilde(numero).ToUpper() + "','" +
                               tilde(responsable).ToUpper() + "'," +
                               hdepartamento + "," +
                               estatus + ",'" +
                               tilde(observaciones).ToUpper() + "');";
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
        string sql = "select proc008(" +
                        hso + ",'" +
                        aplicaciones.ToUpper() + "','" +
                        sistemas.ToUpper() + "','" +
                        observaciones.ToUpper() + "');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        int iddoc = 0;
        for (int i = 0; reader.Read(); i++)
        {
            string lista = reader.GetValue(reader.GetOrdinal("proc008")).ToString();
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
    public DataTable Scapacidaddd()
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from capacidaddd order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable Scapacidadram()
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from capacidadram order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return listado;
    }
    public DataTable Shtdisp(string htipo)
    {
        DataTable listado = new DataTable();
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from tdispositivo where htipo=" + htipo + " order by id;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        listado.Load(reader);
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
    public DataTable SCartuchos(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from cartuchos where himpresora=" + id + ";";
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
    public DataTable SEditequipos()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select equipos.id as Id, equipos.serial as Serial, equipos.marca as Marca, equipos.numero as Numero, equipos.nombre as Nombre, equipos.responsable as Responsable, departamento.nombre as Departamento from equipos, departamento where departamento.id=equipos.hdepartamento order by equipos.nombre";
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
    public DataTable Stequipos(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select id, nombre from equipos where id <> "+ id + "order by nombre;";
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
    public DataTable SAllPCs()
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
    public DataTable SAllmouses()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select mouse.id as Id, mouse.nombre as Nombre, mouse.responsable as responsable, departamento.nombre as Departamento from mouse, departamento where departamento.id=mouse.hdepartamento order by mouse.nombre";
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
    public DataTable SAllreguladores()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select reguladores.id as Id, reguladores.nombre as Nombre, reguladores.responsable as responsable, departamento.nombre as Departamento from reguladores, departamento where departamento.id=reguladores.hdepartamento order by reguladores.nombre";
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
    public DataTable SAllteclados()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select teclados.id as Id, teclados.nombre as Nombre, teclados.responsable as responsable, departamento.nombre as Departamento from teclados, departamento where departamento.id=teclados.hdepartamento order by teclados.nombre";
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
    public DataTable SAllswitches()
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select switches.id as Id, switches.nombre as Nombre, switches.responsable as responsable, departamento.nombre as Departamento from switches, departamento where departamento.id=switches.hdepartamento order by switches.nombre";
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
    public DataTable SVPCs(string idpc)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from vequipos where id=" + idpc;
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
    public DataTable SVmouses(string idpc)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from vmouse where id=" + idpc;
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
    public DataTable SVteclados(string idpc)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from vteclados where id=" + idpc;
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
    public DataTable SVreguladores(string idpc)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from vreguladores where id=" + idpc;
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
    public DataTable SVswitches(string idpc)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from vswitches where id=" + idpc;
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
    public DataTable SAllequiposdep(string departamento, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();

        string sql = "";
        if (nivel == "1")
        {
            sql = "select equipos.id as Id, equipos.nombre as Nombre, equipos.responsable as responsable, departamento.nombre as Departamento from equipos, departamento where departamento.id=equipos.hdepartamento order by equipos.nombre";
        }
        else
        {
            sql = "select equipos.id as Id, equipos.nombre as Nombre, equipos.responsable as responsable, departamento.nombre as Departamento from equipos, departamento where departamento.id=equipos.hdepartamento and equipos.hdepartamento=" + departamento + " order by equipos.nombre";
        }
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
    public DataTable SelectSwitcheDep(string departamento, string nivel)
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        if (nivel == "1")
        {
            sql = "select id as Id, nombre as Nombre from switches order by nombre";
        }
        else
        {
            sql = "select id as Id, nombre as Nombre from switches where hdepartamento=" + departamento + " order by nombre";
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
    public DataTable SelectComputadora()
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        sql = "select ideq as Id, nombre as Nombre, responsable as Responsable, departamento as Departamento from v11 group by ideq, nombre,responsable,departamento;";
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
        string sql = "select Id,Fecha, Departamento, Solicitante,Tipo,Estatus from vistadocumento where hequipo=" + idequipo + " order by Id;";
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
    public DataTable SDep(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();
        string sql2 = "select id, nombre from departamento where id=" + id + ";";
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
    public DataTable SAllimpresorasu(string hdep, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select impresoras.id as Id, impresoras.nombre as Nombre, impresoras.responsable as responsable, departamento.nombre as Departamento from impresoras, departamento where departamento.id=impresoras.hdepartamento and hdepartamento="+ hdep +" order by impresoras.nombre";
        if (nivel == "1")
        {
            sql = "select impresoras.id as Id, impresoras.nombre as Nombre, impresoras.responsable as responsable, departamento.nombre as Departamento from impresoras, departamento where departamento.id=impresoras.hdepartamento order by impresoras.nombre";
        }
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
    public DataTable SAllmonitoresu(string hdep, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select monitores.id as Id, monitores.nombre as Nombre, monitores.responsable as responsable, departamento.nombre as Departamento from monitores, departamento where departamento.id=monitores.hdepartamento and hdepartamento=" + hdep + " order by monitores.nombre";
        if (nivel == "1")
        {
            sql = "select impresoras.id as Id, impresoras.nombre as Nombre, impresoras.responsable as responsable, departamento.nombre as Departamento from impresoras, departamento where departamento.id=impresoras.hdepartamento order by impresoras.nombre";
        }
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
    public DataTable SAllPCsu(string hdep, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select equipos.id as Id, equipos.nombre as Nombre, equipos.responsable as responsable, departamento.nombre as Departamento from equipos, departamento where departamento.id=equipos.hdepartamento and hdepartamento=" + hdep + " order by equipos.nombre";
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
    public DataTable SAllmousesu(string hdep, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select mouse.id as Id, mouse.nombre as Nombre, mouse.responsable as responsable, departamento.nombre as Departamento from mouse, departamento where departamento.id=mouse.hdepartamento and hdepartamento=" + hdep + " order by mouse.nombre";
        if (nivel == "1")
        {
            sql = "select impresoras.id as Id, impresoras.nombre as Nombre, impresoras.responsable as responsable, departamento.nombre as Departamento from impresoras, departamento where departamento.id=impresoras.hdepartamento order by impresoras.nombre";
        }
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
    public DataTable SAllreguladoresu(string hdep, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select reguladores.id as Id, reguladores.nombre as Nombre, reguladores.responsable as responsable, departamento.nombre as Departamento from reguladores, departamento where departamento.id=reguladores.hdepartamento and hdepartamento=" + hdep + " order by reguladores.nombre";
        if (nivel == "1")
        {
            sql = "select impresoras.id as Id, impresoras.nombre as Nombre, impresoras.responsable as responsable, departamento.nombre as Departamento from impresoras, departamento where departamento.id=impresoras.hdepartamento order by impresoras.nombre";
        }
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
    public DataTable SAlltecladosu(string hdep, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select teclados.id as Id, teclados.nombre as Nombre, teclados.responsable as responsable, departamento.nombre as Departamento from teclados, departamento where departamento.id=teclados.hdepartamento and hdepartamento=" + hdep + " order by teclados.nombre";
        if (nivel == "1")
        {
            sql = "select impresoras.id as Id, impresoras.nombre as Nombre, impresoras.responsable as responsable, departamento.nombre as Departamento from impresoras, departamento where departamento.id=impresoras.hdepartamento order by impresoras.nombre";
        }
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
    public DataTable SAllswitchesu(string hdep, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select switches.id as Id, switches.nombre as Nombre, switches.responsable as responsable, departamento.nombre as Departamento from switches, departamento where departamento.id=switches.hdepartamento and hdepartamento=" + hdep + " order by switches.nombre";
        if (nivel == "1")
        {
            sql = "select impresoras.id as Id, impresoras.nombre as Nombre, impresoras.responsable as responsable, departamento.nombre as Departamento from impresoras, departamento where departamento.id=impresoras.hdepartamento order by impresoras.nombre";
        }
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
    public DataTable RPTpendiente(string soporte, string fecha1, string fecha2)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from rptpendiente('" +
        soporte + "','" + 
        fecha1 + " 00:00:00','" + 
        fecha2 +" 23:59:00');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        if (temporal.Rows.Count == 0)
        {
            DataRow dr = temporal.NewRow();
            dr["soporte"] = "NULL";
            dr["sa"] = "0";
            dr["ss"] = "0";
            dr["so"] = "0";
            dr["app"] = "0";
            dr["win"] = "0";
            dr["off"] = "0";
            dr["otr"] = "0";
            dr["cpu"] = "0";
            dr["impresora"] = "0";
            dr["monitor"] = "0";
            dr["teclado"] = "0";
            dr["mouse"] = "0";
            dr["regulador"] = "0";
            dr["conexionr"] = "0";
            dr["conexioni"] = "0";
            dr["total"] = "0"; 
            temporal.Rows.Add(dr);
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable RPTenrevision(string soporte, string fecha1, string fecha2)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from rptenrevision('" +
        soporte + "','" +
        fecha1 + " 00:00:00','" +
        fecha2 + " 23:59:00');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        if (temporal.Rows.Count == 0)
        {
            DataRow dr = temporal.NewRow();
            dr["soporte"] = "NULL";
            dr["sa"] = "0";
            dr["ss"] = "0";
            dr["so"] = "0";
            dr["app"] = "0";
            dr["win"] = "0";
            dr["off"] = "0";
            dr["otr"] = "0";
            dr["cpu"] = "0";
            dr["impresora"] = "0";
            dr["monitor"] = "0";
            dr["teclado"] = "0";
            dr["mouse"] = "0";
            dr["regulador"] = "0";
            dr["conexionr"] = "0";
            dr["conexioni"] = "0";
            dr["total"] = "0";
            temporal.Rows.Add(dr);
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable RPTculminado(string soporte, string fecha1, string fecha2)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from rptculminado('" +
        soporte + "','" +
        fecha1 + " 00:00:00','" +
        fecha2 + " 23:59:00');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        if (temporal.Rows.Count == 0)
        {
            DataRow dr = temporal.NewRow();
            dr["soporte"] = "NULL";
            dr["sa"] = "0";
            dr["ss"] = "0";
            dr["so"] = "0";
            dr["app"] = "0";
            dr["win"] = "0";
            dr["off"] = "0";
            dr["otr"] = "0";
            dr["cpu"] = "0";
            dr["impresora"] = "0";
            dr["monitor"] = "0";
            dr["teclado"] = "0";
            dr["mouse"] = "0";
            dr["regulador"] = "0";
            dr["conexionr"] = "0";
            dr["conexioni"] = "0";
            dr["total"] = "0";
            temporal.Rows.Add(dr);
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public void Usoportes(string id, string nombre, string husuario, string estatus)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update soporte set " +
                    "estatus=" + estatus +
                    ", nombre='" + nombre.ToUpper() +
                    "' , husuario=" + husuario +
                     " where id=" +
                     id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public DataTable SelectComponente(string hequipo, string htipo)
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        if (htipo == "7")
        {
            sql = "select * from discoduro where hequipo='" + hequipo + "';";
        }
        if (htipo == "8")
        {
            sql = "select * from video where hequipo='" + hequipo + "';";
        }
        if (htipo == "9")
        {
            sql = "select * from ram where hequipo='" + hequipo + "';";
        }
        if (htipo == "10")
        {
            sql = "select * from procesador where hequipo='" + hequipo + "';";
        }
        if (htipo == "11")
        {
            sql = "select * from motherboard where hequipo='" + hequipo + "';";
        }
        if (htipo == "12")
        {
            sql = "select * from sonido where hequipo='" + hequipo + "';";
        }
        if (htipo == "14")
        {
            sql = "select * from lan where hequipo='" + hequipo + "';";
        }
        if (htipo == "16")
        {
            sql = "select * from cdrom where hequipo='" + hequipo + "';";
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
    public void UDispositivo(
                            string id,
                            string serial,
                            string marca,
                            string numero,
                            string capacidad,
                            string htipo,
                            string hcapacidadram)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        if (htipo == "7")
        {
            sql = "update discoduro " +
             "set serial='" + tilde(serial).ToUpper() + "' " +
            ", marca='" + tilde(marca).ToUpper() + "' " +
            ", numero='" + tilde(numero).ToUpper() + "' " +
            ", capacidad='" + tilde(capacidad).ToUpper() + "', hcapacidaddd=" + hcapacidadram +
             " where id=" +  id + ";";
        }
        if (htipo == "8")
        {
            sql = "update video " +
             "set serial='" + tilde(serial).ToUpper() + "' " +
             ", numero='" + tilde(numero).ToUpper() + "' " +
             ", marca='" + tilde(marca).ToUpper() + "' " +
             ", modelo='" + tilde(capacidad).ToUpper() + "' " +
             " where id=" + id + ";";
        }
        if (htipo == "9")
        {
            sql = "update ram " +
             "set serial='" + tilde(serial).ToUpper() + "' " +
             ", numero='" + tilde(numero).ToUpper() + "' " +
             ", marca='" + tilde(marca).ToUpper() + "' " +
             ", capacidad='" + tilde(capacidad).ToUpper() + "', hcapacidadram=" + hcapacidadram +
             " where id=" + id + ";";
        }
        if (htipo == "10")
        {
            sql = "update procesador " +
             "set serial='" + tilde(serial).ToUpper() + "' " +
             ", numero='" + tilde(numero).ToUpper() + "' " +
             ", marca='" + tilde(marca).ToUpper() + "' " +
             ", modelo='" + tilde(capacidad).ToUpper() + "' " +
             " where id=" + id + ";";
        }
        if (htipo == "11")
        {
            sql = "update motherboard " +
             "set serial='" + tilde(serial).ToUpper() + "' " +
             ", numero='" + tilde(numero).ToUpper() + "' " +
             ", marca='" + tilde(marca).ToUpper() + "' " +
             ", modelo='" + tilde(capacidad).ToUpper() + "' " +
             " where id=" + id + ";";
        }
        if (htipo == "12")
        {
            sql = "update sonido " +
             "set serial='" + tilde(serial).ToUpper() + "' " +
             ", numero='" + tilde(numero).ToUpper() + "' " +
             ", marca='" + tilde(marca).ToUpper() + "' " +
             ", modelo='" + tilde(capacidad).ToUpper() + "' " +
             " where id=" + id + ";";
        }
        if (htipo == "14")
        {
            sql = "update lan " +
             "set serial='" + tilde(serial).ToUpper() + "' " +
             ", numero='" + tilde(numero).ToUpper() + "' " +
             ", marca='" + tilde(marca).ToUpper() + "' " +
             ", modelo='" + tilde(capacidad).ToUpper() + "' " +
             " where id=" + id + ";";
        }
        if (htipo == "16")
        {
            sql = "update cdrom " +
             "set serial='" + tilde(serial).ToUpper() + "' " +
             ", numero='" + tilde(numero).ToUpper() + "' " +
             ", marca='" + tilde(marca).ToUpper() + "' " +
             ", modelo='" + tilde(capacidad).ToUpper() + "' " +
             " where id=" + id + ";";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public string Uid_temp()
    {
        OpenConnection();
        long v = 0;
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select last_value from id_temp;";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            v = Convert.ToInt32(reader.GetValue(reader.GetOrdinal("last_value")).ToString());
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        v = v + 1;
        OpenConnection();
        System.Data.IDbCommand dbcmd2 = connection.CreateCommand();
        string sql2 = "select setval('id_temp'," + v + ",true);";
        dbcmd2.CommandText = sql2;
        System.Data.IDataReader reader2 = dbcmd2.ExecuteReader();
        reader2.Close();
        reader2 = null;
        dbcmd2.Dispose();
        dbcmd2 = null;
        CloseConnection();
        return Convert.ToString(v);
    }
    public void DDispositivo(string id,string htipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        if (htipo == "7")
        {
            sql = "delete from discoduro where id=" + id +";";
        }
        if (htipo == "8")
        {
            sql = "delete from video where id=" + id + ";";
        }
        if (htipo == "9")
        {
            sql = "delete from ram where id=" + id + ";";
        }
        if (htipo == "10")
        {
            sql = "delete from procesador where id=" + id + ";";
        }
        if (htipo == "11")
        {
            sql = "delete from motherboard where id=" + id + ";";
        }
        if (htipo == "12")
        {
            sql = "delete from sonido where id=" + id + ";";
        }
        if (htipo == "14")
        {
            sql = "delete from lan where id=" + id + ";";
        }
        if (htipo == "16")
        {
            sql = "delete from cdrom where id=" + id + ";";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public void UEquipos(string id, string serial,string marca,string numero,string nombre,string responsable, string departamento)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update equipos set " +
                     "serial='" + tilde(serial).ToUpper() + "', " +
                     "marca='" + tilde(marca).ToUpper() + "', " +
                     "numero='" + tilde(numero).ToUpper() + "', " +
                     "nombre='" + tilde(nombre).ToUpper() + "', " +
                     "responsable='" + tilde(responsable).ToUpper() + "', " +
                     "hdepartamento=" + departamento +
                     " where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public void UPerifericos(string id, string serial, string marca, string numero, string nombre, string responsable, string departamento, string modelo, string htdispositivo, string htipo)
    {
        string sql = "";
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        if (htipo == "2")
        {
            sql = "update monitores set " +
                         "serial='" + tilde(serial).ToUpper() + "', " +
                         "marca='" + tilde(marca).ToUpper() + "', " +
                         "numero='" + tilde(numero).ToUpper() + "', " +
                         "nombre='" + tilde(nombre).ToUpper() + "', " +
                         "responsable='" + tilde(responsable).ToUpper() + "', " +
                         "hdepartamento=" + departamento + ", " +
                         "modelo='" + tilde(modelo).ToUpper() + "', " +
                         "htdispositivo=" + htdispositivo +
                         " where id=" + id + ";";
        }
        if (htipo == "3")
        {
            sql = "update teclados set " +
                         "serial='" + tilde(serial).ToUpper() + "', " +
                         "marca='" + tilde(marca).ToUpper() + "', " +
                         "numero='" + tilde(numero).ToUpper() + "', " +
                         "nombre='" + tilde(nombre).ToUpper() + "', " +
                         "responsable='" + tilde(responsable).ToUpper() + "', " +
                         "hdepartamento=" + departamento + ", " +
                         "modelo='" + tilde(modelo).ToUpper() + "', " +
                         "htdispositivo=" + htdispositivo +
                         " where id=" + id + ";";
        }
        if (htipo == "4")
        {
            sql = "update mouse set " +
                         "serial='" + tilde(serial).ToUpper() + "', " +
                         "marca='" + tilde(marca).ToUpper() + "', " +
                         "numero='" + tilde(numero).ToUpper() + "', " +
                         "nombre='" + tilde(nombre).ToUpper() + "', " +
                         "responsable='" + tilde(responsable).ToUpper() + "', " +
                         "hdepartamento=" + departamento + ", " +
                         "modelo='" + tilde(modelo).ToUpper() + "', " +
                         "htdispositivo=" + htdispositivo +
                         " where id=" + id + ";";
        }
        if (htipo == "5")
        {
            sql = "update impresora set " +
                         "serial='" + tilde(serial).ToUpper() + "', " +
                         "marca='" + tilde(marca).ToUpper() + "', " +
                         "numero='" + tilde(numero).ToUpper() + "', " +
                         "nombre='" + tilde(nombre).ToUpper() + "', " +
                         "responsable='" + tilde(responsable).ToUpper() + "', " +
                         "hdepartamento=" + departamento + ", " +
                         "modelo='" + tilde(modelo).ToUpper() + "', " +
                         "htdispositivo=" + htdispositivo +
                         " where id=" + id + ";";
        }
        if (htipo == "6")
        {
            sql = "update reguladores set " +
                         "serial='" + tilde(serial).ToUpper() + "', " +
                         "marca='" + tilde(marca).ToUpper() + "', " +
                         "numero='" + tilde(numero).ToUpper() + "', " +
                         "nombre='" + tilde(nombre).ToUpper() + "', " +
                         "responsable='" + tilde(responsable).ToUpper() + "', " +
                         "hdepartamento=" + departamento + ", " +
                         "modelo='" + tilde(modelo).ToUpper() + "', " +
                         "htdispositivo=" + htdispositivo +
                         " where id=" + id + ";";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public void UEquipoDocumento(string id, string nombre)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update documento set equipo='"+nombre + "' where id=" + id + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public DataTable SelectCompTemp(string hequipo, string htipo)
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        sql = "select * from temporal where hequipo=" + hequipo + " and htipo=" + htipo +" ;";
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
    public void UCambios(
                            string id,
                            string hequipo,
                            string htipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        if (htipo == "7")
        {
            sql = "update discoduro " +
             "set hequipo=" + hequipo + " " +
             " where id=" + id + ";";
        }
        if (htipo == "8")
        {
            sql = "update video " +
             "set hequipo=" + hequipo + " " +
             " where id=" + id + ";";
        }
        if (htipo == "9")
        {
            sql = "update ram " +
             "set hequipo=" + hequipo + " " +
             " where id=" + id + ";";
        }
        if (htipo == "10")
        {
            sql = "update procesador " +
             "set hequipo=" + hequipo + " " +
             " where id=" + id + ";";
        }
        if (htipo == "11")
        {
            sql = "update motherboard " +
             "set hequipo=" + hequipo + " " +
             " where id=" + id + ";";
        }
        if (htipo == "12")
        {
            sql = "update sonido " +
             "set hequipo=" + hequipo + " " +
             " where id=" + id + ";";
        }
        if (htipo == "14")
        {
            sql = "update lan " +
             "set hequipo=" + hequipo + " " +
             " where id=" + id + ";";
        }
        if (htipo == "16")
        {
            sql = "update cdrom " +
             "set hequipo=" + hequipo + " " +
             " where id=" + id + ";";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public void ICambios(
                            string horigen,
                            string hdestino,
                            string motivo,
                            string htipo,
                            string hdispositivo
        )
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        sql = "insert into cambios " +
         "(horigen, hdestino, fecha, motivo, htipo, hdispositivo) values (" +
         horigen + "," +
         hdestino + ",now(),'" +
         motivo.ToUpper() + "'," +
         htipo + "," +
         hdispositivo + ");";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public DataTable SDispositivo(string id, string htipo)
    {
        OpenConnection();
        string sql = "";
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        if (htipo == "7")
        {
            sql = "select * from discoduro where id='" + id + "';";
        }
        if (htipo == "8")
        {
            sql = "select * from video where id='" + id + "';";
        }
        if (htipo == "9")
        {
            sql = "select * from ram where id='" + id + "';";
        }
        if (htipo == "10")
        {
            sql = "select * from procesador where id='" + id + "';";
        }
        if (htipo == "11")
        {
            sql = "select * from motherboard where id='" + id + "';";
        }
        if (htipo == "12")
        {
            sql = "select * from sonido where id='" + id + "';";
        }
        if (htipo == "14")
        {
            sql = "select * from lan where id='" + id + "';";
        }
        if (htipo == "16")
        {
            sql = "select * from cdrom where id='" + id + "';";
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
    public void IDesincorporados(
        string id,
        string serial,
        string marca,
        string numero,
        string htdispositivo,
        string capacidad,
        string htipo,
        string hequipo,
        string clave,
        string motivo
       )
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "insert into desincorporados " +
            "(id,serial,marca,numero,htdispositivo,capacidad,htipo,hequipo,clave,motivo, fecha) " +
            "values (" +
            id + ",'" +
            tilde(serial).ToUpper() + "','" +
            tilde(marca).ToUpper() + "','" +
            tilde(numero).ToUpper() + "'," +
            htdispositivo + ",'" +
            tilde(capacidad).ToUpper() + "'," +
            htipo + "," +
            hequipo + ",0,'" +
            tilde(motivo).ToUpper() + "',now());";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public string tilde(string cadena)
    {
        string cadenan;
        cadenan = cadena.Replace("'", "''");
        return cadenan;
    }
    public DataTable SVPerifericos(string htipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        if (htipo == "2")
        {
            sql = "select * from vmonitoresp;";
        }
        if (htipo == "3")
        {
            sql = "select * from vtecladosp;";
        }
        if (htipo == "4")
        {
            sql = "select * from vmousep;";
        }
        if (htipo == "5")
        {
            sql = "select * from vimpresorasp;";
        }
        if (htipo == "6")
        {
            sql = "select * from vreguladoresp;";
        }    
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
    public string Hdepartamento(string id, string htipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        string dispositivo = "";
        if (htipo == "2")
        {
            sql = "select * from monitores where id =" + id + ";";
        }
        if (htipo == "3")
        {
            sql = "select * from teclados where id =" + id + ";";
        }
        if (htipo == "4")
        {
            sql = "select * from mouse where id =" + id + ";";
        }
        if (htipo == "5")
        {
            sql = "select * from impresoras where id =" + id + ";";
        }
        if (htipo == "6")
        {
            sql = "select * from reguladores where id =" + id + ";";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            dispositivo = reader.GetValue(reader.GetOrdinal("hdepartamento")).ToString();
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return dispositivo;
    }
    public string Htperiferico(string id, string htipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        string dispositivo = "";
        if (htipo == "2")
        {
            sql = "select * from monitores where id =" + id + ";";
        }
        if (htipo == "3")
        {
            sql = "select * from teclados where id =" + id + ";";
        }
        if (htipo == "4")
        {
            sql = "select * from mouse where id =" + id + ";";
        }
        if (htipo == "5")
        {
            sql = "select * from impresoras where id =" + id + ";";
        }
        if (htipo == "6")
        {
            sql = "select * from reguladores where id =" + id + ";";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        for (int i = 0; reader.Read(); i++)
        {
            dispositivo = reader.GetValue(reader.GetOrdinal("htdispositivo")).ToString();
        }
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return dispositivo;
    }
    public void DPerifericos(string id, string htipo)
    {
        string sql = "";
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        if (htipo == "2")
        {
            sql = "delete from monitores" +
                         " where id=" + id + ";";
        }
        if (htipo == "3")
        {
            sql = "delete from teclados" +
                         " where id=" + id + ";";
        }
        if (htipo == "4")
        {
            sql = "delete from mouse" +
                         " where id=" + id + ";";
        }
        if (htipo == "5")
        {
            sql = "delete from impresoras" +
                         " where id=" + id + ";";
        }
        if (htipo == "6")
        {
            sql = "delete from reguladores" +
                       " where id=" + id + ";";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
    }
    public DataTable SPeriferico(string id, string htipo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        DataTable dispositivo = new DataTable();
        if (htipo == "2")
        {
            sql = "select * from monitores where id =" + id + ";";
        }
        if (htipo == "3")
        {
            sql = "select * from teclados where id =" + id + ";";
        }
        if (htipo == "4")
        {
            sql = "select * from mouse where id =" + id + ";";
        }
        if (htipo == "5")
        {
            sql = "select * from impresoras where id =" + id + ";";
        }
        if (htipo == "6")
        {
            sql = "select * from reguladores where id =" + id + ";";
        }
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        dispositivo.Load(reader);
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return dispositivo;
    }
    public DataTable SVPerifericosDep(string htipo,string departamento, string nivel)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        if (nivel == "1")
        {
            if (htipo == "2")
            {
                sql = "select * from vmonitoresp;";
            }
            if (htipo == "3")
            {
                sql = "select * from vtecladosp;";
            }
            if (htipo == "4")
            {
                sql = "select * from vmousep;";
            }
            if (htipo == "5")
            {
                sql = "select * from vimpresorasp;";
            }
            if (htipo == "6")
            {
                sql = "select * from vreguladoresp;";
            }
        }
        else
        {
            if (htipo == "2")
            {
                sql = "select * from vmonitoresp where hdepartamento=" + departamento + ";";
            }
            if (htipo == "3")
            {
                sql = "select * from vtecladosp where hdepartamento=" + departamento + ";";
            }
            if (htipo == "4")
            {
                sql = "select * from vmousep where hdepartamento=" + departamento + ";";
            }
            if (htipo == "5")
            {
                sql = "select * from vimpresorasp where hdepartamento=" + departamento + ";";
            }
            if (htipo == "6")
            {
                sql = "select * from vreguladoresp where hdepartamento=" + departamento + ";";
            }
        }
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

    public DataTable RPTAllequipos(string tipo, string fecha1, string fecha2)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from rptallequipos(" +
        tipo + ",'" +
        fecha1 + " 00:00:00','" +
        fecha2 + " 23:59:00');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        if (temporal.Rows.Count == 0)
        {
            DataRow dr = temporal.NewRow();
            dr["nequipo"] = "NULL";
            dr["count"] = "0";
            temporal.Rows.Add(dr);
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable RPTequipos(string equipo, string tipo, string estatus, string fecha1, string fecha2)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from rptequipos('" + equipo + "'," +
        tipo + "," +
        estatus + ",'" +
        fecha1 + " 00:00:00','" +
        fecha2 + " 23:59:00');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        if (temporal.Rows.Count == 0)
        {
            DataRow dr = temporal.NewRow();
            dr["nequipo"] = "NULL";
            dr["count"] = "0";
            temporal.Rows.Add(dr);
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable RPTDeppendiente(string departamento, string fecha1, string fecha2)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from deppendiente('" +
        departamento + "','" +
        fecha1 + " 00:00:00','" +
        fecha2 + " 23:59:00');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        if (temporal.Rows.Count == 0)
        {
            DataRow dr = temporal.NewRow();
            dr["departamento"] = "NULL";
            dr["sa"] = "0";
            dr["ss"] = "0";
            dr["so"] = "0";
            dr["app"] = "0";
            dr["win"] = "0";
            dr["off"] = "0";
            dr["otr"] = "0";
            dr["cpu"] = "0";
            dr["impresora"] = "0";
            dr["monitor"] = "0";
            dr["teclado"] = "0";
            dr["mouse"] = "0";
            dr["regulador"] = "0";
            dr["conexionr"] = "0";
            dr["conexioni"] = "0";
            dr["total"] = "0";
            temporal.Rows.Add(dr);
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable RPTDepenrevision(string departamento, string fecha1, string fecha2)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from depenrevision('" +
        departamento + "','" +
        fecha1 + " 00:00:00','" +
        fecha2 + " 23:59:00');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        if (temporal.Rows.Count == 0)
        {
            DataRow dr = temporal.NewRow();
            dr["departamento"] = "NULL";
            dr["sa"] = "0";
            dr["ss"] = "0";
            dr["so"] = "0";
            dr["app"] = "0";
            dr["win"] = "0";
            dr["off"] = "0";
            dr["otr"] = "0";
            dr["cpu"] = "0";
            dr["impresora"] = "0";
            dr["monitor"] = "0";
            dr["teclado"] = "0";
            dr["mouse"] = "0";
            dr["regulador"] = "0";
            dr["conexionr"] = "0";
            dr["conexioni"] = "0";
            dr["total"] = "0";
            temporal.Rows.Add(dr);
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public DataTable RPTDepculminado(string departamento, string fecha1, string fecha2)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from depculminado('" +
        departamento + "','" +
        fecha1 + " 00:00:00','" +
        fecha2 + " 23:59:00');";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        if (temporal.Rows.Count == 0)
        {
            DataRow dr = temporal.NewRow();
            dr["departamento"] = "NULL";
            dr["sa"] = "0";
            dr["ss"] = "0";
            dr["so"] = "0";
            dr["app"] = "0";
            dr["win"] = "0";
            dr["off"] = "0";
            dr["otr"] = "0";
            dr["cpu"] = "0";
            dr["impresora"] = "0";
            dr["monitor"] = "0";
            dr["teclado"] = "0";
            dr["mouse"] = "0";
            dr["regulador"] = "0";
            dr["conexionr"] = "0";
            dr["conexioni"] = "0";
            dr["total"] = "0";
            temporal.Rows.Add(dr);
        }
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;
    }
    public string UPDTDocSop (string idsol,string hsoporte)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "update documento set hsoporte=" + hsoporte + " where id=" + idsol + ";";
        dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        CloseConnection();
        return sql;
    }
    public string Snimpresoras(string id)
    {
        /*OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();*/
        string sql = "select * from impresoras where id=" + id + ";";
        /*dbcmd.CommandText = sql;
        System.Data.IDataReader reader = dbcmd.ExecuteReader();
        DataTable temporal = new DataTable();
        temporal.Load(reader);
        CloseConnection();
        reader.Close();
        reader = null;
        dbcmd.Dispose();
        dbcmd = null;
        return temporal;*/
        return sql;
    }
    public DataTable Simpresoras(string id)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "select * from impresoras where id=" + id + ";";
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
    public DataTable SCountDisp(string htipo, string capacidad, string modelo)
    {
        OpenConnection();
        System.Data.IDbCommand dbcmd = connection.CreateCommand();
        string sql = "";
        if (htipo == "7")
        {
            if (capacidad == "TODOS")
            {
                sql = "select * from vconteodedd;";
            }
            else
            {
                sql = "select * from vconteodedd where capacidad='" + capacidad + "';";
            }
        }
        if (htipo == "8")
        {
            sql = "select * from rptcntdispositivos("+ htipo + ",'%" + modelo + "%');";
        }
        if (htipo == "9")
        {
            if (capacidad == "TODOS")
            {
                sql = "select * from vconteoderam;";
            }
            else
            {
                sql = "select * from vconteoderam where capacidad='" + capacidad + "';";
            }
        }
        if (htipo == "10")
        {
            sql = "select * from rptcntdispositivos(" + htipo + ",'%" + modelo + "%');";
        }
        if (htipo == "11")
        {
            sql = "select * from rptcntdispositivos(" + htipo + ",'%" + modelo + "%');";
        }
        if (htipo == "12")
        {
            sql = "select * from rptcntdispositivos(" + htipo + ",'%" + modelo + "%');";
        }
        if (htipo == "14")
        {
            sql = "select * from rptcntdispositivos(" + htipo + ",'%" + modelo + "%');";
        }
        if (htipo == "16")
        {
            sql = "select * from rptcntdispositivos(" + htipo + ",'%" + modelo + "%');";
        }
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
}
