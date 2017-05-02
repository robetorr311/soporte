<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="denegado.aspx.cs" Inherits="soporte.denegado" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sistema de Gestión de Solicitudes de Servicio de Soporte Técnico</title>
    <link href="/Estilos/soporte.css" rel="stylesheet" type="text/css" />
</head>
<body class="bodybienvenida">
    <form id="form1" runat="server">
    <div>
    <p><img src="/Imagenes/bannertitulo.gif" width="950" alt="" height="50" /></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p align="center"><img src="/Imagenes/denegado.gif" alt="" width="256" height="356" /> </p>
    <p align="center"><asp:Button ID="Button1" runat="server" CssClass="buttons2" OnClick="Finalizar" Text="Finalizar" /></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p align="center"><img src="/Imagenes/bannerbottom.gif" alt="" width="950" height="20" /></p>    
   </div>
    </form>
</body>
</html>
