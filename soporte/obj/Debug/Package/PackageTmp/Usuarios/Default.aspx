<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="soporte.Usuarios.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Formulario Para el Mantenimiento de Usuarios del Sistema </title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/usuarios.js"></script>
</head>
<body class="bodyformulario" onload="cargar();">
    <form id="form1" runat="server">
    <div>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form"><asp:Image ID="Image1" ImageUrl="../Imagenes/Forward.gif" runat="server" />Formulario Para el Mantenimiento de Usuarios del Sistema </td>
    </tr>
  </table>
  <table  class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="138"> Login de Usuario: </td>
      <td  class="tdformulario" width="322">
          <asp:TextBox ID="TextBox1" MaxLength="8" CssClass="loggin" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="10">        
      <asp:RequiredFieldValidator id="RFVdepartamento"
            ControlToValidate="TextBox1"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Login');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="138">Password: </td>
      <td  class="tdformulario" width="322">
          <asp:TextBox ID="TextBox2" MaxLength="8" TextMode="Password" CssClass="password" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="10">      
      <asp:RequiredFieldValidator id="RequiredFieldValidator1"
            ControlToValidate="TextBox2"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Password');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdformulario" width="138">Nombre Completo: </td>
      <td class="tdformulario" width="322">
          <asp:TextBox ID="TextBox3" CssClass="nombre" runat="server"></asp:TextBox></td>
      <td class="tdformulario" width="10">      
      <asp:RequiredFieldValidator id="RequiredFieldValidator2"
            ControlToValidate="TextBox3"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Nombre');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdformulario" width="138">Nivel de Usuario: </td>
      <td class="tdformulario" width="322">
          <asp:DropDownList ID="DropDownList1" CssClass="nombre" runat="server">
          </asp:DropDownList>
      </td>
      <td class="tdformulario" width="10">      
      <asp:RequiredFieldValidator id="RequiredFieldValidator3"
            ControlToValidate="DropDownList1"
            Display="Static"
            InitialValue="0" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Tipo');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdformulario" align="center">
          <span onmouseover="this.style.cursor='pointer';muestraAyuda(event, 'Guardar');">
          <asp:Button ID="Button1" OnClick="Guardar" CssClass="buttons2" runat="server"  Text="Guardar" />
          </span>

      </td>
    </tr>
  </table>
   <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
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
