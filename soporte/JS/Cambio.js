function retorna() {
    var hequipo = document.getElementById('vhequipo').value;
    window.opener.document.location = 'frmEditaEquipos.aspx?id=' + hequipo;
}