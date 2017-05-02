<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cambio.aspx.cs" Inherits="soporte.Consultas.Cambio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Modificaciones: Tabla Equipos (CPU)</title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
   	<link rel="stylesheet" type="text/css" href="../estilos/style.css" />
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
    <script type="text/javascript" src="../JS/Cambio.js"></script>
</head>
<body onload="cargar()" class="bodyformulario" onunload="retorna()" >
    <form id="form1" target="_self" runat="server">
    <div>
  <table class="tableformulario" width="400" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tituloform"><img src="../Imagenes/frmEditaEquipo.gif" width="500" alt=""/></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="98">Equipo Destino:</td>
    <td  class="tdformulario" width="380">
        <asp:DropDownList ID="equipo" runat="server">
        </asp:DropDownList>
    </td>
    <td  class="tdformulario" width="2">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""    onmouseover="muestraAyuda(event, 'CdRom: Serial');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="98">Motivo del Cambio:</td>
    <td  class="tdformulario" width="380"><asp:TextBox ID="TextBox2" TextMode="MultiLine" CssClass="observaciones" runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="2">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""    onmouseover="muestraAyuda(event, 'CdRom: Serial');"/></td>
  </tr>
</table>
  <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="880" height="10" /></td>
    </tr>
  </table>
    <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="880" height="10" /></td>
    </tr>
  </table>
    <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdbotones">
        <span onmouseover="muestraAyuda(event, 'Consultas: Cambios');"><asp:Button ID="Button1" OnClick="Cambios" CssClass="buttons2" Text="Cambio" runat="server" /></span>
        <span onmouseover="muestraAyuda(event, 'Consultas: Cerrar');"><asp:Button ID="Button2"  class="buttons2" OnClick="Cerrar" runat="server" Text="Cerrar" /></span>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="880" height="10" /></td>
    </tr>
  </table>
  <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
<input type="hidden" id="txtid"  runat="server"/>
<input type="hidden" id="txttipo"  runat="server"/>
<input type="hidden" id="vhequipo" runat="server" />
</div>
</form>
</body>
</html>
