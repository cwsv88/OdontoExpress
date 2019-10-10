/*
*   SYGPaginacion.js              Versión 1.0
*
*   Objetivo :    almacenar las funciones de javascript para la paginación de las listas.
*
*   Fecha de Creación : 01 de Septiembre de 2008
*
*   Creado por :  Bryan Malásquez T.
*
*
*
*
*/

var _params = "";

function fncPaginar( pPagActiva , pNumBloque, pUrl, pTarget, pAccion , formDebeSerParent){ 
  _params  = "__ACTION=" + pAccion;  
  _params += "&pPagActiva=" + pPagActiva ;
  _params += "&pNumBloque=" + pNumBloque ;
 
  var frm;
  if (formDebeSerParent) {
    frm = window.parent.document.forms[0];
  } else {
    frm = document.forms[0];
  }
  
  frm.action = pUrl + _params;  
  frm.target = pTarget;
  frm.submit();
  /* Llamando a la función de Ajax */
  //callServer( pUrl , _params , pTarget );
}

function fncPaginarCombo( pRango, pUrl, pTarget, pAccion , formDebeSerParent, cantRegPagina){  
   var pos = pRango.indexOf("-");  
   var pPagActiva = pRango.substring(0, pos);        
   var pNumBloque = ((parseInt(pPagActiva) - 1)/cantRegPagina) + 1;
   
   fncPaginar(pPagActiva, pNumBloque, pUrl, pTarget, pAccion, formDebeSerParent);   
}
