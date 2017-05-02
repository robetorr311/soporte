<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ram.aspx.cs" Inherits="soporte.Equipos.ram" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Caracteristicas de la Memoria RAM</title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/ram.js"></script>
    <base target="_self" />    
</head>
<body class="bodyformulario" onload="cargar();" onunload="retornaRam();">
    <form id="form1" runat="server">
    <div>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="topbottom"><img src="../Imagenes/top.gif" alt="" width="500" height="10" /></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="33">Serial:</td>
    <td  class="tdformulario" width="218"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="6">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""  width="20" height="20"  onmouseover="muestraAyuda(event, 'Serial');"/></td>
    <td  class="tdformulario" width="33">Marca:</td>
    <td  class="tdformulario" width="141">
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="11">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""  width="20" height="20"  onmouseover="muestraAyuda(event, 'Marca');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="40">Numero:</td>
    <td  class="tdformulario" width="151">
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="68">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""  width="20" height="20"  onmouseover="muestraAyuda(event, 'Numero');"/></td>
    <td  class="tdformulario" width="29">Tipo:</td>
    <td  class="tdformulario" width="143">
        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="tipo" Text="DDR" /> 
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="tipo" Text="DDR II" /> 
    </td>
    <td  class="tdformulario" width="11">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""  width="20" height="20"  onmouseover="muestraAyuda(event, 'Tipo');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" width="62">Capacidad:</td>
    <td  class="tdformulario" width="402">
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
    <td  class="tdformulario" width="8">&nbsp;</td>
    <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt=""  width="20" height="20"  onmouseover="muestraAyuda(event, 'Capacidad');"/></td>
  </tr>
</table>
<table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="tdformulario" align="center">
    <span onmouseover="muestraAyuda(event, 'Guardar');">
    <asp:Button ID="Button1" OnClick="Guardar" CssClass="buttons2" Text="Guardar" runat="server" />
    </span>
    <span id="Span1">
    <asp:Button ID="Button2" OnClick="Cerrar" CssClass="buttons2" Text="Cerrar" runat="server" />
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
    <input type="hidden" id="idmram" runat="server" />
    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
