<%@ Page  Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="soporte.Solicitud.Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Solicitud de Servicio </title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/solicitud.js"></script>
</head>
<body onload="cargar();" class="bodyformulario">
<form id="form1" runat="server" >
<div>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form">
      <asp:Image 
      ID="Image1" 
      ImageUrl="../Imagenes/Forward.gif" runat="server" />Solicitud de Servicio </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="73">Departamento:</td>
      <td  class="tdformulario" width="189">
          <asp:DropDownList ID="departamento" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="tele" runat="server">
          </asp:DropDownList>
      </td>
      <td  class="tdformulario" width="7">
        <asp:RequiredFieldValidator id="RFVdepartamento"
            ControlToValidate="departamento"
            Display="Static"
            InitialValue="0" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario" width="19">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Departamento');"/>
      </td>
      <td  class="tdformulario" width="49">Tel&eacute;fono:</td>
      <td  class="tdformulario" width="123">
          <asp:Label ID="lbltelefono" runat="server" Text=""></asp:Label></td>
      <td  class="tdformulario" width="8">&nbsp;</td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Telefono');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="163">Nombre y Apellido del Solicitante: </td>
      <td  class="tdformulario" width="181">
          <asp:TextBox ID="solicitante" CssClass="textbox" runat="server"></asp:TextBox>
      </td>
      <td  class="tdformulario" width="5">
      </td>
      <td  class="tdformulario" width="17">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Solicitante');"/>
      </td>
      <td  class="tdformulario" width="34">Fecha:</td>
      <td  class="tdformulario" width="51">
          <asp:Label ID="lblfecha" runat="server" Text=""></asp:Label></td>
      <td  class="tdformulario" width="7">&nbsp;</td>
      <td  class="tdformulario" width="24">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Fecha');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">Seleccione el Nombre del Equipo</td>
      <td  class="tdformulario">
           <asp:DropDownList ID="nequipo" AutoPostBack="true" OnSelectedIndexChanged="cambiatipo" runat="server">
          </asp:DropDownList>
          <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
     </td>
      <td  class="tdformulario" width="5">
      </td>
      <td  class="tdformulario" width="17">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Nombre del equipo');"/>
      </td>
    </tr>
  </table> 
   <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">Indique el Tipo de Equipo</td>
      <td  class="tdformulario">
          <asp:DropDownList ID="htipo" OnTextChanged="controles" AutoPostBack="true" runat="server">
          </asp:DropDownList>   
      </td>
      <td  class="tdformulario" width="5">
      </td>
      <td  class="tdformulario" width="17">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Tipo');"/>
      </td>
    </tr>
  </table>            
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="73">Marca:</td>
      <td  class="tdformulario" width="189">
            <asp:Label ID="Lblmarca" runat="server" Text=""></asp:Label>
      </td>
      <td  class="tdformulario" width="7">
      </td>
      <td  class="tdformulario" width="19">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Marca');"/>
      </td>
      <td  class="tdformulario" width="49">Tipo:</td>
      <td  class="tdformulario" width="123">
          <asp:Label ID="Lbltipo" runat="server" Text=""></asp:Label></td>
      <td  class="tdformulario" width="8"></td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Tipo');"/>
      </td>
    </tr>
  </table> 
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tddescfalla">Descripcion de la Falla </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" colspan="7">Software</td>
      <td  class="tdformulario" width="20">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Software');"/>
      </td>
    </tr>
    <tr>
      <td  class="tdsistemas" colspan="2">
          <asp:RadioButton ID="rbsa" GroupName="software"   runat="server" />
          Sistemas Administrativos</td>
      <td  class="tdsistemas" colspan="2">
          <asp:RadioButton ID="rbss" GroupName="software"  runat="server" />
Sistemas de Salud </td>
      <td  class="tdsistemas" colspan="4">
          <asp:RadioButton ID="rbso" GroupName="software"  runat="server" />
Sistema Operativo </td>
    </tr>
    <tr>
      <td  class="tdformulario" width="116">
          <asp:RadioButton ID="rbapp" GroupName="software"  runat="server" />
        Aplicaciones</td>
      <td  class="tdformulario" width="89">
          <asp:RadioButton ID="rbwin" GroupName="software"  runat="server" />
        Windows</td>
      <td  class="tdformulario" width="150">
          <asp:RadioButton ID="rboff" GroupName="software"  runat="server" />
        Office</td>
      <td  class="tdformulario" colspan="5">
          <asp:RadioButton ID="rbotr" GroupName="software"  runat="server" />
        Otro</td>
    </tr>
    <tr>
      <td  class="tdobservaciones" colspan="8">Especifique:<asp:TextBox ID="fallasoft" TextMode="MultiLine" CssClass="direccion" runat="server"></asp:TextBox></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" colspan="6">Hardware</td>
      <td  class="tdformulario" width="69">
        <img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Hardware');"/>
      </td>
    </tr>
    <tr>
      <td  class="tdformulario" width="125">
          <asp:RadioButton ID="rbcpu" GroupName="hardware"  runat="server" />
        C.P.U.</td>
      <td  class="tdformulario" width="91">
          <asp:RadioButton ID="rbimp" GroupName="hardware"  runat="server" />
        Impresora</td>
      <td  class="tdformulario" width="62">
          <asp:RadioButton ID="rbmon" GroupName="hardware"  runat="server" />
      Monitor</td>
      <td  class="tdformulario" width="62">
          <asp:RadioButton ID="rbtec" GroupName="hardware"  runat="server" />
        Teclado</td>
      <td  class="tdformulario" width="62">
          <asp:RadioButton ID="rbmou" GroupName="hardware"  runat="server" />
        Mouse</td>
      <td  class="tdformulario" colspan="2">
          <asp:RadioButton ID="rbreg" GroupName="hardware"  runat="server" />
        Regulador</td>
    </tr>
    <tr><td  class="tdobservaciones">
          <asp:RadioButton ID="rbci" GroupName="red"  runat="server" />
        Conexion de Internet </td>
      <td  class="tdobservaciones">
          <asp:RadioButton ID="rbcr" GroupName="red"  runat="server" />
    Conexion de Red </td>
          <td  class="tdobservaciones" colspan="5">
              <asp:RadioButton ID="rbswit" GroupName="red"  runat="server" />
    Falla de Switche </td>
    </tr>
    <tr>
      <td  class="tdobservaciones">Especifique la Falla: </td>
      <td  class="tdobservaciones" colspan="6">
          <asp:TextBox ID="fallahard" CssClass="direccion"  TextMode="MultiLine" runat="server"></asp:TextBox></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" align="center">
          <span onmouseover="this.style.cursor='pointer';muestraAyuda(event, 'Guardar');">
          <asp:Button ID="ImageButton1" OnClick="Guardar" CssClass="buttons2" runat="server"  Text="Guardar" />
          </span>
      </td>
    </tr>
  </table>
    <asp:Label ID="Label1" CssClass="alerta" runat="server" Text=""></asp:Label>
   <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table> 
  <input type="hidden" id="mensaje" runat="server" />
</div>
</form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>