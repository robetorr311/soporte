﻿<%@ Page Language="C#" AutoEventWireup="true"  ValidateRequest="false" CodeBehind="discoduro.aspx.cs" Inherits="soporte.Equipos.discoduro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Caracteristicas del Disco Duro</title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/soporte.js"></script> 
</head>
<body class="bodyformulario" onload="cargar()">
    <form id="form1" target="_self" runat="server">
    <div>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="topbottom"><img src="../Imagenes/top.gif" alt="" width="500" height="10" /></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td class="tdTITformulario">Caracteristicas del Disco Duro</td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="98">Serial:</td>
    <td  class="tdformulario" width="380"><asp:TextBox ID="TextBox1"  CssClass="textbox" runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="2">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""   onmouseover="muestraAyuda(event, 'Disco Duro: Serial');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="98">Marca:</td>
    <td  class="tdformulario" width="380">
        <asp:TextBox ID="TextBox2" CssClass="textbox"  runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="2">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""   onmouseover="muestraAyuda(event, 'Disco Duro: Marca');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdobservaciones" width="98">Numero:</td>
    <td  class="tdobservaciones" width="380">
        <asp:TextBox ID="TextBox3" CssClass="textbox"  runat="server"></asp:TextBox></td>
    <td  class="tdobservaciones" width="2">&nbsp;</td>
    <td  class="tdobservaciones" width="20"><img src="../Imagenes/helpbntdobs.gif" alt=""   onmouseover="muestraAyuda(event, 'Disco Duro: Numero');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="98">Capacidad:</td>
    <td  class="tdformulario" width="380">
        <asp:DropDownList ID="capacidaddd" runat="server">
        </asp:DropDownList>
    </td>
    <td  class="tdformulario" width="2">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""   onmouseover="muestraAyuda(event, 'Disco Duro: Capacidad');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="98">Tipo de Dispositivo:</td>
    <td  class="tdformulario" width="380">
        <asp:DropDownList ID="htipo" runat="server">
        </asp:DropDownList>    
    </td>
    <td  class="tdformulario" width="2">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""    onmouseover="muestraAyuda(event, 'Disco Duro: Modelo');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdobservaciones" align="center">
    <span onmouseover="muestraAyuda(event, 'Disco Duro: Guardar');">
    <asp:Button ID="Button1" OnClick="Guardar" CssClass="buttons2" Text="Guardar" runat="server" />
    </span>
    <span id="Span1">
    <asp:Button ID="Button2" OnClick="Cerrar" OnClientClick="window.parent.hidePopWin()" CssClass="buttons2" Text="Cerrar" runat="server" />
    </span>    
    </td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="topbottom">
        <img src="../Imagenes/bottom.gif" width="500" height="10" alt=""  /></td>
  </tr>
</table> 
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="topbottom"><img src="../Imagenes/top.gif" alt="" width="500" height="10" /></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario">
    <asp:GridView ID="GridView1" 
    Width="500" 
    CellSpacing="10"
    CellPadding="10" 
    CssClass="GridRowsTABLE"  
    SelectedRowStyle-CssClass="GridRowSelectedTR" 
    AlternatingRowStyle-BackColor="Beige" 
    RowStyle-BackColor="Ivory" 
    AllowPaging = "true" 
    PageSize="6" 
    OnPageIndexChanging = "gridView_PageIndexChanging"
    OnRowDeleting="GridView1_RowDeleting"
    PagerSettings-Mode="NextPreviousFirstLast"
    PagerSettings-LastPageImageUrl="../Imagenes/PageLastOver.gif"
    PagerSettings-FirstPageImageUrl="../Imagenes/PageFirstOver.gif"
    PagerSettings-NextPageImageUrl="../Imagenes/PageNextOver.gif"
    PagerSettings-PreviousPageImageUrl="../Imagenes/PagePrevOver.gif"  
    PagerSettings-Position="Bottom"  
    runat="server">
            <Columns>
            <asp:CommandField ShowSelectButton="true"  HeaderStyle-CssClass="GridHeaderTD" ButtonType="Image" SelectImageUrl="../Imagenes/form_go.gif" />         
            <asp:CommandField ShowDeleteButton="true"  HeaderStyle-CssClass="GridHeaderTD" ButtonType="Image" DeleteImageUrl="../Imagenes/CntMnuDelete.gif" />         
            </Columns>
        </asp:GridView>
    </td>
  </tr>
</table> 
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="topbottom">
        <img src="../Imagenes/bottom.gif" width="500" height="10" alt=""  /></td>
  </tr>
</table>    
    </div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <input type="hidden" id="idequipo" runat="server" />
    <input type="hidden" id="idmdisco" runat="server" />
    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
