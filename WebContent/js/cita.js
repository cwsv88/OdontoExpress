function addCita() {

	dijit.byId("divCitaPC").show();
}


function btnAceptar_onclick(){
	
	var txtid = dijit.byId("idpccita");
	var txtFecha = dijit.byId("fechaCita");
	var txtHora = dijit.byId("horacita");
	var txtCelular = dijit.byId("celular");
	var txtDoctor = dijit.byId("iddoctor");
	
	var txtConsultorio = dijit.byId("idconsultorio");
	var txtDuracion = dijit.byId("duracion");
	var txtObs = dijit.byId("iddetalle").value;

	var argumentos = txtid + "\t" + txtFecha + "\t"+txtHora+ "\t" +txtCelular+ "\t"+txtDoctor+ "\t"+txtConsultorio+"\t"+txtDuracion+ "\t"+txtObs+" " ;
	//alert ("argumentos "+argumentos);
	
	if(txtid != null){
	
		__doPostBack("servletCita", "guardaCita", argumentos, "");
	}
}

function __doPostBack(url, action, argument, target){ 
    var frm = document.forms[1]; 
   frm.method = 'post';
   frm.action = 'servletCita';
   frm.__ACTION.value = action;
   frm.__ARGUMENT.value = argument;
   frm.submit();

 }

function btnCancelar_onclick(){
	dijit.byId("divCitaPC").hide();
}