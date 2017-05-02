public abstract class Modal
{
        private static string idiscoduro = "<script language='JavaScript'>document.getElementById('";
        private static string ndiscoduro = "').value  = showModalDialog('discoduro.aspx?idequipo=";
        private static string adiscoduro = ",'dialogTop=100px; dialogLeft=250px; dialogWidth=600px; " +
            "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string iram = "<script language='JavaScript'>document.getElementById('";
        private static string nram = "').value  = showModalDialog('ram.aspx?idequipo=";
        private static string aram = ",'dialogTop=100px; dialogLeft=250px; dialogWidth=600px; " +
            "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string iprocesador = "<script language='JavaScript'>document.getElementById('";
        private static string nprocesador = "').value  = showModalDialog('procesador.aspx?idequipo=";
        private static string aprocesador = ",'dialogTop=100px; dialogLeft=250px; dialogWidth=600px; " +
            "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string imotherboard = "<script language='JavaScript'>document.getElementById('";
        private static string nmotherboard = "').value  = showModalDialog('motherboard.aspx?idequipo=";
        private static string amotherboard = ",'dialogTop=100px; dialogLeft=250px; dialogWidth=600px; " +
            "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string ilan = "<script language='JavaScript'>document.getElementById('";
        private static string nlan = "').value  = showModalDialog('lan.aspx?idequipo=";
        private static string alan = ",'dialogTop=100px; dialogLeft=250px; dialogWidth=600px; " +
            "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string ivideo = "<script language='JavaScript'>document.getElementById('";
        private static string nvideo = "').value  = showModalDialog('video.aspx?idequipo=";
        private static string avideo = ",'dialogTop=100px; dialogLeft=250px; dialogWidth=600px; " +
            "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string isonido = "<script language='JavaScript'>document.getElementById('";
        private static string nsonido = "').value  = showModalDialog('sonido.aspx?idequipo=";
        private static string asonido = ",'dialogTop=100px; dialogLeft=250px; dialogWidth=600px; " +
            "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string icdrom = "<script language='JavaScript'>document.getElementById('";
        private static string ncdrom = "').value  = showModalDialog('cdrom.aspx?idequipo=";
        private static string acdrom = ",'dialogTop=100px; dialogLeft=250px; dialogWidth=600px; " +
            "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string inicio = "<script language='JavaScript'>document.getElementById('";
        private static string nombre = "').value  = showModalDialog('sequipos.aspx?departamento=";
        private static string atributos = "'dialogTop=100px; dialogLeft=250px; dialogWidth=350px; " +
            "dialogHeight=250px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";
        private static string ihtipo = "<script language='JavaScript'>document.getElementById('";
        private static string nhtipo = "').value  = showModalDialog('htipo.aspx?nequipo=";
        private static string ahtipo = ",'dialogTop=100px; dialogLeft=250px; dialogWidth=600px; " +
            "dialogHeight=305px; center=yes; help=no; status=no; menubar=no; resizable=no; border=thin')";

        public static void verDiscoduro(System.Web.UI.Page pagina, string control, string idequipo)
        {
            string wFecha = idiscoduro + control + ndiscoduro + idequipo + "'," + idequipo + adiscoduro + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verRam(System.Web.UI.Page pagina, string control, string idequipo)
        {
            string wFecha = iram + control + nram + idequipo + "'," + idequipo + aram + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verProcesador(System.Web.UI.Page pagina, string control, string idequipo)
        {
            string wFecha = iprocesador + control + nprocesador + idequipo + "'," + idequipo + aprocesador + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verMotherBoard(System.Web.UI.Page pagina, string control, string idequipo)
        {
            string wFecha = imotherboard + control + nmotherboard + idequipo + "'," + idequipo + amotherboard + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verLAN(System.Web.UI.Page pagina, string control, string idequipo)
        {
            string wFecha = ilan + control + nlan + idequipo + "'," + idequipo + alan + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verVideo(System.Web.UI.Page pagina, string control, string idequipo)
        {
            string wFecha = ivideo + control + nvideo + idequipo + "'," + idequipo + avideo + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verSonido(System.Web.UI.Page pagina, string control, string idequipo)
        {
            string wFecha = isonido + control + nsonido + idequipo + "'," + idequipo + asonido + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verCdRom(System.Web.UI.Page pagina, string control, string idequipo)
        {
            string wFecha = icdrom + control + ncdrom + idequipo + "'," + idequipo + acdrom + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verEquipos(System.Web.UI.Page pagina, string control, string departamento)
        {
            string wFecha = inicio + control + nombre + departamento + "'" + ",'" + departamento + "', " + atributos + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
        public static void verhtipo(System.Web.UI.Page pagina, string control, string nequipo)
        {
            string wFecha = ihtipo + control + nhtipo + nequipo + "'," + nequipo + ahtipo + "</script>";
            pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "ventana", wFecha);
        }
}
