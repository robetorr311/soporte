﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReporte3.aspx.cs" Inherits="soporte.Reportes.frmReporte3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Reporte Actividades de Soporte T&eacute;cnico Realizadas</title>
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
</head>
<body  class="bodyformulario" onload="cargar();">
    <form id="form1" runat="server">
    <div>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
    <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form"><asp:Image ID="Image1" ImageUrl="../Imagenes/frmreporte3.gif" runat="server" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">Seleccione el Tipo de Equipo: </td>
        <td  class="tdformulario" width="218">
            <asp:DropDownList ID="tipo" CssClass="select" runat="server">
            </asp:DropDownList>
        </td>
        <td  class="tdformulario" width="2">
        </td>
      <td  class="tdformulario">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Reportes: Tipo');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">Desde: </td>
      <td  class="tdformulario">
          <asp:TextBox ID="fechainicio" CssClass="fecha" runat="server"></asp:TextBox>
          <asp:ImageButton ID="ImageButton1" OnClick="inicio" ImageUrl="../Imagenes/calendario.gif" runat="server" />
      </td>
      <td  class="tdformulario">
      </td>
      <td  class="tdformulario">
        <img src="../Imagenes/helpbntdobs.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Reportes: Fecha Inicial');"/>
      </td>
      <td  class="tdformulario">
      Hasta: 
      </td>
      <td  class="tdformulario">
          <asp:TextBox ID="fechafinal" CssClass="fecha" runat="server"></asp:TextBox>
          <asp:ImageButton ID="ImageButton3" OnClick="final" ImageUrl="../Imagenes/calendario.gif" runat="server" />  
      </td>
      <td  class="tdformulario">
      </td>
      <td  class="tdformulario">
        <img src="../Imagenes/helpbntdobs.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Reportes: Fecha Final');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdbotones" align="center">
           <asp:ImageButton ID="ImageButton2" ImageUrl="../Imagenes/AdobeReader.gif" OnClick="PDF" OnClientClick="window.document.forms[0].target='rptpdf';" runat="server" />
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
          </div>
          <asp:RegularExpressionValidator 
          ControlToValidate="fechainicio" 
          ValidationExpression="\d{2}\/\d{2}\/20\d{2}"
          ID="RegularExpressionValidator1" 
          runat="server" 
          ErrorMessage="Formato de fecha incorrecto!!">
          </asp:RegularExpressionValidator>
          <asp:RegularExpressionValidator 
          ControlToValidate="fechafinal" 
          ValidationExpression="\d{2}\/\d{2}\/20\d{2}"
          ID="RegularExpressionValidator2" 
          runat="server" 
          ErrorMessage="Formato de fecha incorrecto!!">
          </asp:RegularExpressionValidator>        
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label>            
  <input type="hidden" id="vhmenu" runat="server" />
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
  </form>
  <asp:Label Text="" ID="label" runat="server"></asp:Label> 
<iframe class="bodyformulario" name="rptpdf" id="rptpdf"  width="500" height="330" frameborder="0"></iframe>
</body>
</html>
