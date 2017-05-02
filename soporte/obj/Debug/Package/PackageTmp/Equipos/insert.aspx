<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insert.aspx.cs" Inherits="soporte.Equipos.insert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ficha para el control de equipos de computaci&oacute;n </title>
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/equipos.js"></script>
</head>
<body class="bodyformulario">
    <div>
    <form  id="form1" runat="server">
      <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td  class="tdformulario" align="center">
            <p>Se ha insertado el registro correctamente !!!</p>
            <img src="../Imagenes/ok.gif" alt="ok" />
          </td>
        </tr>
      </table>
      <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td  class="tdformulario" align="center">
              <asp:Button ID="Button1" class="buttons2"  runat="server" OnClick="Finalizar" Text="Finalizar" />
          </td>
        </tr>
      </table>
      </form>
      </div>
</body>
</html>
