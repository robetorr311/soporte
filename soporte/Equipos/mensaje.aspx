<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mensaje.aspx.cs" Inherits="soporte.Equipos.mensaje" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mensaje</title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/mensaje.js"></script>
    <base target="_self" />    
</head>
<body class="bodyformulario" onunload="retorna();">
    <form id="form1" runat="server">
    <div>
    <table class="tableformulario" width="300" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td  class="tdformulario"><div align="center">
          <p>Error!!</p>
          <p>
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
          </p>
          <p><img src="../Imagenes/Alerta24x24.gif" alt="" width="24" height="24" /></p>
          <p>&nbsp;</p>
          <p>
              <asp:Button ID="Button1" runat="server" OnClick="Aceptar" Text="Aceptar" />
          </p>
          </div>
        </td>
      </tr>
    </table>
    </div>
    </form>
</body>
</html>