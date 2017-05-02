<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="soporte.Equipos.Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ficha para el control de equipos de computaci&oacute;n </title>
    <link href="../Estilos/soporte.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/equipos.js"></script>
</head>
<body class="bodyformulario" onload="cargar();">
    <form id="form1" runat="server">
    <div>
  <table class="tableformulario" width="800" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="topbottom"><img src="../Imagenes/top.gif" alt=""  width="800" height="10" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="titulo_form"><asp:Image ID="Image1" ImageUrl="../Imagenes/Forward.gif" runat="server" />Ficha para el control de equipos de computaci&oacute;n </td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">Serial: </td>
      <td  class="tdformulario"><asp:TextBox ID="serial" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="2">
        <asp:RequiredFieldValidator id="RFVserial"
            ControlToValidate="serial"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario"><img src="../Imagenes/helpbn.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Serial');"/></td>
      <td  class="tdformulario">Marca: </td>
      <td  class="tdformulario"><asp:TextBox ID="marca" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="2">
        <asp:RequiredFieldValidator id="RFVmarca"
            ControlToValidate="marca"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario"><img src="../Imagenes/helpbn.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Numero');"/></td>
       <td  class="tdformulario">Nombre: </td>
      <td  class="tdformulario"><asp:TextBox ID="nombre" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario" width="2">
        <asp:RequiredFieldValidator id="RequiredFieldValidator1"
            ControlToValidate="nombre"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario"><img src="../Imagenes/helpbn.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Serial');"/></td>

    </tr>
  </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">Numero: </td>
      <td  class="tdformulario"><asp:TextBox ID="numero" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario">
        <asp:RequiredFieldValidator id="RequiredFieldValidator2"
            ControlToValidate="numero"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario"><img src="../Imagenes/helpbn.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Numero');"/></td>
       <td  class="tdformulario">Responsable: </td>
      <td  class="tdformulario"><asp:TextBox ID="responsable" CssClass="textbox" runat="server"></asp:TextBox></td>
      <td  class="tdformulario">
        <asp:RequiredFieldValidator id="RFVresponsable"
            ControlToValidate="responsable"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario"><img src="../Imagenes/helpbn.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Responsable');"/>
      </td>
      <td  class="tdformulario">Departamento: </td>
      <td  class="tdformulario">
          <asp:DropDownList ID="departamento" CssClass="textbox" runat="server">
          </asp:DropDownList>
      </td>
      <td  class="tdformulario">
        <asp:RequiredFieldValidator id="RFVdepartamento"
            ControlToValidate="departamento"
            Display="Static"
            InitialValue="0" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario"><img src="../Imagenes/helpbn.gif" width="20" height="20" alt="Ayuda" onmouseover="muestraAyuda(event, 'Departamento');" />
      </td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">Tipo de Equipo: </td>
      <td  class="tdformulario" align="left">
          <asp:DropDownList ID="tipo" CssClass="textbox" AutoPostBack="true" OnSelectedIndexChanged="controles" runat="server">
          </asp:DropDownList>
      </td>
      <td  class="tdformulario">
        <asp:RequiredFieldValidator id="RFVtipo"
            ControlToValidate="tipo"
            Display="Static"
            InitialValue="0" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario" align="right"><img src="../Imagenes/helpbn.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Tipo');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario">Sistema Operativo : </td>
      <td  class="tdformulario">
          <asp:DropDownList ID="soperativo" CssClass="textbox" runat="server">
          </asp:DropDownList>
      </td>
      <td  class="tdformulario">
        <asp:RequiredFieldValidator id="RFVsoperativo"
            ControlToValidate="soperativo"
            Display="Static"
            InitialValue="0" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario"><img src="../Imagenes/helpbn.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Sistema Operativo');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" colspan="3">Aplicaciones: </td>
    </tr>
    <tr>
      <td  class="tdobservaciones" width="468"><asp:TextBox ID="aplicaciones" CssClass="aplicaciones" TextMode="MultiLine" runat="server"></asp:TextBox></td>
      <td  class="tdobservaciones" width="4">
        <asp:RequiredFieldValidator id="RFVaplicaciones"
            ControlToValidate="aplicaciones"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>
      </td>
      <td  class="tdobservaciones" width="20"><img src="../Imagenes/helpbntdobs.gif" width="20" height="20" alt="Ayuda" onmouseover="muestraAyuda(event, 'Aplicaciones');" /></td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" colspan="3">Sistemas de informacion: </td>
    </tr>
    <tr>
      <td  class="tdobservaciones" width="468"><asp:TextBox ID="sistemas" CssClass="sistemas" TextMode="MultiLine" runat="server"></asp:TextBox></td>
      <td  class="tdobservaciones" width="4">
        <asp:RequiredFieldValidator id="RFVsistemas"
            ControlToValidate="sistemas"
            Display="Static"
            InitialValue="" Width="100%" runat="server">
            *
        </asp:RequiredFieldValidator>

      </td>
      <td  class="tdobservaciones" width="20"><img src="../Imagenes/helpbntdobs.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Sistemas');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" colspan="3">Observaciones a nivel de software : </td>
    </tr>
    <tr>
      <td  class="tdobservaciones" width="468"><asp:TextBox ID="observacioness" CssClass="observacioness" TextMode="MultiLine" runat="server"></asp:TextBox></td>
      <td  class="tdobservaciones" width="4"></td>
      <td  class="tdobservaciones" width="20"><img src="../Imagenes/helpbntdobs.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Observaciones Software');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" colspan="3" width="20">Caracteristicas del Hardware: </td></tr>
      <tr>
      <td  class="tdformulario" width="170">
          <span onmouseover="muestraAyuda(event, 'RAM');"><asp:Button ID="Button3" Text="RAM" OnClick="vram" runat="server" CssClass="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Disco Duro');"><asp:Button ID="Button2" runat="server"  Text="Disco Duro" OnClick="discoduro" CssClass="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Procesador');"><asp:Button ID="Button4" OnClick="vprocesador" Text="Procesador" runat="server" CssClass="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Mother Board');"><asp:Button ID="Button5" OnClick="vmotherboard" Text="Motherboard" runat="server" CssClass="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Red');"><asp:Button ID="Button6" OnClick="vlan" Text="LAN" runat="server" CssClass="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Video');"><asp:Button ID="Button7" OnClick="vvideo" Text="Video" runat="server" CssClass="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'Sonido');"><asp:Button ID="Button8"   OnClick="vsonido" Text="Sonido" runat="server" CssClass="buttons2"/></span>
          <span onmouseover="muestraAyuda(event, 'CdRom');"><asp:Button ID="Button9"  OnClick="vcdrom" Text="Cdrom" runat="server" CssClass="buttons2"/></span>
      </td>
      <td  class="tdformulario" width="4">
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
      <td  class="tdformulario" width="20"><img src="../Imagenes/helpbn.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Caracteristicas de Hardware');"/></td>
    </tr>
  </table>
    <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
    <td  class="tdformulario">
        <asp:Label ID="Label3" runat="server" Text="Modelo:"></asp:Label>
     </td>
     <td  class="tdformulario">
     <asp:TextBox ID="modelo" runat="server"></asp:TextBox>
     </td>
     <td  class="tdformulario"><asp:RequiredFieldValidator id="RFVmodelo"
                ControlToValidate="modelo"
                Display="Static"
                InitialValue="" Width="100%" runat="server">
                *
         </asp:RequiredFieldValidator>
      </td>
      <td  class="tdformulario">
          <asp:Label ID="Label4" runat="server" Text="Tipo:"></asp:Label></td>
          <td  class="tdformulario"><asp:DropDownList
              ID="htdisp" runat="server">
          </asp:DropDownList></td>
            <td  class="tdformulario"><asp:RequiredFieldValidator id="RFVhtdisp"
                ControlToValidate="htdisp"
                Display="Static"
                InitialValue="0" Width="100%" runat="server">
                *
            </asp:RequiredFieldValidator></td>
            </tr>
            </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" colspan="3">Observaciones a nivel de hardware : </td>
    </tr>
    <tr>
      <td  class="tdobservaciones" width="468"><asp:TextBox ID="observacionesh" CssClass="observacionesh" TextMode="MultiLine" runat="server"></asp:TextBox></td>
      <td  class="tdobservaciones" width="4"></td>
      <td  class="tdobservaciones" width="20"><img src="../Imagenes/helpbntdobs.gif" width="20" height="20"  alt="Ayuda" onmouseover="muestraAyuda(event, 'Observaciones Hardware');"/></td>
    </tr>
  </table>
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td  class="tdformulario" align="center">
          <span onmouseover="muestraAyuda(event, 'Guardar');"><asp:Button ID="Button1"  Text="Guardar" CssClass="buttons2" OnClick="Guardar" runat="server"/></span>
      </td>
    </tr>
  </table>    
  <table class="tableformulario" width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td class="topbottom"><img src="../Imagenes/bottom.gif" alt=""  width="800" height="10" /></td>
    </tr>
  </table>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </div>
    </form>
<div id="mensajesAyuda">
	<div id="ayudaTitulo"></div>
	<div id="ayudaTexto"></div>
</div>
</body>
</html>
