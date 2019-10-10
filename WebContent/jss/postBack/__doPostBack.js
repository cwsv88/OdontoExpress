function __doPostBack(url, action, argument, target)
{
  var frm = document.forms[0]; 
  frm.action = url;
  frm.__ACTION.value = action;
  frm.__ARGUMENT.value = argument;   
  frm.target = target; 
  frm.submit();
}

/*     
 lastUpdateBy MMontoya
 lastUpdateDate 06/10/2008
 Se quit� la condici�n if (target != "") para la asignaci�n de la propiedad target, porque
 cuando previamente se asigna el target a un iframe es necesario en llamadas posteriores 
 pasar el parametro target con valor "", para que el target vuelva a ser la p�gina contenedora.  
*/

/* __doPostBack(url, action, argument, target) */

/*
Modificado por Luis Alfredo Murgu�a. Se le cambi� de nombre para el uso de los m�dulos de
Cotizacion y Preventa porque no se pod�a usar para contenedores ya que utilizaba los elementos
del contenedor en vez de usar los del frame interno.
*/
function __doPostBack2(url, action, argument, target)
{
  var frm = window.parent.document.forms[0]; 
  frm.action = url;
  frm.__ACTION.value = action;
  frm.__ARGUMENT.value = argument;
  frm.target = target; 
  frm.submit();
}

/* __doPostBack(url, target) */

function __doPost(url, target)
{
  var frm = document.forms[0];
  frm.action = url;
  if (target != "") frm.target = target;
  frm.submit();
}

/* __doRedirect(url) */

function __doRedirect(url)
{
  window.location.href = url;
}