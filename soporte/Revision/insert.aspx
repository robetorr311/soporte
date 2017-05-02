<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insert.aspx.cs" Inherits="soporte.Revision.insert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ficha para el control de equipos de computaci&oacute;n </title>
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/equipos.js"></script>
</head>
<body>
    <div>
    <form  id="form1" runat="server">
      <table width="500" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
            <p>Se ha insertado el registro correctamente !!!</p>
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

      </form>
      </div>
</body>
</html>
