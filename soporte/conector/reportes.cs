public abstract class MisReportes
    {
        private static string isolicitud = "<script language='JavaScript'>document.getElementById('";
        private static string nsolicitud = "').value  = showModalDialog('../Reportes/solicitudpdf.aspx?id=";
        private static string asolicitud = "'dialogTop=300px; dialogLeft=150px; dialogWidth=500px; " +
            "dialogHeight=300px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string irespuesta = "<script language='JavaScript'>document.getElementById('";
        private static string nrespuesta = "').value  = showModalDialog('../Reportes/respuestapdf.aspx?id=";
        private static string arespuesta = "'dialogTop=300px; dialogLeft=150px; dialogWidth=500px; " +
            "dialogHeight=300px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        public static void verSolicitud(System.Web.UI.Page pagina, string control, string _default)
        {
            string wFecha = isolicitud + control + nsolicitud + _default + "','" + _default + "', " + asolicitud + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verRespuesta(System.Web.UI.Page pagina, string control, string _default)
        {
            string wFecha = irespuesta + control + nrespuesta + _default + "','" + _default + "', " + arespuesta + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
}
