	function addPaciente(){
		dijit.byId("divRegistroInicial").show();
	}
	
	function btnCancelar_onclick(){
		dijit.byId("divRegistroInicial").hide();
	}
	
	function btnAceptar_onclick(){
		
		  var frm = document.forms[1]; 
		   frm.method = 'post';
		   frm.action = 'servletPaciente';
		   frm.hAccion.value = 'ingresoRapido';
		   //frm.__ARGUMENT.value = argument;
		   frm.submit();
	}
	
	function __doPostBack(url, action, argument, target){ 
		    var frm = document.forms[1]; 
		   frm.method = 'post';
		   frm.action = 'servletPaciente';
		   frm.hAccion.value = 'ingresoRapido';
		   frm.__ARGUMENT.value = argument;
		   frm.submit();

		 }