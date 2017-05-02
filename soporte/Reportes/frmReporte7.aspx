<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReporte7.aspx.cs" Inherits="soporte.Reportes.frmReporte7" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Listado detallado de equipos de computacion</title>
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
</head>
<body  class="bodyformulario" onload="cargar();">
    <form id="form1" runat="server">
    <div>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
    <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form"><asp:Image ID="Image1" ImageUrl="../Imagenes/frmreporte7.png" runat="server" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr onmouseover="self()" >
      <td  class="tdformulario">Seleccione el tipo de dispositivo: </td>
      <td  class="tdformulario">
      <asp:DropDownList ID="htipo" OnClientClick="window.document.forms[0].target='_self';"  OnSelectedIndexChanged="htdispositivo" AutoPostBack="true" runat="server">
          <asp:ListItem Text="Seleccione" Value="0"></asp:ListItem>
          <asp:ListItem Text="Disco Duro" Value="7"></asp:ListItem>
          <asp:ListItem Text="Video" Value="8"></asp:ListItem>
          <asp:ListItem Text="RAM" Value="9"></asp:ListItem>
          <asp:ListItem Text="Procesador" Value="10"></asp:ListItem>
          <asp:ListItem Text="Motherboard" Value="11"></asp:ListItem>
          <asp:ListItem Text="Sonido" Value="12"></asp:ListItem>
          <asp:ListItem Text="Red (LAN)" Value="14"></asp:ListItem>
          <asp:ListItem Text="CdRom" Value="16"></asp:ListItem>
      </asp:DropDownList>
      </td>
      <td  class="tdformulario">
          <asp:DropDownList ID="DDcapacidad" runat="server">
          <asp:ListItem Text="Seleccione" Value="0"></asp:ListItem>
          </asp:DropDownList>
          <asp:TextBox ID="modelo" runat="server"></asp:TextBox>
      </td>
      <td  class="tdformulario">
        <img src="../Imagenes/helpbntdobs.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Reportes: Fecha Inicial');"/>
      </td>
      </tr>
  </table>
          <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
            <tr>
            <td  class="tdbotones" align="center">
                  <asp:ImageButton ID="ImageButton2" ImageUrl="../Imagenes/AdobeReader.gif" OnClick="PDF" OnClientClick="window.document.forms[0].target='rptpdf';" runat="server" />
            </td>
            </tr>
          </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
          </div>  
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label>            
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
  <input type="hidden" id="vhmenu" runat="server" />

  </form> 
<iframe class="bodyformulario" name="rptpdf" id="rptpdf"  width="500" height="330" frameborder="0"></iframe>
</body>
</html>

