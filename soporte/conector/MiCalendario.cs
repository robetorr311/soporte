public abstract class MiCalendario
{
    private static string inicio = "<script language='JavaScript'>document.getElementById('";
    private static string nombre = "').value  = showModalDialog('calendario.aspx'";
    private static string atributos = "'dialogTop=100px; dialogLeft=250px; dialogWidth=206px; " +
        "dialogHeight=205px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
    private static string ihtipo = "<script language='JavaScript'>document.getElementById('";
    private static string nhtipo = "').value  = showModalDialog('htipo.aspx?nequipo=";
    private static string ahtipo = "'dialogTop=100px; dialogLeft=250px; dialogWidth=206px; " +
        "dialogHeight=205px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";

    public static void verCalendario(System.Web.UI.Page pagina, string control)
    {
        string wFecha = inicio + control + nombre + ",'', " + atributos + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }
    public static void verCalendario(System.Web.UI.Page pagina, string control, string _default)
    {
        string wFecha = inicio + control + nombre + ", '" + _default + "', " + atributos + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }
    public static void verHtipo(System.Web.UI.Page pagina, string control, string _default)
    {
        string wFecha = ihtipo + control + nhtipo + _default +  "','" + _default + "', " + ahtipo + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }
}