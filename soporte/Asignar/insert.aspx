<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insert.aspx.cs" Inherits="soporte.Asignar.insert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Página sin título</title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <table width="500" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
            <p><asp:Label ID="labelmens" runat="server"></asp:Label></p>
            <img src="../Imagenes/ok.gif" alt="ok" />
          </td>
        </tr>
      </table>
      <table width="500" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
              <asp:Button ID="Button1" class="buttons2"  runat="server" OnClick="Finalizar" Text="Finalizar" />
          </td>
        </tr>
      </table>
        <input type="hidden" id="vhmenu" runat="server" />

      </div>
      </form>
</body>
</html>
