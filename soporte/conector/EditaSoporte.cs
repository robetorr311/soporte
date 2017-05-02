public abstract class EditaSoporte
{
    private static string inicio = "<script language='JavaScript'>var idsoporte;";
    private static string id = "idsoporte  = showModalDialog('frmEditaSoporte.aspx?id=";
    private static string nombre = "&nombre=";
    private static string husuario = "&husuario=";
    private static string estatus = "&estatus=";
    private static string atributos = "'dialogTop=300px; dialogLeft=150px; dialogWidth=556px; " +
        "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";

    public static void VerSoportes(System.Web.UI.Page pagina, string vhsoporte, string vnombre, string vhusuario, string vestatus)
    {
        string wFecha = inicio + id + vhsoporte + nombre +vnombre + husuario+vhusuario+estatus+vestatus +"','', " + atributos + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }
}