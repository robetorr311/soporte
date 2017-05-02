<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="soporte.Revision.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ficha para la Iniciar el Servicio de Soporte T&ecute;cnico</title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
</head>
<body class="bodyformulario" onload="cargar();">
    <form id="form1" runat="server">
    <div>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
      <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="titulo_form"><asp:Image ID="Image1" ImageUrl="../Imagenes/tituloiniserv.gif" runat="server" /></td>
      </tr>
    </table>
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
    OnSelectedIndexChanged="gridView_SelectedIndex"
    PagerSettings-Mode="NextPreviousFirstLast"
    PagerSettings-LastPageImageUrl="../Imagenes/PageLastOver.gif"
    PagerSettings-FirstPageImageUrl="../Imagenes/PageFirstOver.gif"
    PagerSettings-NextPageImageUrl="../Imagenes/PageNextOver.gif"
    PagerSettings-PreviousPageImageUrl="../Imagenes/PagePrevOver.gif"  
    PagerSettings-Position="Bottom"  
    runat="server">
            <Columns>
            <asp:CommandField ShowSelectButton="true"  HeaderStyle-CssClass="GridF" ButtonType="Image" SelectImageUrl="../Imagenes/form_go.gif" />         
            </Columns>
        </asp:GridView>
    <asp:GridView ID="GridView2" 
    Width="500" 
    CellSpacing="10"
    CellPadding="10" 
    CssClass="GridRowsTABLE"  
    SelectedRowStyle-CssClass="GridRowSelectedTR" 
    AlternatingRowStyle-BackColor="Beige" 
    RowStyle-BackColor="Ivory" 
    AllowPaging = "true" 
    PageSize="6" 
    OnPageIndexChanging = "gridView_PageIndexChanging2"
    OnSelectedIndexChanged="gridView_SelectedIndex2"
    PagerSettings-Mode="NextPreviousFirstLast"
    PagerSettings-LastPageImageUrl="../Imagenes/PageLastOver.gif"
    PagerSettings-FirstPageImageUrl="../Imagenes/PageFirstOver.gif"
    PagerSettings-NextPageImageUrl="../Imagenes/PageNextOver.gif"
    PagerSettings-PreviousPageImageUrl="../Imagenes/PagePrevOver.gif"  
    PagerSettings-Position="Bottom"  
    runat="server">
            <Columns>         
            <asp:CommandField ShowSelectButton="true" HeaderStyle-CssClass="GridF" ButtonType="Image" SelectImageUrl="../Imagenes/form_go.gif" />         
            </Columns>
        </asp:GridView>
        <asp:HiddenField ID="idsol" runat="server" />   
    <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td  class="tdformulario" width="110">Nombre del T&eacute;cnico: </td>
        <td  class="tdformulario" width="218">
            <asp:DropDownList ID="soporte" CssClass="select" OnSelectedIndexChanged="selecc" AutoPostBack="true" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="soporte2" CssClass="select" OnSelectedIndexChanged="selecc2" AutoPostBack="true" runat="server">
            </asp:DropDownList>
        </td>
        <td  class="tdformulario" width="8">
        <asp:RequiredFieldValidator id="RequiredFieldValidator2"
        ControlToValidate="soporte2"
        Display="Static"
        InitialValue="0" Width="100%" runat="server">
        *
        </asp:RequiredFieldValidator>   
        <asp:RequiredFieldValidator id="RequiredFieldValidator1"
        ControlToValidate="soporte"
        Display="Static"
        InitialValue="0" Width="100%" runat="server">
        *
        </asp:RequiredFieldValidator> 
        </td>
        <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Revision: Soporte');"/></td>
        <td  class="tdformulario" width="32">Fecha:</td>
        <td  class="tdformulario" width="58">
            <asp:Label ID="lblfecha" runat="server" Text=""></asp:Label></td>
        <td  class="tdformulario" width="4">&nbsp;</td>
        <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Revision: Fecha');"/></td>
      </tr>
    </table>
    <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td  class="tdobservaciones" width="100">Falla Encontrada: </td>
        <td  class="tdobservaciones" width="361">
            <asp:TextBox ID="falla" CssClass="falla" TextMode="MultiLine" runat="server"></asp:TextBox></td>
        <td  class="tdobservaciones" width="7">&nbsp;</td>
        <td  class="tdobservaciones" width="22"><img src="../Imagenes/helpbntdobs.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Revision: Falla Encontrada');"/></td>
      </tr>
    </table>
    <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td  class="tdobservaciones" width="100">Observaciones: </td>
        <td  class="tdobservaciones" width="361"><asp:TextBox CssClass="observaciones" ID="observaciones" TextMode="MultiLine" runat="server"></asp:TextBox></td>
        <td  class="tdobservaciones" width="7">&nbsp;</td>
        <td  class="tdobservaciones" width="22"><img src="../Imagenes/helpbntdobs.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Revision: Observaciones');"/></td>
      </tr>
    </table>
    <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
      <tr>
      <td  class="tdbotones" align="center">
          <span onmouseover="this.style.cursor='pointer';muestraAyuda(event, 'Revision: Guardar');">
          <asp:Button ID="Button1" OnClick="Guardar" CssClass="buttons2" runat="server"  Text="Guardar" />
          <asp:Button ID="Button2" OnClick="Pendiente" CssClass="buttons2" runat="server"  Text="Ver Asignadas" />
          <asp:Button ID="Button3" OnClick="Todos" CssClass="buttons2" runat="server"  Text="Ver Todas" />
          </span>
      </td>
      </tr>
    </table>
    <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
    </table>  
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </div>
<input type="hidden" id="vhmenu" runat="server" />
<input type="hidden" id="vhsoporte" runat="server" />

</form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
