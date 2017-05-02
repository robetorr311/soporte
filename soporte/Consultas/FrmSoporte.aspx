<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmSoporte.aspx.cs" Inherits="soporte.Consultas.FrmSoporte" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Modificaciones: Tabla soporte técnico</title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
</head>
<body onload="cargar()" class="bodyformulario">
    <form id="form1" target="_self" runat="server">
    <div>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tituloform"><img src="../Imagenes/frmSoporte.gif" alt=""  width="500" height="30" /></td>
    </tr>
  </table>
    <table class="tableformulario" border="0" width="500" onmouseover="self()">
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
                    PageSize="5"
	                AutoGenerateColumns="true" 
                    OnSelectedIndexChanged="gridView_SelectedIndex"
                    OnRowDeleting= "gridView_DeletedIndex"
                    OnPageIndexChanging = "gridView_PageIndexChanging"
                    PagerSettings-Mode="NextPreviousFirstLast"
                    PagerSettings-LastPageImageUrl="../Imagenes/PageLastOver.gif"
                    PagerSettings-FirstPageImageUrl="../Imagenes/PageFirstOver.gif"
                    PagerSettings-NextPageImageUrl="../Imagenes/PageNextOver.gif"
                    PagerSettings-PreviousPageImageUrl="../Imagenes/PagePrevOver.gif"  
                    PagerSettings-Position="Bottom"
                    PagerStyle-CssClass="small"  
                    runat="server">
                    <Columns>
                     <asp:CommandField ShowSelectButton="true"  ButtonType="Image"  SelectImageUrl="../Imagenes/form_go.gif" />         
                     <asp:CommandField ShowDeleteButton="true" DeleteImageUrl="../Imagenes/CntMnuDelete.gif"  ButtonType="Image"   />         
                    </Columns>
                </asp:GridView>
            </td> 
            </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
    <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">
        <asp:Button ID="Button1" OnClick="Formulario" CssClass="buttons2" Text="Editar" runat="server" />
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <input type="hidden" id="vhsoporte" runat="server" />
    <input type="hidden" id="vnombre" runat="server" />
    <input type="hidden" id="vhusuario" runat="server" />
    <input type="hidden" id="vestatus" runat="server" />
    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>

</body>

</html>
