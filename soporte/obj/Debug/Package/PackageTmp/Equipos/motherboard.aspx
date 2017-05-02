<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="motherboard.aspx.cs" Inherits="soporte.Equipos.motherboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Caracteristicas de la Tarjeta Madre</title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/motherboard.js"></script>
    <base target="_self" />    
</head>
<body class="bodyformulario" onload="cargar();" onunload="retornaMB();">
    <form id="form1" runat="server">
    <div>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="topbottom"><img src="../Imagenes/top.gif" alt="" width="500" height="10" /></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="33">Serial:</td>
    <td  class="tdformulario" width="218"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="6">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""  width="20" height="20"  onmouseover="muestraAyuda(event, 'Serial');"/></td>
  </tr>
  <tr>
    <td  class="tdformulario" width="33">Marca:</td>
    <td  class="tdformulario" width="141">
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="11">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""  width="20" height="20"  onmouseover="muestraAyuda(event, 'Marca');"/></td>
  </tr>
  <tr>
    <td  class="tdformulario" width="40">Modelo:</td>
    <td  class="tdformulario" width="151">
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="68">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""  width="20" height="20"  onmouseover="muestraAyuda(event, 'Modelo');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" align="center">
    <span id="guardar">
    <asp:Button ID="Button1" OnClick="Guardar" CssClass="buttons2" Text="Guardar" runat="server" />
    <asp:Button ID="Button2" OnClick="Actualizar" CssClass="buttons2" Text="Actualizar" runat="server" />
    </span>
    </td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="topbottom">
        <img src="../Imagenes/bottom.gif" width="500" height="10" alt=""  /></td>
  </tr>
</table> 
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <input type="hidden" ID="HiddenField1" runat="server" />
    <input type="hidden" id="idequipo" runat="server" />
    <input type="hidden" id="HiddenField2" runat="server" />
    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
