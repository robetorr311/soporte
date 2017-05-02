<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="soporte.Departamentos.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ficha Ingreso de Departamentos</title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/departamentos.js"></script>
</head>
<body  class="bodyformulario" onload="cargar();">
<form id="form1" runat="server">
<div>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form"><asp:Image ID="Image1" ImageUrl="../Imagenes/Forward.gif" runat="server" />Ficha Insert de Establecimientos </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="160">C&oacute;digo de Departamento: </td>
      <td  class="tdformulario" width="306">
          <asp:TextBox ID="codigo" runat="server" CssClass="codigo" MaxLength="20"></asp:TextBox>
      </td>
      <td  class="tdformulario" width="2">
            <asp:RequiredFieldValidator id="RequiredFieldValidator1"
                ControlToValidate="codigo"
                Display="Static"
                InitialValue="" Width="100%" runat="server">
                *
            </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Codigo');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="160">Nombre del Departamento: </td>
      <td  class="tdformulario" width="306">
          <asp:TextBox ID="nombre" CssClass="nombre" MaxLength="150" runat="server"></asp:TextBox>
      </td>
      <td  class="tdformulario" width="2">
            <asp:RequiredFieldValidator id="RequiredFieldValidator2"
                ControlToValidate="nombre"
                Display="Static"
                InitialValue="" Width="100%" runat="server">
                *
            </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Nombre');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="160">Responsable del Departamento: </td>
      <td  class="tdformulario" width="306">
          <asp:TextBox ID="responsable" CssClass="responsable" MaxLength="150" runat="server"></asp:TextBox>
      </td>
      <td  class="tdformulario" width="2">
            <asp:RequiredFieldValidator id="RequiredFieldValidator3"
                ControlToValidate="responsable"
                Display="Static"
                InitialValue="" Width="100%" runat="server">
                *
            </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Responsable');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="160">Tel&eacute;fono del Departamento: </td>
      <td  class="tdformulario" width="306">
          <asp:TextBox ID="telefono" CssClass="telefono" MaxLength="20" runat="server"></asp:TextBox>
      </td>
      <td  class="tdformulario" width="2">
            <asp:RequiredFieldValidator id="RequiredFieldValidator4"
                ControlToValidate="telefono"
                Display="Static"
                InitialValue="" Width="100%" runat="server">
                *
            </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Telefono');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" colspan="3">Descripcion del Departamento </td>
    </tr>
    <tr>
      <td  class="tdobservaciones" width="472">
          <asp:TextBox ID="descripcion" CssClass="descripcion"  MaxLength="250" TextMode="MultiLine" runat="server"></asp:TextBox>
      </td>
      <td  class="tdobservaciones" width="2">
            <asp:RequiredFieldValidator id="RequiredFieldValidator5"
                ControlToValidate="descripcion"
                Display="Static"
                InitialValue="" Width="100%" runat="server">
                *
            </asp:RequiredFieldValidator>
      </td>
      <td  class="tdobservaciones" width="20">
        <img src="../Imagenes/helpbntdobs.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Descripcion');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" align="center">
          <asp:Button ID="Button1" Text="Guardar" CssClass="buttons2" OnClick="Guardar" runat="server" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
</div>
</form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
