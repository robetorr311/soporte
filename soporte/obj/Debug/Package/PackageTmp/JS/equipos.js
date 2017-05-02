function cargar() {
	cAyuda=document.getElementById("mensajesAyuda");
	cNombre=document.getElementById("ayudaTitulo");
	cTex=document.getElementById("ayudaTexto");
	ayuda=new Array();
	ayuda["Serial"]="Ingrese El serial del Equipo";
	ayuda["Numero"]="Ingrese el Numero del Equipo";
	ayuda["Tipo"]="Seleccione el Tipo de Equipo";
	ayuda["Responsable"]="Ingrese el Nombre del responsable del Equipo";
	ayuda["Departamento"]="Seleccione el departamento al cual pertenece el Equipo";
	ayuda["Sistema Operativo"]="Seleccione el Sistema Operativo instalado en el equipo";
	ayuda["Aplicaciones"]="Indique que aplicaciones tiene instalado el equipo.";
	ayuda["Sistemas"]="Indique que sistemas de informacion tiene instalado el equipo.";
	ayuda["Observaciones Software"]="Indique algunas observaciones relacionadas con el software instalado.";
	ayuda["RAM"]="Haz click para ingresar las caracteristicas de los modulos de memoria RAM";
	ayuda["Disco Duro"]="Haz click para ingresar las caracteristicas de los Disco duros instalados en el equipo";
	ayuda["Procesador"]="Haz click para ingresar las caracteristicas del procesador";
	ayuda["Mother Board"]="Haz click para ingresar las caracteristicas de la tarjeta madre del equipo";
	ayuda["Video"]="Haz click para ingresar las caracteristicas de la tarjeta de video";
	ayuda["Red"]="Haz click para ingresar las caracteristicas de la tarjeta de red";
	ayuda["Caracteristicas de Hardware"]="Haz click en cada icono para ingresar la informacion relacionada con el hardware instalado en el equipo";
	ayuda["Sonido"]="Haz click para ingresar las caracteristicas de la tarjeta de sonido";
	ayuda["Mac Address"]="Ingrese la direccion fisica de la tarjeta de red";
	ayuda["Observaciones Hardware"]="Indique algunas observaciones relacionadas con el hardware instalado.";
	ayuda["Guardar"]="Guardar Registro";

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
