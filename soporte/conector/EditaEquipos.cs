public abstract class VerCambio
{
    private static string inicio = "<script language='JavaScript'>var idsoporte;";
    private static string id = "id  = showModalDialog('Cambio.aspx?id=";
    private static string htipo = "&htipo=";
    private static string hequipo = "&hequipo=";
    private static string atributos = "'dialogTop:400px; dialogLeft=100px; dialogWidth:550px; " +
        "dialogHeight:350px; center:yes; help:no; status:no; toolbar:no; menubar:no; resizable:no; border:thin; dialogHide:yes; unadorned:yes');";
    private static string iReasignar = "<script language='JavaScript'>var idsoporte;";
    private static string idReasignar = "id  = showModalDialog('Reasignar.aspx?id=";
    private static string aReasignar = "'dialogTop:400px; dialogLeft=100px; dialogWidth:550px; " +
        "dialogHeight:350px; center:yes; help:no; status:no; toolbar:no; menubar:no; resizable:no; border:thin; dialogHide:yes; unadorned:yes');";
    public static void VerEquipos(System.Web.UI.Page pagina, string videquipo, string vhtipo, string vhequipo)
    {
        string wFecha = inicio + id + videquipo + htipo + vhtipo + hequipo + vhequipo + "','', " + atributos + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }
    public static void VerReasignacion(System.Web.UI.Page pagina, string hsoporte)
    {
        string wFecha = iReasignar + idReasignar + "','', " + aReasignar + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }

}