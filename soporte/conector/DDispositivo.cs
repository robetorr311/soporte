public abstract class DDisp
{
    private static string inicio = "<script language='JavaScript'>var idsoporte;";
    private static string id = "id  = showModalDialog('Desincorpora.aspx?id=";
    private static string htipo = "&htipo=";
    private static string hequipo = "&hequipo=";
    private static string formulario = "&formulario=";
    private static string atributos = "'dialogTop:400px; dialogLeft=100px; dialogWidth:550px; " +
        "dialogHeight:350px; center:yes; help:no; status:no; toolbar:no; menubar:no; resizable:no; border:thin; dialogHide:yes; unadorned:yes');";
    public static void VerEquipos(System.Web.UI.Page pagina, string videquipo, string vhtipo, string vhequipo, string vformulario)
    {
        string wFecha = inicio + id + videquipo + htipo + vhtipo + hequipo + vhequipo + formulario +vformulario +"','', " + atributos + "</script>";
        pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
    }
}