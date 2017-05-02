<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmEditaSoporte.aspx.cs" Inherits="soporte.Consultas.frmEditaSoporte" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Formulario para editar la tabla soportes</title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/VerUsuarios.js"></script>
    <base target="_self" />    
</head>
<body class="bodyformulario" onunload="retornaValor();" >
    <form id="form1" runat="server">
    <div>
       <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
            </tr>
       </table>

    <table  class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="138"> Nombre del Soporte: </td>
      <td  class="tdformulario" width="322">
          <asp:TextBox ID="nombre" CssClass="textbox"  runat="server"></asp:TextBox>
          <asp:Label ID="Lblnombre" runat="server" Text=""></asp:Label>
      </td>
      <td  class="tdformulario" width="10">        
      <asp:RequiredFieldValidator id="RequiredFieldValidator2"
            ControlToValidate="nombre"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Consultas: Login');"/>
      </td>
    </tr>
  </table>

    <table  class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="138"> Loggin de usuario: </td>
      <td  class="tdformulario" width="322">
           <asp:Label ID="Lblusuario" runat="server" Text=""></asp:Label>
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
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Consultas: Login');"/>
      </td>
    </tr>
  </table>
     <table  class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="138"> Estatus: </td>
      <td  class="tdformulario" width="322">
            <asp:DropDownList ID="estatus" CssClass="select" runat="server">
            <asp:ListItem Value="0" Text="Seleccione"></asp:ListItem>
            <asp:ListItem Value="5" Text="Activa"></asp:ListItem>
            <asp:ListItem Value="6" Text="Inactiva"></asp:ListItem>
            </asp:DropDownList>
          <asp:Label ID="Lblestatus" runat="server" Text=""></asp:Label>
      </td>
      <td  class="tdformulario" width="10">        
      <asp:RequiredFieldValidator id="RequiredFieldValidator3"
            ControlToValidate="estatus"
            Display="Static"
            InitialValue="0" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Consultas: Login');"/>
      </td>
    </tr>
  </table>
       <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td  class="tdformulario" align="center" colspan="2">
                  <asp:Button ID="Button2" runat="server" OnClick="editar" CssClass="buttons2" Text="Editar" />
                  <asp:Button ID="Button1" runat="server" OnClick="cerrar" CssClass="buttons2" Text="Cerrar" />
                  <asp:Button ID="Button3" runat="server" OnClick="actualizar" CssClass="buttons2" Text="Guardar" />
                  <asp:Button ID="Button4" runat="server" OnClick="cancelar" CssClass="buttons2" Text="Cancelar" />
              </td>
            </tr>
      </table>
      <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
        </tr>
      </table>
        <input type="hidden" ID="TextBox1" runat="server" />
    </div>
    </form>
</body>
</html>
