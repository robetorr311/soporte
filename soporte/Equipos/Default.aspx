<%@ Page Language="C#" AutoEventWireup="true"  ValidateRequest="true" CodeBehind="Default.aspx.cs" Inherits="soporte.Equipos.Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ficha para el control de equipos de computaci&oacute;n </title>
    <link href="../estilos/soporte.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../estilos/style.css" />
	<link rel="stylesheet" type="text/css" href="../estilos/subModal.css" />
    <script type="text/javascript" src="../JS/soporte.js"></script>
	<script type="text/javascript" src="../JS/common_eq.js"></script>
	<script type="text/javascript" src="../JS/subModal_eq.js"></script>
</head>
<body class="bodyformulario" onload="cargar();">
    <form id="form1" target="_self" runat="server">
    <div>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form"><asp:Image ID="Image1" ImageUrl="../Imagenes/tituloequi.gif" runat="server" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="50">Serial: </td>
      <td  class="tdformulario"><asp:TextBox ID="serial" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="2">
      </td>
      <td  class="tdformulario"><img src="../Imagenes/helpbn.gif"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Serial');"/></td>
      <td  class="tdformulario" width="50">Marca: </td>
      <td  class="tdformulario"><asp:TextBox ID="marca" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="2">
      </td>
      <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Numero');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="50">Nombre: </td>
      <td  class="tdformulario"><asp:TextBox ID="nombre" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="2">
      </td>
      <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Serial');"/></td>
      <td  class="tdformulario" width="50">Numero: </td>
      <td  class="tdformulario"><asp:TextBox ID="numero" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="2">
      </td>
       <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Numero');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
       <td  class="tdformulario" width="80">Responsable: </td>
      <td  class="tdformulario"><asp:TextBox ID="responsable" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="2">
      </td>
      <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Responsable');"/>
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
     <tr>
     <td  class="tdformulario" width="80">Departamento: </td>
      <td  class="tdformulario">
          <asp:DropDownList ID="departamento" CssClass="select" runat="server">
          </asp:DropDownList>
      </td>
      <td  class="tdformulario" width="2">
      </td>
      <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Departamento');" />
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" width="80">Tipo de Equipo: </td>
      <td  class="tdformulario" align="left">
          <asp:DropDownList ID="tipo" CssClass="select" AutoPostBack="true" OnSelectedIndexChanged="controles" runat="server">
          </asp:DropDownList>
      </td>
      <td  class="tdformulario" width="2">
      </td>
      <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Tipo');"/></td>
      <td  class="tdformulario">Sistema Operativo : </td>
      <td  class="tdformulario">
          <asp:DropDownList ID="soperativo" CssClass="select" runat="server">
          </asp:DropDownList>
      </td>
      <td  class="tdformulario" width="2">
      </td>
      <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Sistema Operativo');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdobservaciones" width="90">Aplicaciones: </td>
      <td  class="tdobservaciones"><asp:TextBox ID="aplicaciones" CssClass="aplicaciones" TextMode="MultiLine" runat="server"></asp:TextBox></td>
      <td  class="tdobservaciones">
      </td>
      <td  class="tdobservaciones"><img src="../Imagenes/helpbntdobs.gif"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Aplicaciones');" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdobservaciones" width="90">Sistemas de informacion: </td>
      <td  class="tdobservaciones"><asp:TextBox ID="sistemas" CssClass="sistemas" TextMode="MultiLine" runat="server"></asp:TextBox></td>
      <td  class="tdobservaciones">
      </td>
      <td  class="tdobservaciones"><img src="../Imagenes/helpbntdobs.gif"   alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Sistemas');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdobservaciones" width="90">Observaciones a nivel de software : </td>
      <td  class="tdobservaciones"><asp:TextBox ID="observacioness" CssClass="observacioness" TextMode="MultiLine" runat="server"></asp:TextBox></td>
      <td  class="tdobservaciones"></td>
      <td  class="tdobservaciones"><img src="../Imagenes/helpbntdobs.gif"   alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Observaciones Software');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdobservaciones" width="10">Caracteristicas del Hardware: </td>
      <td  class="tdobservaciones">
          <span onmouseover="muestraAyuda(event, 'Equipos: RAM');">          <input type="button" ID="Button3" value="RAM" runat="server" class="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Equipos: Disco Duro');">   <input type="button" ID="Button2" value="Disco Duro" runat="server" class="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Equipos: Procesador');">   <input type="button" ID="Button4" value="Procesador" runat="server" class="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Equipos: Mother Board');"> <input type="button" ID="Button5" value="Motherboard" runat="server" class="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Equipos: Red');">          <input type="button" ID="Button6" value="LAN" runat="server" class="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Equipos: Video');">        <input type="button" ID="Button7" value="Video" runat="server" class="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Equipos: Sonido');">       <input type="button" ID="Button8" value="Sonido" runat="server" class="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Equipos: CdRom');">        <input type="button" ID="Button9" value="Cdrom" runat="server" class="buttons2"/></span>
      </td>
      <td  class="tdobservaciones" width="1">
          <input type="hidden" ID="ram" runat="server" />
          <input type="hidden" ID="dd" runat="server" />
          <input type="hidden" ID="procesador" runat="server" />
          <input type="hidden" ID="motherboard" runat="server" />
          <input type="hidden" ID="lan" runat="server" />
          <input type="hidden" ID="video" runat="server" />
          <input type="hidden" ID="sonido" runat="server" />
          <input type="hidden" ID="cdrom" runat="server" />
          <input type="hidden" ID="mensa" runat="server" />
          </td>
      <td  class="tdobservaciones" width="20"><img src="../Imagenes/helpbntdobs.gif"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Caracteristicas de Hardware');"/></td>
    </tr>
  </table>
    <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
    <td  class="tdformulario">
        <asp:Label ID="Label3" runat="server" Text="Modelo:"></asp:Label>
     </td>
     <td  class="tdformulario">
     <asp:TextBox ID="modelo" runat="server"></asp:TextBox>
     </td>
     <td  class="tdformulario">
      </td>
      <td  class="tdformulario">
          <asp:Label ID="Label4" runat="server" Text="Tipo:"></asp:Label></td>
          <td  class="tdformulario"><asp:DropDownList
              ID="htdisp" runat="server">
          </asp:DropDownList></td>
            <td  class="tdformulario"></td>
            </tr>
            </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdobservaciones">Observaciones a nivel de hardware : </td>
      <td  class="tdobservaciones"><asp:TextBox ID="observacionesh" CssClass="observacionesh" TextMode="MultiLine" runat="server"></asp:TextBox></td>
      <td  class="tdobservaciones"></td>
      <td  class="tdobservaciones"><img src="../Imagenes/helpbntdobs.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Equipos: Observaciones Hardware');"/></td>       
    </tr>
  </table>
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdbotones" align="center">
          <span onmouseover="muestraAyuda(event, 'Equipos: Guardar');"><asp:Button ID="Button1"  Text="Guardar" CssClass="buttons2" OnClick="Guardar" runat="server"/></span>
      </td>
    </tr>
  </table>    
  <table class="tableformulario" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="500" height="10" /></td>
    </tr>
  </table>
        <input type="hidden" ID="HiddenField1" runat="server" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </div>
      <input type="hidden" id="vhmenu" runat="server" />
    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
