<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="soporte.Soporte.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Formulario para Ingresar Personal de Soporte  </title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
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
      <td class="titulo_form"><asp:Image ID="Image1" ImageUrl="../Imagenes/titulotecnicos.gif" runat="server" /></td>
    </tr>
  </table>
  <table  class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="138"> Nombre del Tecnico: </td>
      <td  class="tdformulario" width="322">
          <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="10">        
      <asp:RequiredFieldValidator id="RFVdepartamento"
            ControlToValidate="TextBox1"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Soporte: Nombre');"/>
      </td>
    </tr>
  </table>
    <table  class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="138"> Loggin de usuario: </td>
      <td  class="tdformulario" width="322">
            <asp:DropDownList ID="usuario" CssClass="select" runat="server">
            </asp:DropDownList>
        </td>
      <td  class="tdformulario" width="10">        
      <asp:RequiredFieldValidator id="RequiredFieldValidator1"
            ControlToValidate="usuario"
            Display="Static"
            InitialValue="0" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Soporte: Login');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdbotones" align="center">
          <span onmouseover="this.style.cursor='pointer';muestraAyuda(event, 'Soporte: Guardar');">
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
    <input type="hidden" id="vhmenu" runat="server" />
    </form>
</body>
</html>
