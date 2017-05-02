<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmconsulta2.aspx.cs" Inherits="soporte.Consultas.frmconsulta2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Solicitudes Pendientes</title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/consultas.js"></script>
</head>
<body class="bodyformulario">
    <form id="form1" target="_self" runat="server">
    <div>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tituloform"><img src="../Imagenes/tituloconsulta2.gif" alt=""  width="500" height="30" /></td>
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
                    OnPageIndexChanging = "gridView_PageIndexChanging"
                    PagerSettings-Mode="NextPreviousFirstLast"
                    PagerSettings-LastPageImageUrl="../Imagenes/PageLastOver.gif"
                    PagerSettings-FirstPageImageUrl="../Imagenes/PageFirstOver.gif"
                    PagerSettings-NextPageImageUrl="../Imagenes/PageNextOver.gif"
                    PagerSettings-PreviousPageImageUrl="../Imagenes/PagePrevOver.gif"  
                    PagerSettings-Position="Bottom"
                    runat="server">
                    <Columns>
                    <asp:CommandField ShowSelectButton="true"  HeaderStyle-CssClass="GridF" ButtonType="Image"  SelectImageUrl="../Imagenes/form_go.gif" />         
                    </Columns>
                    
                </asp:GridView>
            </td> 
            </tr>
            <tr>       
                    <td  class="tdformulario" align="center">
                        <asp:ImageButton ID="ImageButton2" ImageUrl="../Imagenes/AdobeReader.gif" OnClientClick="window.document.forms[0].target='rptpdf';" OnClick="PDF" runat="server" />
                    </td>
            </tr>
    </table> 
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
    </div>
    </form>
    <iframe class="bodyformulario" name="rptpdf"  id="rptpdf"  width="500" height="330" frameborder="0"></iframe>
</body>
</html>
