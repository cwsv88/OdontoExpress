
  function getObjetoAjax() {
    try {
      objAjax = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
      try {
        objAjax = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (E) {
        objAjax = false;
      }
    }    
    if ( !objAjax && typeof XMLHttpRequest != "undefined" ) {
      objAjax = new XMLHttpRequest();
    }
    return objAjax
  }
      
  function fncEjecuta( _lineaMensaje , _target , _url , _cad , _tituloMensaje , _metodo ){
    objAjax = getObjetoAjax();
    document.getElementById( _lineaMensaje ).innerHTML = "<img src='../../../../_resources/img/Indicator.gif'>&nbsp;" + _tituloMensaje + "..."
    var target = document.getElementById( _target );
    target.innerHTML = "";
    document.getElementById( _lineaMensaje ).innerHTML = "";
    objAjax.open( _metodo , _url + _cad ,true);
    
    objAjax.onreadystatechange = function() {
      
      if ( objAjax.readyState == 1 ) {
        ( document.getElementById( _lineaMensaje ).innerHTML == "" )?( document.getElementById( _lineaMensaje ).innerHTML = "<img src='../../../../../_resources/img/Indicator.gif'>&nbsp;" + _tituloMensaje + "..." ):null;
      } else 
      if( objAjax.readyState == 4 ) {
        if( objAjax.status == 200) {
          var respText = objAjax.responseText;
          if ( respText.indexOf("-ERROR-:") != -1 ){
            var responseTxt = respText.substring( 0 , respText.indexOf("-ERROR-:") );
            target.innerHTML = responseTxt;
            document.getElementById("tdMensajeError").innerHTML = respText.substring( respText.indexOf("-ERROR-:") + 8 , respText.length  );
          }else{
            target.innerHTML = objAjax.responseText;
          }
          document.getElementById( _lineaMensaje ).innerHTML = "";
        }
      }
    }
    objAjax.send(null);
  }
  
var objAjax = null;
var READY_STATE_COMPLETE      = 4;

function initXMLHTTPRequest(){
  var xRequest =  null;
  if ( window.XMLHttpRequest ){
    xRequest = new XMLHttpRequest();
  } else if ( window.ActiveXObject ){
    xRequest = new ActiveXObject( "Microsoft.XMLHTTP" );
  }
  return xRequest;
}

function callServer( url , params , target ){

  objAjax = initXMLHTTPRequest();
  //document.getElementById( target ).innerHTML = "";
  objAjax.open( "POST" , url , true );
  objAjax.onreadystatechange = function() {
    if ( objAjax.readyState == 1 ) {                                                                                  
      //( document.getElementById( target ).innerHTML == "" )?( document.getElementById( target ).innerHTML = "<img src='../../../../_resources/img/Indicator.gif' />" ):null;
        document.getElementById( target ).innerHTML = "<img src='../../../_resources/img/Indicator.gif' />"
    } else 
    if( objAjax.readyState == 4 ) {   
      if( objAjax.status == 200) {
        var respText = objAjax.responseText;
        if ( respText.indexOf("-ERROR-:") != -1 ){
          var responseTxt = respText.substring( 0 , respText.indexOf("-ERROR-:") );
          document.getElementById( target ).innerHTML = responseTxt;
          document.getElementById("tdError").innerHTML = respText.substring( respText.indexOf("-ERROR-:") + 8 , respText.length  );
        }else{
          document.getElementById( target ).innerHTML = objAjax.responseText;
          status = "Listo";
        }
      }
    }
  }
  objAjax.setRequestHeader( "Content-Type" , "application/x-www-form-urlencoded" );
  objAjax.send( params );
}

// La respuesta que regresa debe tener el formato de arreglo javascript. Este formato es establecido usando el método
// SYGAjaxResponseBL.getJsArray para preparar el parametro respText antes de llamar al método SYGAjaxResponseBL.SYGAjaxResponseBL.
function callServer2( url , params , target, callback ){
  objAjax = initXMLHTTPRequest();  
  objAjax.open( "POST" , url , true );

  objAjax.onreadystatechange = function() {
    if ( objAjax.readyState == 1 ) {                                                                                        
        document.getElementById( target ).innerHTML = "<img src='../../../_resources/img/Indicator.gif' />"
    } else 
    if( objAjax.readyState == 4 ) {   
      if( objAjax.status == 200) {
        document.getElementById( target ).innerHTML = "";

        var response;          
        if (objAjax.responseText != "") {
        // Carga un arreglo con los datos del response.
        eval("response = " + objAjax.responseText + ";");
        }

        callback(response);
        status = "Listo";
      }
    }
  }

  objAjax.setRequestHeader( "Content-Type" , "application/x-www-form-urlencoded" );
  objAjax.send( params );
}

function callServerPath(url , params , target, path){
  objAjax = initXMLHTTPRequest();
  //document.getElementById( target ).innerHTML = "";
  objAjax.open( "POST" , url , true );
  objAjax.onreadystatechange = function() {  
    if ( objAjax.readyState == 1 ) {      
      //( document.getElementById( target ).innerHTML == "" )?( document.getElementById( target ).innerHTML = "<img src='../../../../_resources/img/Indicator.gif' />" ):null;
        document.getElementById( target ).innerHTML = "<img src='"+ path + "/OA_HTML/sygnus/_resources/img/Indicator.gif' />"
    } else 
    if( objAjax.readyState == 4 ) {   
      if( objAjax.status == 200) {
        var respText = objAjax.responseText;
        if ( respText.indexOf("-ERROR-:") != -1 ){
          var responseTxt = respText.substring( 0 , respText.indexOf("-ERROR-:") );
          document.getElementById( target ).innerHTML = responseTxt;
          document.getElementById("tdError").innerHTML = respText.substring( respText.indexOf("-ERROR-:") + 8 , respText.length  );
        }else{
          document.getElementById( target ).innerHTML = objAjax.responseText;
          status = "Listo";
        }
      }
    }
  }
  objAjax.setRequestHeader( "Content-Type" , "application/x-www-form-urlencoded" );
  objAjax.send( params );
}


function callServer2Path( url , params , target, callback ,path){
  objAjax = initXMLHTTPRequest();  
  objAjax.open( "POST" , url , true ); 
  objAjax.onreadystatechange = function() {
    if ( objAjax.readyState == 1 ) {                                                                                        
        document.getElementById( target ).innerHTML = "<img src='"+ path + "/OA_HTML/sygnus/_resources/img/Indicator.gif' />"
    } else 
    if( objAjax.readyState == 4 ) {   
      if( objAjax.status == 200) {
        document.getElementById( target ).innerHTML = "";
        var response;          
        if (objAjax.responseText != "") {
        // Carga un arreglo con los datos del response.
        eval("response = " + objAjax.responseText + ";");
        }
        callback(response);
        status = "Listo";
      }
    }
  }
  objAjax.setRequestHeader( "Content-Type" , "application/x-www-form-urlencoded" );
  objAjax.send( params );
}


