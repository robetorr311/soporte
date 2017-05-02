<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnRevision.aspx.cs" Inherits="soporte.Consultas.EnRevision" %>

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
       <table class="tableformulario" width="400" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="400" height="10" /></td>
            </tr>
       </table>
       <table class="tableformulario" width="400" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td  class="tdformulario" align="center"><img src="../Imagenes/Alerta24x24.gif" alt=""  width="24" height="24" /></td>
            </tr>
       </table>
       <table class="tableformulario" width="400" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td  class="tdformulario">
                  <asp:Label ID="Label1" CssClass="alerta" runat="server" Text="Falla Detectada:"></asp:Label>
              </td>
              <td  class="tdformulario">
                  <asp:Label ID="Label3" CssClass="alerta" runat="server" Text=""></asp:Label>
              </td>
            </tr>
             <tr>
              <td  class="tdformulario">
                  <asp:Label ID="Label2" CssClass="alerta" runat="server" Text="Observaciones:"></asp:Label>
              </td>
              <td  class="tdformulario">
                  <asp:Label ID="Label4" CssClass="alerta" runat="server" Text=""></asp:Label>
              </td>
            </tr>
              <tr>
              <td  class="tdformulario" align="center" colspan="2">
                  <asp:Button ID="Button1" runat="server" OnClick="cerrar" CssClass="buttons2" Text="Cerrar" />
              </td>
            </tr>
      </table>
      <table class="tableformulario" width="400" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="400" height="10" /></td>
        </tr>
      </table>
        <input type="hidden" ID="TextBox1" runat="server">
    </div>
    </form>
</body>

</html>
