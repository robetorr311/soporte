﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insert.aspx.cs" Inherits="soporte.Respuesta.insert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Registro Guardado</title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
</head>
<body class="bodyformulario" >
    <form id="form1" runat="server">
    <div>
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
            <input ID="id" type="hidden" name="id" runat="server" />
          <asp:ImageButton ID="ImageButton2" ImageUrl="../Imagenes/AdobeReader.gif" OnClientClick="window.document.forms[0].target='rptpdf';" OnClick="PDF" runat="server" />
          </td>
        </tr>
      </table>
       <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td  class="tdformulario" align="center">
              <asp:Button ID="Button1" class="buttons2"  runat="server" OnClientClick="window.document.forms[0].target='_self';" OnClick="Finalizar" Text="Finalizar" />
          </td>
        </tr>
      </table>       
      </div>
      </form>
    <iframe name="rptpdf" id="rptpdf"  width="500" height="330" frameborder="0"></iframe>
</body>
</html>