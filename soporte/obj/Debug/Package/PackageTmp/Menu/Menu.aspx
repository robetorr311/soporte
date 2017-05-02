<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="soporte.Menu.Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sistema de Gestión de Solicitudes de Servicio de Soporte Técnico</title>
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
</head>
<body class="bodymenu">
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" ImageUrl="../Imagenes/bannertitulo.gif" runat="server" />
        <p align="center"><asp:Label ID="Label1" runat="server" Text="Loggin:"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        <asp:Label ID="Label5" runat="server" Text="Inicio de Sesion a las:"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text=""></asp:Label>       
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
            <asp:ImageButton ID="ImageButton1" ImageUrl="../Imagenes/session.gif" OnClick="Finalizar" runat="server" />                
        </p>
        <asp:Menu ID="Menu1" CssClass="menu" DynamicMenuItemStyle-CssClass="menu" StaticMenuItemStyle-CssClass="menu" Orientation="Horizontal" runat="server">
        </asp:Menu>
        <iframe width="950" height="490" id="principal" name="principal" frameborder="0"></iframe>    
        <asp:Image ID="Image2" ImageUrl="../Imagenes/bannerbottom.gif" runat="server" />
    </div>
    </form>
</body>
</html>
