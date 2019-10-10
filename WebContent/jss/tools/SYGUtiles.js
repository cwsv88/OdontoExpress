/*
 * Contiene scripts utilizados para otorgar funcionalidades requeridas como 
 * seleccion de checkbox dependientes, manejo de cadenas, etc.
 */
 
//Funcion que devuelve una cadena sin espacios vacíos al inicio y final
//Depende de las funciones TrimLeft y TrimRight
function Trim(str){
  var resultStr = "";
  
  resultStr = TrimLeft(str);
  resultStr = TrimRight(resultStr);
  
  return resultStr;
}

function TrimLeft(str){
  var resultStr = "";
  var i = len = 0;
  
  //Sale del método si es un valor inválido
  if(str + "" == "undefined" || str == null)
    return null;
    
  //Asegura que el argumento sea un String
  str += "";
  
  if(str.length == 0)
    resultStr = "";
  else{
    len = str.length - 1;
    len = str.length;
    
    //Recorre la cadena para hallar la posición del inicio de la cadena (sin espacios)
    while((i <= len) && (str.charAt(i) == " "))
      i++;
      
    //Quitamos los espacios vacios del inicio
    resultStr = str.substring(i, len);
  }
  return resultStr;
}

function TrimRight(str){
  var resultStr = "";
  var i = 0;
  
  //Sale del método si es un valor inválido
  if(str + "" == "undefined" || str == null)
    return null;
    
  //Asegura que el argumento sea un String
  str += "";
  
  if(str.length == 0)
    resultStr = "";
  else{
    //Recorre la cadena para hallar la posicion del fin de la cadena (sin espacios)
    i = str.length - 1;
    while((i>=0) && (str.charAt(i) == " "))
      i--;
      
    //Quitamos los espacios vacios del final
    resultStr = str.substring(0, i + 1);
  }
  return resultStr;
}

//Para seleccion de CheckBox-----------------------
function Marca(status,idtabla){
    var tbl = document.getElementById(idtabla);
    for (var i=0 ; i < tbl.rows.length; i++ ){
         if(tbl.rows[i].id=='trBody'){//El id de la etiqueta tr del cuerpo de la tbla debe ser 'trBody'
            if(tbl.rows[i].cells(0).firstChild.disabled != true)
              tbl.rows[i].cells(0).firstChild.checked = status;
         }
    }          
}

//Devuelve el arreglo de CheckBox del Body de la Tabla-------------------------
function CheckBoxArray(idtabla, cant){
    var tbl = document.getElementById(idtabla);
    var bxs = new Array(cant);
    var c = 0;
    
    for (var i=0 ; i < tbl.rows.length; i++ ){
         if(tbl.rows[i].id=='trBody'){//El id de la etiqueta tr del cuerpo de la tbla debe ser 'trBody'
            bxs[c] = tbl.rows[i].cells(0).firstChild;//El CheckBox esta en la 1era columna y es el 1er elemento
            c++;
         }
    }
    return bxs;
}

//LOT 20/06/2008-Inicio Funciones hallar posicion objeto------------------------

  function findPosX(obj){
    var curleft = 0;
    if(obj.offsetParent)
        while(1) 
        {
          curleft += obj.offsetLeft;
          if(!obj.offsetParent)
            break;
          curleft -= obj.offsetParent.scrollLeft; //agregado por DADM
          obj = obj.offsetParent;
        }
    else if(obj.x)
        curleft += obj.x;
    return curleft;
  }
  
  function findPosY(obj){
    var curtop = 0;
    if(obj.offsetParent)
        while(1)
        {
          curtop += obj.offsetTop;
          if(!obj.offsetParent)
            break;
          curtop -= obj.offsetParent.scrollTop; //agregado por DADM
          obj = obj.offsetParent;
        }
    else if(obj.y)
        curtop += obj.y;
    return curtop; 
  }
      
  //Creado por: Liliana Orellana T.->LOT  Fecha Creacion: 19/06/2008
  function fncMove(){
    var posDiv = findPosY(divFooter); //Se calcula la posicion actual del DIV
    var posPlus = document.body.clientHeight - posDiv - 45; //Se calcula la posicion final del DIV
    
    var posFin = posDiv + posPlus; //Usado para condicionar accion resize
    if( posDiv < posFin) //Si la posicion final del DIV es mayor que la actual se cambia (de otro modo apareceria sobre el contenido)
        divFooter.style.top = posPlus; //Se agrega lo calculado a la posicion 'Y' del  DIV
  }
  
//LOT 20/06/2008-Fin Funciones hallar posicion de objeto------------------------

function openDialog(url, height, width) {
    return window.showModalDialog(url, window, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:no;help:no;status:no;scroll:no");        
}

// MMontoya     Octubre 2008
// Habilita todos los controles de ingreso de datos del formulario. 
// Deshabilita los botones para mantener la seguridad.  
// Este método permite que lleguen al servidor los de los controles que están deshabilitados.
function enableControls() {          
    var elem = document.forms[0].elements;

    for (var i = 0; i < elem.length; i++) {
        switch (elem[i].type) {
            case "text":
                break;
            case "select-one":
            case "checkbox":
            elem[i].disabled = false;
                break;            
            case "button":
                elem[i].disabled = true; // Deshabilita para mantener la seguridad.
                break;
        }
    }
}

function StringToDate(fecha){
    var params = fecha.split("/");
    var dia = params[0].indexOf("0") == 0 ? params[0].substring(1, params[0].length) : params[0];
    var mes = params[1].indexOf("0") == 0 ? params[1].substring(1, params[1].length) : params[1];   
    mes = parseInt(mes) - 1;
    var anio = parseInt(params[2]);

    var fechaFin = new Date(anio, mes, dia); 
    return fechaFin;
}
    
function CheckAll(tableId, checkboxId){
    var tbl = document.getElementById(tableId);

    for (var i = 0 ; i < tbl.rows.length ; i++) {
        var obj = tbl.rows[i].cells(0).firstChild;
        
        if (obj.type == "checkbox") {    
            obj.checked = document.getElementById(checkboxId).checked;
        }
    }
}

// MMontoya     19/02/2009
// Establece la posición del scroll de un div luego del postback.
// Debe ser llamado desde el evento onload de la página.
function loadScroll(divIds) {
    var strCook = document.cookie;

    for (var i = 0; i < divIds.length; i++) {
        var divId = divIds[i];
        var div = document.getElementById(divId);        
    
        var keyIni = divId + "y-";
        var keyFin = "-y" + divId;            
        var indexIni = strCook.indexOf(keyIni); 
        var indexFin = strCook.indexOf(keyFin);
    
        if (indexIni != -1 && indexFin != -1) {
            div.scrollTop = strCook.substring(indexIni + keyIni.length, indexFin);                 
        }
    
        keyIni = divId + "x-";
        keyFin = "-x" + divId;             
        indexIni = strCook.indexOf(keyIni); 
        indexFin = strCook.indexOf(keyFin);
    
        if (indexIni != -1 && indexFin != -1) {
            div.scrollLeft = strCook.substring(indexIni + keyIni.length, indexFin);                 
        }    
    }    
}


// MMontoya     19/02/2009
// Guarda la posición del scroll de un div antes del postback.
// Debe ser llamado desde el evento onunload de la página.
function saveScroll(divIds) {
    var strCook = "";    
    
    for (var i = 0; i < divIds.length; i++) {
        var divId = divIds[i];
        var div = document.getElementById(divId);
        var strY = divId + "y-" + div.scrollTop + "-y" + divId;
        var strX = divId + "x-" + div.scrollLeft + "-x" + divId
        strCook += strY + strX;    
    }

    document.cookie = strCook;
}