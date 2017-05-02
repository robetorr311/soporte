<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="soporte.Usuarios.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Formulario Para el Mantenimiento de Usuarios del Sistema </title>
    <link href="../estilos/Skin Style.css" rel="stylesheet" type="text/css" />
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
</head>
<body class="bodyformulario" onload="cargar();">
    <form id="form1" runat="server">
    <div>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form"><asp:Image ID="Image1" ImageUrl="../Imagenes/titulousuarios.gif" runat="server" /></td>
    </tr>
  </table>
  <table  class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="138"> Login de Usuario: </td>
      <td  class="tdformulario" width="322">
          <asp:TextBox ID="TextBox1" MaxLength="8" CssClass="loggin" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="10">        
      <asp:RequiredFieldValidator id="RFVdepartamento"
            ControlToValidate="TextBox1"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Usuarios: Login');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="138">Password: </td>
      <td  class="tdformulario" width="322">
          <asp:TextBox ID="TextBox2" MaxLength="8" TextMode="Password" CssClass="password" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="10">      
      <asp:RequiredFieldValidator id="RequiredFieldValidator1"
            ControlToValidate="TextBox2"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Usuarios: Password');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdformulario" width="138">Nombre Completo: </td>
      <td class="tdformulario" width="322">
          <asp:TextBox ID="TextBox3" CssClass="nombre" runat="server"></asp:TextBox></td>
      <td class="tdformulario" width="10">      
      <asp:RequiredFieldValidator id="RequiredFieldValidator2"
            ControlToValidate="TextBox3"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Usuarios: Nombre');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdformulario" width="138">Nivel de Usuario: </td>
      <td class="tdformulario" width="322">
          <asp:DropDownList ID="nivel" CssClass="select" runat="server">
          </asp:DropDownList>
      </td>
      <td class="tdformulario" width="10">      
      <asp:RequiredFieldValidator id="RequiredFieldValidator3"
            ControlToValidate="nivel"
            Display="Static"
            InitialValue="0" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator></td>
      <td class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Usuarios: Tipo');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="73">Departamento:</td>
      <td  class="tdformulario" width="189">
          <asp:DropDownList ID="departamento" CssClass="select" runat="server">
          </asp:DropDownList>
      </td>
      <td  class="tdformulario" width="7">
        <asp:RequiredFieldValidator id="RequiredFieldValidator4"
            ControlToValidate="departamento"
            Display="Static"
            InitialValue="0" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario" width="19">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Usuarios: Departamento');"/>
      </td>
     </tr>
  </table>    

  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tdbotones" align="center">
          <span onmouseover="this.style.cursor='pointer';muestraAyuda(event, 'Usuarios: Guardar');">
          <asp:Button ID="Button1" OnClick="Guardar" CssClass="buttons2" runat="server"  Text="Guardar" />
          </span>
      </td>
    </tr>
  </table>
   <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <input type="hidden" id="vhmenu" runat="server" />
    </div>
    <table border="0" width="500" cellspacing="0" cellpadding="0">
        <tr>
            <td  class="loginDisplay">
                <asp:GridView ID="GridView1" 
                    Width="700" 
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
                    OnRowCommand="Save"                   
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
					<asp:TemplateField HeaderText="Controles" ShowHeader="False"> 
						<ItemTemplate>
							<span onmouseover="muestraAyuda(event, 'Consultas: Seleccionar');"><asp:ImageButton ID="ImageButton6" CommandName="Select" Text="Seleccionar" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/form_go.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Editar Fila');"><asp:ImageButton ID="ImageButton1" CommandName="Edit" Enabled="false" Text="Edit" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/form_edit.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Eliminar');"><asp:ImageButton ID="ImageButton2" CommandName="Delete"  Enabled="false" Text="Delete" CausesValidation="false" ButtonType="Image" ImageUrl="../Imagenes/CntMnuDelete.gif" runat="server" /></span>
						</ItemTemplate> 
					<EditItemTemplate>    
							<span onmouseover="muestraAyuda(event, 'Consultas: Cancelar');"><asp:ImageButton ID="ImageButton3" ButtonType="Image" CommandName="Cancel" Text="Cancel" CausesValidation="false" ImageUrl="../Imagenes/cancelar.gif" runat="server" /></span>
							<span onmouseover="muestraAyuda(event, 'Consultas: Guardar');"><asp:ImageButton ID="ImageButton4" ButtonType="Image" CommandName="Update" Text="Update" CausesValidation="false" ImageUrl="../Imagenes/form_save.gif" runat="server" /></span>
					</EditItemTemplate>
					</asp:TemplateField>
                     <asp:TemplateField HeaderText="Id" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="LblID" runat="server" Text='<%# Eval("idusuario") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LblID" runat="server" Text='<%# Eval("idusuario") %>'></asp:Label> 
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Loggin" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblloggin" runat="server" Text='<%# Eval("loggin") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXloggin" CssClass="textboxgrid" runat="server" Text='<%# Eval("loggin") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Password" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblpassword" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXpassword" CssClass="textboxgrid" runat="server" Text='<%# Eval("password") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Nombre" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblnombre" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TBXnombre" CssClass="textboxgrid" runat="server" Text='<%# Eval("nombre") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Estatus" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblestatus" runat="server" Text='<%# Eval("estatus") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Lblestatus" runat="server" Text='<%# Eval("estatus") %>'></asp:Label>
                            <asp:DropDownList ID="DDGestatus" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Nivel" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lblnivel" runat="server" Text='<%# Eval("nivel") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Lblnivel" runat="server" Text='<%# Eval("nivel") %>'></asp:Label>
                            <asp:DropDownList ID="DDGnivel" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Departamento" Visible="true">					
						<ItemTemplate>
                            <asp:Label ID="Lbldepartamento" runat="server" Text='<%# Eval("departamento") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Lbldepartamento" runat="server" Text='<%# Eval("departamento") %>'></asp:Label>
                            <asp:DropDownList ID="DDGdepartamento" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td> 
            </tr>
  </table>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:HiddenField ID="estatus" runat="server" />


    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
