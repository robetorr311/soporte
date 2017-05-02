function cargar() {
    cAyuda = document.getElementById("mensajesAyuda");
    cNombre = document.getElementById("ayudaTitulo");
    cTex = document.getElementById("ayudaTexto");
    ayuda = new Array();
    ayuda["Loggin"] = "Ingrese El Nombre con el cual el usuario sera identificado en el sistema!! 8 Caracteres Maximo!!";
    ayuda["Password"] = "Ingrese la clave de acceso con la cual el usuario ingresara al sistema!! 8 Caracteres Maximo!!";
    ayuda["CdRom: Serial"] = "Ingrese el serial del CdRom";
    ayuda["CdRom: Marca"] = "Ingrese la marca del CdRom";
    ayuda["CdRom: Modelo"] = "Ingrese el numero P/N del CdRom";
    ayuda["CdRom: Velocidad"] = "Indique la velocidad del CdRom";
    ayuda["Consultas: Guardar"] = "Guardar Registro";
    ayuda["Consultas: Editar"] = "Editar Registro";
    ayuda["Consultas: Seleccionar"] = "Seleccionar Registro";
    ayuda["Consultas: Cancelar"] = "Cancelar todos los Cambios";
    ayuda["Consultas: Guardar"] = "Guardar Cambios";
    ayuda["Consultas: Eliminar"] = "Eliminar Registro";
    ayuda["Consultas: Agregar"] = "Agregar nuevo dispositivo";
    ayuda["Consultas: Cerrar"] = "Cerrar Formulario";
    ayuda["Consultas: Desincorporar"] = "Desincorporar dispositivo por fallas presentadas";
    ayuda["Consultas: Cambiar"] = "Cambiar dispositivo hacia otro equipo!"; 
    ayuda["Departamento: Codigo"] = "Ingrese El Codigo del Departamento";
    ayuda["Departamento: Nombre"] = "Ingrese el Nombre del Departamento";
    ayuda["Departamento: Responsable"] = "Ingrese el nombre del funcionario responsable del Departamento";
    ayuda["Departamento: Telefono"] = "Ingrese un Numero de Telefono del Departamento";
    ayuda["Departamento: Descripcion"] = "Indique cual es la funcion del Departamento";
    ayuda["Cartuchos: Serial"] = "Ingrese el serial del disco duro";
    ayuda["Cartuchos: Marca"] = "Ingrese la marca del disco duro";
    ayuda["Cartuchos: Numero"] = "Ingrese el numero P/N del disco duro";
    ayuda["Cartuchos: Tipo"] = "Seleccione el tipo de disco duro";
    ayuda["Cartuchos: Modelo"] = "Indique la capacidad del disco duro";
    ayuda["Cartuchos: Guardar"] = "Guardar Registro";
    ayuda["Disco Duro: Serial"] = "Ingrese el serial del disco duro";
    ayuda["Disco Duro: Marca"] = "Ingrese la marca del disco duro";
    ayuda["Disco Duro: Numero"] = "Ingrese el numero P/N del disco duro";
    ayuda["Disco Duro: Tipo"] = "Seleccione el tipo de disco duro";
    ayuda["Disco Duro: Capacidad"] = "Indique la capacidad del disco duro";
    ayuda["Disco Duro: Guardar"] = "Guardar Registro";
    ayuda["Equipos: Serial"] = "Ingrese El serial del Equipo";
    ayuda["Equipos: Numero"] = "Ingrese el Numero del Equipo";
    ayuda["Equipos: Tipo"] = "Seleccione el Tipo de Equipo";
    ayuda["Equipos: Responsable"] = "Ingrese el Nombre del responsable del Equipo";
    ayuda["Equipos: Departamento"] = "Seleccione el departamento al cual pertenece el Equipo";
    ayuda["Equipos: Sistema Operativo"] = "Seleccione el Sistema Operativo instalado en el equipo";
    ayuda["Equipos: Aplicaciones"] = "Indique que aplicaciones tiene instalado el equipo.";
    ayuda["Equipos: Sistemas"] = "Indique que sistemas de informacion tiene instalado el equipo.";
    ayuda["Equipos: Observaciones Software"] = "Indique algunas observaciones relacionadas con el software instalado.";
    ayuda["Equipos: RAM"] = "Haz click para ingresar las caracteristicas de los modulos de memoria RAM";
    ayuda["Equipos: Disco Duro"] = "Haz click para ingresar las caracteristicas de los Disco duros instalados en el equipo";
    ayuda["Equipos: Procesador"] = "Haz click para ingresar las caracteristicas del procesador";
    ayuda["Equipos: Mother Board"] = "Haz click para ingresar las caracteristicas de la tarjeta madre del equipo";
    ayuda["Equipos: Video"] = "Haz click para ingresar las caracteristicas de la tarjeta de video";
    ayuda["Equipos: Red"] = "Haz click para ingresar las caracteristicas de la tarjeta de red";
    ayuda["Equipos: Caracteristicas de Hardware"] = "Haz click en cada icono para ingresar la informacion relacionada con el hardware instalado en el equipo";
    ayuda["Equipos: Sonido"] = "Haz click para ingresar las caracteristicas de la tarjeta de sonido";
    ayuda["Equipos: Mac Address"] = "Ingrese la direccion fisica de la tarjeta de red";
    ayuda["Equipos: Observaciones Hardware"] = "Indique algunas observaciones relacionadas con el hardware instalado.";
    ayuda["Equipos: Guardar"] = "Guardar Registro";
    ayuda["LAN: Serial"] = "Ingrese el serial de la Tarjeta de Red";
    ayuda["LAN: Marca"] = "Ingrese la marca de la Tarjeta de Red";
    ayuda["LAN: Modelo"] = "Ingrese el modelo de Tarjeta de Red";
    ayuda["LAN: Mac"] = "Indique la Direccion Fisica de la Tarjeta de Red";
    ayuda["LAN: Guardar"] = "Guardar Registro";
    ayuda["Procesador: Serial"] = "Ingrese el serial del procesador";
    ayuda["Procesador: Marca"] = "Ingrese la marca del procesador";
    ayuda["Procesador: Modelo"] = "Ingrese el numero P/N del procesador";
    ayuda["Procesador: Guardar"] = "Guardar Registro";
    ayuda["RAM: Serial"] = "Ingrese el serial del modulo de Memoria";
    ayuda["RAM: Marca"] = "Ingrese la marca del modulo de Memoria";
    ayuda["RAM: Numero"] = "Ingrese el numero P/N del modulo de Memoria";
    ayuda["RAM: Tipo"] = "Seleccione el tipo de modulo de Memoria";
    ayuda["RAM: Capacidad"] = "Indique la capacidad del modulo de Memoria";
    ayuda["RAM: Guardar"] = "Guardar Registro";
    ayuda["Motherboard: Serial"] = "Ingrese el serial del modulo de Memoria";
    ayuda["Motherboard: Marca"] = "Ingrese la marca del modulo de Memoria";
    ayuda["Motherboard: Numero"] = "Ingrese el numero P/N del modulo de Memoria";
    ayuda["Motherboard: Tipo"] = "Seleccione el tipo de modulo de Memoria";
    ayuda["Motherboard: Capacidad"] = "Indique la capacidad del modulo de Memoria";
    ayuda["Motherboard: Guardar"] = "Guardar Registro"; ayuda["Reportes: Fecha Inicial"] = "Haga click en el boton adjunto para seleccionar el rango de fecha inicial!!";
    ayuda["Reportes: Fecha Final"] = "Haga click en el boton adjunto para seleccionar el rango de fecha final!!";
    ayuda["Reportes: Tipo"] = "Seleccione el Tipo de Soporte";
    ayuda["Respuesta: Soporte"] = "Seleccione el nombre del tecnico que atendio la solicitud";
    ayuda["Respuesta: Falla Encontrada"] = "Señale la falla real del equipo";
    ayuda["Respuesta: Solucion Aplicada"] = "Indique que medidas implemento para solucionar el problema detectado";
    ayuda["Respuesta: Observaciones"] = "Indique que otros detalles observo durante la realizacion del soporte";
    ayuda["Respuesta: Seleccionar"] = "Seleccionar registro de solicitud";
    ayuda["Respuesta: Fecha"] = "Fecha de Respuesta";
    ayuda["Respuesta: Guardar"] = "Guardar Registro";
    ayuda["Revision: Seleccionar"] = "Seleccionar registro de solicitud";
    ayuda["Revision: Soporte"] = "Seleccione el nombre del tecnico que atendio la solicitud";
    ayuda["Revision: Falla Encontrada"] = "Señale la falla real del equipo";
    ayuda["Revision: Solucion Aplicada"] = "Indique que medidas implemento para solucionar el problema detectado";
    ayuda["Revision: Observaciones"] = "Indique que otros detalles observo durante la realizacion del soporte";
    ayuda["Revision: Fecha"] = "Fecha de Respuesta"; ayuda["Solicitud: Departamento"] = "Seleccione Un Departamento de la Lista";
    ayuda["Revision: Guardar"] = "Guardar Registro";
    ayuda["Solicitud: Solicitante"] = "Ingrese el Nombre del Solicitante";
    ayuda["Solicitud: Marca"] = "Marca del Equipo";
    ayuda["Solicitud: Software"] = "Marque una de las opciones en caso de que considere que la falla se este presentando a nivel de Software";
    ayuda["Solicitud: Hardware"] = "Marque una de las opciones en caso de que considere que la falla se este presentando a nivel de Hardware";
    ayuda["Solicitud: Telefono"] = "Telefono de contacto";
    ayuda["Solicitud: Fecha"] = "Fecha de hoy";
    ayuda["Solicitud: Nombre del equipo"] = "Despliegue el listado de equipos registrados en el sistema haciendo click sobre la computadora!!";
    ayuda["Solicitud: Tipo"] = "Seleccione de la lista desplegable el tipo de equipo que usted considere que este presentando la falla";
    ayuda["Solicitud: Seleccione"] = "Haz clic sobre el icono para ver todos los equipos registrados en el sistema y selecciona uno de ellos!!";
    ayuda["Solicitud: Guardar"] = "Guardar Solicitud";
    ayuda["Sonido: Serial"] = "Ingrese el serial de la Tarjeta de Red";
    ayuda["Sonido: Marca"] = "Ingrese la marca de la Tarjeta de Red";
    ayuda["Sonido: Modelo"] = "Ingrese el modelo de Tarjeta de Red";
    ayuda["Sonido: Guardar"] = "Guardar Registro";
    ayuda["Soporte: Loggin"] = "Seleccione el Loggin de Usuario con el cual ingresara al sistema";
    ayuda["Soporte: Nombre"] = "Ingrese el nombre del tecnico";
    ayuda["Soporte: Guardar"] = "Guardar Registro"; 
    ayuda["Usuarios: Loggin"] = "Ingrese El Nombre con el cual el usuario sera identificado en el sistema!! 8 Caracteres Maximo!!";
    ayuda["Usuarios: Password"] = "Ingrese la clave de acceso con la cual el usuario ingresara al sistema!! 8 Caracteres Maximo!!";
    ayuda["Usuarios: Nombre"] = "Ingrese El Nombre completo del usuario!!";
    ayuda["Usuarios: Tipo"] = "Seleccione el nivel de acceso que tendrá el usuario cada vez que entre al sistema";
    ayuda["Video: Serial"] = "Ingrese el serial de la Tarjeta de Red";
    ayuda["Video: Marca"] = "Ingrese la marca de la Tarjeta de Red";
    ayuda["Video: Modelo"] = "Ingrese el modelo de Tarjeta de Red";
    ayuda["Video: Guardar"] = "Guardar Registro";
}
if (navigator.userAgent.indexOf("MSIE") >= 0) navegador = 0;
else navegador = 1;
function colocaAyuda(event) {
    var corX;
    var corY;
    if (navegador == 0) {
        corX = window.event.clientX + document.documentElement.scrollLeft;
        corY = window.event.clientY + document.documentElement.scrollTop;
    }
    else {
        corX = event.clientX + window.scrollX;
        corY = event.clientY + window.scrollY;
    }
    cAyuda.style.top = corY + 20 + "px";
    cAyuda.style.left = corX + 15 + "px";
}
function ocultaAyuda() {
    cAyuda.style.display = "none";
    if (navegador == 0) {
        document.detachEvent("onmousemove", colocaAyuda);
        document.detachEvent("onmouseout", ocultaAyuda);
    }
    else {
        document.removeEventListener("mousemove", colocaAyuda, true);
        document.removeEventListener("mouseout", ocultaAyuda, true);
    }
}
function self() {
    window.document.forms[0].target = '_self';
}
function muestraAyuda(event, campo) {
    colocaAyuda(event);

    if (navegador == 0) {
        document.attachEvent("onmousemove", colocaAyuda);
        document.attachEvent("onmouseout", ocultaAyuda);
    }
    else {
        document.addEventListener("mousemove", colocaAyuda, true);
        document.addEventListener("mouseout", ocultaAyuda, true);
    }
    cNombre.innerHTML = campo;
    cTex.innerHTML = ayuda[campo];
    cAyuda.style.display = "block";
}