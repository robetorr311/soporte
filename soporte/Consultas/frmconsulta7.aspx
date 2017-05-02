<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmconsulta7.aspx.cs" Inherits="soporte.Consultas.frmconsulta7" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Solicitudes</title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/consultas.js"></script>
</head>
<body class="bodyformulario">
    <form id="form1" target="_self" runat="server">
    <div>
  <table class="tableformulario" width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="600" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form">
      <asp:Image 
      ID="Image1" 
      ImageUrl="../Imagenes/tituloconsulta7.gif" runat="server" /></td>
    </tr>
  </table>
    <table class="tableformulario" border="0" width="600" onmouseover="self()">
        <tr>
            <td  class="tdformulario">
                <asp:GridView ID="GridView1" 
                    Width="600" 
                    CellSpacing="10"
                    CellPadding="10" 
                    CssClass="GridRowsTABLE"  
                    SelectedRowStyle-CssClass="GridRowSelectedTR" 
                    AlternatingRowStyle-BackColor="Beige" 
                    RowStyle-BackColor="Ivory" 
                    AllowPaging = "true" 
                    PageSize="5"
                    OnSelectedIndexChanged="gridView_SelectedIndex" 
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
                    </Columns>
                </asp:GridView>
            </td> 
            </tr>
            <tr>       
                    <td  class="tdformulario" align="center">
                        <asp:ImageButton ID="ImageButton2" ImageUrl="../Imagenes/AdobeReader.gif" OnClick="PDF" runat="server" />
                    </td>
            </tr>
    </table> 
  <table class="tableformulario" width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="600" height="10" /></td>
    </tr>
  </table>
    </div>
    </form>
</body>
</html>
