<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="frmEditaEquipos.aspx.cs" Inherits="soporte.Consultas.frmEditaEquipos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Modificaciones: Tabla Equipos (CPU)</title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../estilos/style.css" />
	<link rel="stylesheet" type="text/css" href="../estilos/subModal.css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
	<script type="text/javascript" src="../JS/common.js"></script>
	<script type="text/javascript" src="../JS/subModal.js"></script>
</head>
<body onload="cargar()" class="bodyformulario">
    <form id="form1" target="_self" runat="server">
    <div>
  <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="880" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tituloform"><img src="../Imagenes/frmEditaEquipo.gif" alt=""/></td>
    </tr>
  </table>
    <table class="tableformulario" border="0" width="880" onmouseover="self()">
        <tr>
            <td  class="tdformulario">
                <asp:GridView ID="GridView1" 
                    Width="800" 
                    CellSpacing="10"
                    CellPadding="10" 
                    CssClass="GridRowsTABLE"  
                    SelectedRowStyle-CssClass="GridRowSelectedTR" 
                    AlternatingRowStyle-BackColor="Beige" 
                    RowStyle-BackColor="Ivory" 
                    AllowPaging = "true" 
                    PageSize="9"
	                AutoGenerateColumns="false" 
                    OnSelectedIndexChanged="gridView_SelectedIndex"
                    OnRowCommand="Guardar"                   
                    OnRowEditing="Editar" 
	                OnRowDeleting="Borrar" 
	                OnRowCancelingEdit="Cancelar" 
	                OnRowUpdating="upd"
                    OnPageIndexChanging = "gridView_PageIndexChanging"
                    PagerSettings-Mode="NextPreviousFirstLast"
                    PagerSettings-LastPageImageUrl="../Imagenes/PageLastOver.gif"
                    PagerSettings-FirstPageImageUrl="../Imagenes/PageFirstOver.gif"
                    PagerSettings-NextPageImageUrl="../Imagenes/PageNextOver.gif"
                    PagerSettings-PreviousPageImageUrl="../Imagenes/PagePrevOver.gif"  
                    PagerSettings-Position="Bottom"
                    PagerStyle-CssClass="small" 
                    ShowFooter="false" 
                    runat="server">
                    <Columns>
					<asp:TemplateField HeaderText="Edit" ShowHeader="False"> 
						<ItemTemplate>
							<span onmouseover="muestraAyuda(event, 'Consultas: Seleccionar');">
                            <asp:ImageButton ID="ImageButton6" CommandName="Select" Text="Select" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/form_go.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Editar');">
                            <asp:ImageButton ID="ImageButton1" Enabled="false" CommandName="Edit" Text="Edit" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/form_edit.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Eliminar');">
                            <asp:ImageButton ID="ImageButton2" Enabled="false"  CommandName="Delete" Text="Delete" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/CntMnuDelete.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Desincorporar');">
                            <asp:ImageButton ID="ImageButton7" Enabled="false"  CommandName="Desincorpora" Text="Desincorporar" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/desincorporar.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Cambiar');">
                            <asp:ImageButton ID="ImageButton8" Enabled="false" CommandName="Cambio" Text="Desincorporar" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/cambio.gif" runat="server" /></span>
						</ItemTemplate> 
					<EditItemTemplate>    
							<span onmouseover="muestraAyuda(event, 'Consultas: Cancelar');"><asp:ImageButton ID="ImageButton3" ButtonType="Image" CommandName="Cancel" Text="Cancel" CausesValidation="true" ImageUrl="../Imagenes/cancelar.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Guardar');"><asp:ImageButton ID="ImageButton4" ButtonType="Image" CommandName="Update" Text="Update" CausesValidation="false" ImageUrl="../Imagenes/form_save.gif" runat="server" /></span>
					</EditItemTemplate>
					<FooterTemplate>     
							<span onmouseover="muestraAyuda(event, 'Consultas: Guardar');"><asp:ImageButton ID="ImageButton5" CommandName="Add" Text="Edit" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/form_save.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Cancelar');"><asp:ImageButton ID="ImageButton3" ButtonType="Image" CommandName="Cancelar" Text="Cancel" CausesValidation="false" ImageUrl="../Imagenes/cancelar.gif" runat="server" /></span>
					</FooterTemplate>
					</asp:TemplateField>
                     <asp:TemplateField HeaderText="Id" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="LblID" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LblID" runat="server" Text='<%# Eval("Id") %>'></asp:Label> 
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="LblID" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Serial" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblserial" runat="server" Text='<%# Eval("Serial") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXserial" CssClass="textboxgrid" runat="server" Text='<%# Eval("Serial") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TBXserial" CssClass="textboxgrid" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Numero" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblnumero" runat="server" Text='<%# Eval("Numero") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXnumero" CssClass="textboxgrid" runat="server" Text='<%# Eval("Numero") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TBXnumero" CssClass="textboxgrid" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Marca" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblmarca" runat="server" Text='<%# Eval("Marca") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXmarca" CssClass="textboxgrid" runat="server" Text='<%# Eval("Marca") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TBXmarca" CssClass="textboxgrid" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Capacidad" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblcapacidad" runat="server" Text='<%# Eval("Capacidad") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXcapacidad" CssClass="textboxgrid" runat="server" Text='<%# Eval("Capacidad") %>'></asp:TextBox>
                            <asp:DropDownList ID="DDcapacidadram" runat="server">
                            </asp:DropDownList>
                            <asp:DropDownList ID="DDcapacidaddd" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
					    <FooterTemplate>     
                            <asp:TextBox ID="TBXcapacidad" CssClass="textboxgrid" runat="server"></asp:TextBox>
                            <asp:DropDownList ID="DDcapacidadram" runat="server">
                            </asp:DropDownList>
                            <asp:DropDownList ID="DDcapacidaddd" runat="server">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dispositivo" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lbltdispositivo" runat="server" Text='<%# Eval("Dispositivo") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Lbltdispositivo" runat="server" Text='<%# Eval("Dispositivo") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList OnSelectedIndexChanged="htdispositivo" AutoPostBack="true" CssClass="selectgrid" ID="Dispositivo" runat="server">
                                <asp:ListItem Text="Seleccione" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Disco Duro" Value="7"></asp:ListItem>
                                <asp:ListItem Text="Video" Value="8"></asp:ListItem>
                                <asp:ListItem Text="RAM" Value="9"></asp:ListItem>
                                <asp:ListItem Text="Procesador" Value="10"></asp:ListItem>
                                <asp:ListItem Text="Motherboard" Value="11"></asp:ListItem>
                                <asp:ListItem Text="Sonido" Value="12"></asp:ListItem>
                                <asp:ListItem Text="Red (LAN)" Value="14"></asp:ListItem>
                                <asp:ListItem Text="CdRom" Value="16"></asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tipo" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="LblTipo" runat="server" Text='<%# Eval("Tipo") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LblTipo" runat="server" Text='<%# Eval("Tipo") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="Tipo" runat="server">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td> 
            </tr>
  </table>
  <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="880" height="10" /></td>
    </tr>
  </table>
    <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="880" height="10" /></td>
    </tr>
  </table>
    <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdbotones">
        <span onmouseover="muestraAyuda(event, 'Consultas: Agregar');"><asp:Button ID="Button1" OnClick="Agregar" CssClass="buttons2" Text="Agregar" runat="server" /></span>
        <span onmouseover="muestraAyuda(event, 'Consultas: Cerrar');"><asp:Button onmouseover="window.opener.location.reload();" ID="Button2"  OnClientClick="window.parent.hidePopWin();"  class="buttons2" OnClick="Cerrar" runat="server" Text="Cerrar" /></span>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="880" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="880" height="10" /></td>
    </tr>
  </table>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <input type="hidden" id="vhequipo" runat="server" />
    <input type="hidden" id="vhiddispositivo" runat="server" />
    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
