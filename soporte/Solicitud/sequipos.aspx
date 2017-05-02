<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sequipos.aspx.cs" Inherits="soporte.Solicitud.sequipos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seleccione el Nombre de su Equipo</title>
    <link href="../Estilos/solicitud.css" rel="stylesheet" type="text/css" />
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/sequipos.js"></script>
    <base target="_self" />    
</head>
<body onload="cargar();" onunload="retornaValor();">
    <form id="form1" runat="server">
    <div>
       <table width="300" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="../Imagenes/top.gif" alt=""  width="300" height="10" /></td>
            </tr>
       </table>
       <table width="300" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td>
                    <asp:GridView ID="GridView1"     
                        Width="300" 
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
                            <asp:CommandField ShowSelectButton="true"  HeaderStyle-CssClass="GridHeaderTD" ButtonType="Image" SelectImageUrl="../Imagenes/form_go.gif" />         
                        </Columns>
                    </asp:GridView>
              </td>
           </tr>
      </table>
      <table width="300" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="../Imagenes/bottom.gif" alt=""  width="300" height="10" /></td>
        </tr>
      </table>
        <input type="hidden" ID="TextBox1" runat="server"></asp:TextBox>
        <input type="hidden" ID="departamento" runat="server"></asp:TextBox>
   
    </div>
    </form>
</body>
</html>
