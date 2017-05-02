function retorna() {
    var hequipo = document.getElementById('vhequipo').value;
    var formulario = document.getElementById('formulario').value;
    if (formulario == "1") {
        window.opener.document.location = 'frmEditaEquipos.aspx?id=' + hequipo;
    }
    if (formulario == "2") {
        window.opener.document.location = 'frmPerifericos.aspx?menu=1&hmenu=38';
    }
}