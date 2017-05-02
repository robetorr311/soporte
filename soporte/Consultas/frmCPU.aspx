<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="frmCPU.aspx.cs" Inherits="soporte.Consultas.frmCPU" %>

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
  <table class="tableformulario" width="800" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="800" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tituloform"><img src="../Imagenes/frmCPU.gif" alt="" /></td>
    </tr>
  </table>
    <table class="tableformulario" border="0" width="800" onmouseover="self()">
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
                    PageSize="5"
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
                    runat="server">
                    <Columns>
					<asp:TemplateField HeaderText="Edit" ShowHeader="False"> 
						<ItemTemplate>
							<span onmouseover="muestraAyuda(event, 'Consultas: Seleccionar');"><asp:ImageButton ID="ImageButton6" CommandName="Select" Text="Seleccionar" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/form_go.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Editar');"><asp:ImageButton ID="ImageButton1" CommandName="Edit" Enabled="false" Text="Edit" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/form_edit.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Eliminar');"><asp:ImageButton ID="ImageButton2" CommandName="Delete"  Enabled="false" Text="Delete" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/CntMnuDelete.gif" runat="server" /></span>
						</ItemTemplate> 
					<EditItemTemplate>    
							<span onmouseover="muestraAyuda(event, 'Consultas: Cancelar');"><asp:ImageButton ID="ImageButton3" ButtonType="Image" CommandName="Cancel" Text="Cancel" CausesValidation="false" ImageUrl="../Imagenes/cancelar.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Guardar');"><asp:ImageButton ID="ImageButton4" ButtonType="Image" CommandName="Update" Text="Update" CausesValidation="true" ImageUrl="../Imagenes/form_save.gif" runat="server" /></span>
					</EditItemTemplate>
					</asp:TemplateField>
                     <asp:TemplateField HeaderText="Id" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="LblID" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LblID" runat="server" Text='<%# Eval("Id") %>'></asp:Label> 
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Serial" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblserial" runat="server" Text='<%# Eval("Serial") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXserial" CssClass="textboxgrid" runat="server" Text='<%# Eval("Serial") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Marca" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblmarca" runat="server" Text='<%# Eval("Marca") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXmarca" CssClass="textboxgrid" runat="server" Text='<%# Eval("Marca") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Numero" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblnumero" runat="server" Text='<%# Eval("Numero") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXnumero" CssClass="textboxgrid" runat="server" Text='<%# Eval("Numero") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Nombre" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblnombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXnombre" CssClass="textboxgrid" runat="server" Text='<%# Eval("Nombre") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Responsable" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblresponsable" runat="server" Text='<%# Eval("Responsable") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXresponsable" CssClass="textboxgrid" runat="server" Text='<%# Eval("Responsable") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Departamento" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lbldepartamento" runat="server" Text='<%# Eval("Departamento") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:Label ID="Lbldepartamento" runat="server" Text='<%# Eval("Departamento") %>'></asp:Label>
                           <asp:DropDownList ID="departamento" CssClass="select" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>            
                    </Columns>
                </asp:GridView>
            </td> 
            </tr>
  </table>
  <table class="tableformulario" width="800" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="800" height="10" /></td>
    </tr>
  </table>
    <table class="tableformulario" width="800" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="800" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">
        <input id="Button1" type="button" class="buttons2" value="Editar"  runat="server" />
     </td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="800" height="10" /></td>
    </tr>
  </table>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <input type="hidden" id="vhidequipo" runat="server" />
    <input type="hidden" id="vnombre" runat="server" />
    <input type="hidden" id="vresponsable" runat="server" />
    <input type="hidden" id="vdepartamento" runat="server" />
    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
