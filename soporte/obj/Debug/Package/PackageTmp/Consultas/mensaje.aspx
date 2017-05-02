<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mensaje.aspx.cs" Inherits="soporte.Consultas.mensaje" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Mensaje</title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/sequipos.js"></script>
    <base target="_self" />    
</head>
<body class="bodyformulario" onload="cargar();" onunload="retornaValor();">
    <form id="form1" runat="server">
    <div>
       <table class="tableformulario" width="300" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="300" height="10" /></td>
            </tr>
       </table>
       <table class="tableformulario" width="300" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td  class="tdformulario" align="center">
                  <asp:Image ID="Image1" ImageUrl="../Imagenes/Alerta24x24.gif" AlternateText="" runat="server" /><br />
                  <asp:Label ID="Label1" CssClass="alerta" runat="server" Text=""></asp:Label><br />
                  <asp:Button ID="Button1" runat="server" OnClick="cerrar" CssClass="buttons2" Text="Cerrar" />
              </td>
           </tr>
      </table>
      <table class="tableformulario" width="300" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="300" height="10" /></td>
        </tr>
      </table>
        <input type="hidden" ID="TextBox1" runat="server">
   
    </div>
    </form>
</body>

</html>
