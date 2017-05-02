<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmconsulta3.aspx.cs" Inherits="soporte.Consultas.frmconsulta3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Seleccione el Nombre de su Equipo</title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/consultas.js"></script>
</head>
<body class="bodyformulario" onload="cargar();">
    <form id="form1" target="_self" runat="server">
    <div>
       <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
            </tr>
       </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form">
      <asp:Image 
      ID="Image1" 
      ImageUrl="../Imagenes/Forward.gif" runat="server" />Listado General de Computadoras Ingresados al Sistema</td>
    </tr>
  </table>
       <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0" onmouseover="self()">
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
                        OnSelectedIndexChanged="gridView_SelectedIndex" 
                        OnPageIndexChanging = "gridView_PageIndexChanging"
                        PagerSettings-Mode="NextPreviousFirstLast"
                        PagerSettings-LastPageImageUrl="../Imagenes/PageLastOver.gif"
                        PagerSettings-FirstPageImageUrl="../Imagenes/PageFirstOver.gif"
                        PagerSettings-NextPageImageUrl="../Imagenes/PageNextOver.gif"
                        PagerSettings-PreviousPageImageUrl="../Imagenes/PagePrevOver.gif"  
                        PagerSettings-Position="Bottom"  
                        runat="server">
                        <Columns>
                            <asp:CommandField ShowSelectButton="true" HeaderStyle-CssClass="GridHeaderTD" ButtonType="Image" SelectImageUrl="../Imagenes/form_go.gif" />         
                        </Columns>
                    </asp:GridView>
              </td>
           </tr>
      </table>
      <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td  class="tdformulario">
              <asp:ImageButton ID="ImageButton1" ImageUrl="../Imagenes/AdobeReader.gif" OnClick="PDF" OnClientClick="window.document.forms[0].target='rptpdf';" runat="server" /></td>
        </tr>
      </table>
      <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10"/> </td>
        </tr>
      </table>
        <input type="hidden" ID="TextBox1" runat="server">
        <input type="hidden" ID="mensaje" runat="server">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    </form>
<iframe name="rptpdf" id="rptpdf"  width="500" height="330" frameborder="0"></iframe>
</body>

</html>
