function cargar() {
	cAyuda=document.getElementById("mensajesAyuda");
	cNombre=document.getElementById("ayudaTitulo");
	cTex=document.getElementById("ayudaTexto");
	ayuda=new Array();
	ayuda["Departamento"]="Seleccione Un Departamento de la Lista";
	ayuda["Solicitante"]="Ingrese el Nombre del Solicitante";
	ayuda["Software"]="Marque una de las opciones en caso de que considere que la falla se este presentando a nivel de Software";
	ayuda["Hardware"]="Marque una de las opciones en caso de que considere que la falla se este presentando a nivel de Hardware";
	ayuda["Telefono"]="Telefono de contacto";
	ayuda["Fecha"] = "Fecha de hoy";
	ayuda["Nombre del equipo"] = "Despliegue el listado de equipos registrados en el sistema haciendo click sobre la computadora!!";
	ayuda["Tipo"] = "Seleccione de la lista desplegable el tipo de equipo que usted considere que este presentando la falla";
	ayuda["Seleccione"] = "Haz clic sobre el icono para ver todos los equipos registrados en el sistema y selecciona uno de ellos!!";
	ayuda["Guardar"] = "Guardar Solicitud";
}
if(navigator.userAgent.indexOf("MSIE")>=0) navegador=0;
else navegador=1;
function colocaAyuda(event){
	if(navegador==0)
	{
		var corX=window.event.clientX+document.documentElement.scrollLeft;
		var corY=window.event.clientY+document.documentElement.scrollTop;
	}
	else
	{
		var corX=event.clientX+window.scrollX;
		var corY=event.clientY+window.scrollY;
	}
	cAyuda.style.top=corY+20+"px";
	cAyuda.style.left=corX+15+"px";
}
function ocultaAyuda(){
	cAyuda.style.display="none";
	if(navegador==0) 
	{
		document.detachEvent("onmousemove", colocaAyuda);
		document.detachEvent("onmouseout", ocultaAyuda);
	}
	else 
	{
		document.removeEventListener("mousemove", colocaAyuda, true);
		document.removeEventListener("mouseout", ocultaAyuda, true);
	}
}
function muestraAyuda(event, campo){
	colocaAyuda(event);
	
	if(navegador==0) 
	{ 
		document.attachEvent("onmousemove", colocaAyuda); 
		document.attachEvent("onmouseout", ocultaAyuda); 
	}
	else 
	{
		document.addEventListener("mousemove", colocaAyuda, true);
		document.addEventListener("mouseout", ocultaAyuda, true);
	}
	
	cNombre.innerHTML=campo;
	cTex.innerHTML=ayuda[campo];
	cAyuda.style.display="block";
}
function ocultaMensaje() {
    divTransparente = document.getElementById("transparencia");
    divMensaje = document.getElementById("transparenciaMensaje");
    divTransparente.style.display = "none";
}

function muestraMensaje(mensaje) {
    divTransparente = document.getElementById("transparencia");
    divMensaje = document.getElementById("transparenciaMensaje");
    divMensaje.innerHTML = mensaje;
    divTransparente.style.display = "block";
}