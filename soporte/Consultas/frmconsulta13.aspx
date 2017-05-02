<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmconsulta13.aspx.cs" Inherits="soporte.Consultas.frmconsulta13" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Seleccione el Nombre de su Equipo</title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <link href="../Estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/consultas.js"></script>
</head>
<body class="bodyformulario" onload="cargar();">
    <form id="form1" target="_self" runat="server">
    <div>
  <table width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/top.gif" alt="" width="600" height="10" /></td>
    </tr>
  </table>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form"><img src="../Imagenes/tituloconsulta6.gif" width="600" alt="" height="30" /></td>
    </tr>
  </table>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="247" class="tdformulario">Seleccione el tipo de Equipo que desea consultar: </td>
      <td width="222" class="tdformulario">
          <asp:DropDownList ID="htipo" CssClass="select"  OnSelectedIndexChanged="Cargargrid" AutoPostBack="true" runat="server">
          </asp:DropDownList>   
      </td>
      <td width="9" class="tdformulario">&nbsp;</td>
      <td width="22" class="tdformulario"><img src="../Imagenes/helpbn.gif" alt="" width="20" height="20" /></td>
    </tr>
  </table>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdformulario">
                    <asp:GridView ID="GridView1"     
                        Width="600" 
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
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdbotones">&nbsp;</td>
    </tr>
  </table>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/bottom.gif" alt="" width="600" height="10" /></td>
    </tr>
  </table>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/top.gif" alt="" width="600" height="10" /></td>
    </tr>
  </table>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="../Imagenes/tituloconsulta7.gif" alt="" width="600" height="30" /></td>
    </tr>
  </table>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdformulario">
                    <asp:GridView ID="GridView2"     
                        Width="600" 
                        CellSpacing="10"
                        CellPadding="10" 
                        CssClass="GridRowsTABLE"  
                        SelectedRowStyle-CssClass="GridRowSelectedTR" 
                        AlternatingRowStyle-BackColor="Beige" 
                        RowStyle-BackColor="Ivory" 
                        AllowPaging = "true" 
                        PageSize="6"
                        OnSelectedIndexChanged="gridView_SelectedIndex2" 
                        OnPageIndexChanging = "gridView_PageIndexChanging2"
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
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdbotones">
              <asp:Button ID="Button2" Text="Ver Estatus" CssClass="buttons2"  OnClick="Estatus" runat="server" />   
      </td>
    </tr>
  </table>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/bottom.gif" alt="" width="600" height="10" /></td>
    </tr>
  </table>
    <input type="hidden" id="TextBox1" runat="server"/>
    <input type="hidden" id="TextBox2" runat="server"/>
    </div>
    </form>
</body>
</html>
