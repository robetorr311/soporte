<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reasignar.aspx.cs" Inherits="soporte.Respuesta.Reasignar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
    <base target="_self" />   
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
      <td class="tdformulario">
            Seleccione Soporte T&eacute;cnico:
      </td>
      <td class="tdformulario">
            <asp:DropDownList ID="soporte" runat="server">
            </asp:DropDownList>
      </td>
      <td class="tdformulario">
            <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Respuesta: Soporte');"/>
      </td>
      </tr>
  </table>    
    <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
      <tr>
      <td  class="tdbotones" align="center">
        <span onmouseover="muestraAyuda(event, 'Consultas: Cerrar');"><asp:Button ID="Button2"  class="buttons2" OnClick="Asignar" runat="server" Text="Asignar" /></span>
        <span onmouseover="muestraAyuda(event, 'Consultas: Cerrar');"><asp:Button ID="Button1"  class="buttons2" OnClientClick="window.parent.hidePopWin();" OnClick="Cerrar" runat="server" Text="Cerrar" /></span>
     </td>
      </tr>
    </table>
    <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
           <td class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
    </table>
        </div>
      <input type="hidden" ID="idsol" runat="server" />   
      <input type="hidden" id="vhmenu" runat="server" />
      <input type="hidden" id="vhsoporte" runat="server" />
    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
