public abstract class MiMensaje
{
    private static string inicio = "<script language='JavaScript'>document.getElementById('";
    private static string nombre = "').value  = showModalDialog('mensaje.aspx?mensaje=";
    private static string atributos = "'dialogTop=300px; dialogLeft=150px; dialogWidth=330px; " +
        "dialogHeight=120px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
    private static string iEnRevision = "<script language='JavaScript'>document.getElementById('";
    private static string nEnRevision = "').value  = showModalDialog('EnRevision.aspx?falla=";
    private static string observaciones = "&observaciones=";
    private static string aEnRevision = "'dialogTop=300px; dialogLeft=150px; dialogWidth=430px; " +
        "dialogHeight=300px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
    public static void verCalendario(System.Web.UI.Page pagina, string control, string _default)
    {
        string wFecha = inicio + control + nombre + _default +"','" + _default + "', " + atributos + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }
    public static void verEnRevision(System.Web.UI.Page pagina, string control, string _default1, string _default2)
    {
        string wFecha = iEnRevision + control + nEnRevision + _default1 + observaciones + _default2 + "','" + _default1 + "', " + aEnRevision + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }
}