/*
 *Este archivo nos ayudara con las funciones basicas principales de valicacion, 
 *como es en el caso de querer validar solo numeros enteros, floats.
 *tambien se pueden presentar validaciones basicas como para las cadenas tipo 
 *email, cadena que no acepte caracteres especiales, etc ..
 */  
  
  function fncValidaFloat( _id ){
    var charCode = event.keyCode ;
    var cadena    = _id.value ; 
    if (((charCode != 13) && (charCode != 27) )){
    if( ( ( charCode < 48 ) || ( charCode > 57 ) ) && ( charCode != 46 ) ) {
      alert("Por favor, ingrese sólo números");
      event.returnValue = false;
        }else{//Agregado por LMG 11/12/2008
          event.returnValue = true;
    }
    
    if( charCode == 46 ){
      if ( cadena.indexOf(".") != -1 ){
        alert("No puede ingresar mas de 1 punto decimal");
        event.returnValue = false;
          }else{//Agregado por LMG 11/12/2008
            event.returnValue = true;
      }
    }
  }
  }
  
  function fncValidaFloatSE( _id ){
    var charCode = event.keyCode ;
    var cadena    = _id.value ;
    
    if( ( ( charCode < 48 ) || ( charCode > 57 ) ) && ( charCode != 46 ) ) {
      alert("Por favor, ingrese sólo números");
      return false;
    }
    
    if( charCode == 46 ){
      if ( cadena.indexOf(".") != -1 ){
        alert("No puede ingresar mas de 1 punto decimal");
        return false;
      }
    }
    
    return true;
  }
  
  function fncValidaInteger(  ){
    var charCode = event.keyCode ;
    if (((charCode != 13) && (charCode != 27) )){
     if(  ( charCode < 48 ) || ( charCode > 57 ) ) {
      alert("Por favor, ingrese sólo números");
      event.returnValue = false;
     }       
    }
  }
  
  function fncValidaIntegerSE( _id ){
    var charCode = event.keyCode ;
    var cadena    = _id.value ;
    
    if( ( ( charCode < 48 ) || ( charCode > 57 ) ) && ( charCode != 46 ) ) {
      alert("Por favor, ingrese sólo números");
      return false;
    }       
    
    return true;
  }
  
/*
 *Las siguientes funciones permiten poder cambiarle el estilo de los asteriscos 
 *( que representan los campos obligatorios de un formulario ), cambiando de 
 *color a rojo cuando un campo obligatorio falte completar o cambiando a negro 
 *cuando no se tenga ningun problema.
 */

  function fncActivaCpoObl( _target ){
    var td = document.getElementById(_target);  
    var span = td.getElementsByTagName("span");   
    span[0].className = "x2q";
  }
  
  function fncDesactivaCpoObl( _target ){
    var td = document.getElementById(_target);  
    var span = td.getElementsByTagName("span");   
    span[0].className = "x8";
  }
  
/*
 *Las siguientes funciones permiten poder cambiarle el estilo de los asteriscos 
 *( que representan los campos obligatorios de un formulario ), cambiando de 
 *color a rojo cuando un campo obligatorio falte completar o cambiando a negro 
 *cuando no se tenga ningun problema.
 */

  function fncShowCpoObl( _target ){
    var td = document.getElementById(_target);  
    var span = td.getElementsByTagName("span");   
    span[0].style.visibility="";
  }
  
  function fncHideCpoObl( _target ){
    var td = document.getElementById(_target);  
    var span = td.getElementsByTagName("span");   
    span[0].style.visibility="Hidden";
  }  
  
var mensaje = "";
/**
 * @createdBy Liliana Orellana Torres T. -> LOT
 * @creationDate 2007
 * @lastUpdatedBy CYL
 * @lastUpdateDate 16/10/2008
 * @description Metodo que valida seleccion de CheckBoxes / Radiobuttons.
 * @param bxs -> Arreglo de objetos a evaluar (obtenidos por document.getElementsByName)
 * @return flag -> Indicador de validez.
 *                 Si la condicion es falsa: 
 *                 Se debe mostrar un alert luego de la llamada al metodo para mostrar el mensaje.
 */
function validaSeleccion(bxs){
    var flag = false;
    mensaje = "";

    if(bxs.length == 0){
      flag = false;
      mensaje = "No existe ningún registro para realizar la acción requerida.";
    }else{
      for(var j=0 ; j < bxs.length; j++ ){
         if(bxs[j].checked == true){
           flag = true;
           break;
         }
      }          
      if(flag == false){
         mensaje = "Seleccione un registro";
      }
    }
    return flag;
}

/*
 *Función que valida el ingreso de un número telefónico.
 *utiliza una mascara: ###-####
 */
function fnTelefonoValidacion(object){
  var re = new RegExp("^[0-9]{3}-? ?[0-9]{4}$");  
  var flag = re.exec(object.value);
  if(flag){
    var nuevaCadena = "";
    var cadena = object.value;        
    var pos = cadena.indexOf("-");    
    if(pos == -1){
      pos = cadena.indexOf(" ");
      if(pos > 0){
        var val = cadena.split(" ");
        var nCadena="";
        for(i=0;i<val.length;i++){
          nCadena += val[i];
        }
        var patron = new Array(3,4);
        object.value = mascara(nCadena, "-", patron, true);
      }else{
        var patron = new Array(3,4);
        object.value = mascara(cadena, "-", patron, true);
      }      
    }    
  }else{
    object.focus();
    object.select();
    alert("Número telefónico incorrecto");
  }  
}

//Creado por: Luis Alfredo Murguía Gastelo
//Fecha: 22/10/2008
//Descripción: Sirve para controlar que se escriba hasta un máximo de caractéres desde un textarea (sólo se ha probado en él)
//param element: objeto a controlar
//param maxvalue: máximo número de carácteres a ingresar
//Comentario: Este método puede ser llamado desde un onkeydown del objeto que se quiera controlar o también puede ser implementado por otros métodos ya que devuelve
//valor booleano
function validarMaxLength(element, maxvalue)
 {
     var flag = false;
     var ingresado = eval(element.value.length); //elemento a controlar
     if (ingresado  > maxvalue){
        flag=true;
        element.value=element.value.substring(0,maxvalue);//trunca la cadena para que no se siga añadiendo caracteres
     }        
     return flag;
 }
 //Por ejemplo, el siguiente código ha sido implementado:
 /* 
 function mostrarCantCaracPermitidos(element, maxvalue, objectId)
 {
    var ingresado = eval(element.value.length);
    if(!validarMaxLength(element, maxvalue)){
        document.getElementById(objectId).innerHTML = "<input class='x4' id='txtCont' name='txtCont' align='right' style='width:60px' value='"+ingresado+"'></input>";
    }else{
        document.getElementById(objectId).innerHTML = "<input class='x4' id='txtCont' name='txtCont' align='right' style='width:60px' value='"+maxvalue+"'></input>";
    }
 }*/
 //Se aplica en oa_html/sygnus/vap/gcr/prc/cot/SYGAnularCotizacion.jsp y la función está en el respectivo js/

// Creado       LMG         10/10/2008
// Modificado   MMontoya    17/02/2009
function fnFechaValidacion(object){  
  var res;
  if( object.value!="" ){
      if(isDate(object.value)){
        fnDateMask(object);
        res=true;
      }else{
        object.focus();
        object.select();
        alert("Formato de fecha incorrecto\nFormato correcto dd/mm/yyyy");
        res=false;
      }
  }
  return res;
}
//Creado por LFL para retornar solo el estado de la Fecha 
function fnFechaValidacion2(object){  
  var res;
  if( object.value!="" ){
      if(isDate(object.value)){
        //fnDateMask(object);
        res=true;
      }else{
        res=false;
      }
  }
  return res;
}

/*
 *Función que valida el ingreso de un número telefónico.
 *utiliza una mascara: ###-###-###
 */
function fnTelefonoMovilValidacion(object){
  var re = new RegExp("^[0-9]{3}-? ?[0-9]{3}-? ?[0-9]{3}$");  
  var flag = re.exec(object.value);
  if(flag){
    var nuevaCadena = "";
    var cadena = object.value;        
    var pos = cadena.indexOf("-");        
    if(pos == -1){
      pos = cadena.indexOf(" ");
      if(pos == -1){
        var patron = new Array(3,3,3);
        object.value = mascara(cadena, "-", patron, true);
      }else{
        var val = cadena.split(" ");
        var nCadena="";
        for(i=0;i<val.length;i++){
          nCadena += val[i];
        }
        var patron = new Array(3,3,3);
        object.value = mascara(nCadena, "-", patron, true);
      }      
    }else{
      pos = cadena.indexOf(" ");
      if(pos > 0){
        var val = cadena.split(" ");
        var nCadena="";
        for(i=0;i<val.length;i++){
          nCadena += val[i];
        }
        var val2 = nCadena.split("-");
        var nCadena2="";
        for(i=0;i<val2.length;i++){
          nCadena2 += val2[i];
        }
        var patron = new Array(3,3,3);
        object.value = mascara(nCadena2, "-", patron, true);
      }else{
        var val = cadena.split("-");
        var nCadena="";
        for(i=0;i<val.length;i++){
          nCadena += val[i];
        }
        var patron = new Array(3,3,3);
        object.value = mascara(nCadena, "-", patron, true);
      }
    }
  }else{
    object.focus();
    object.select();
    alert("Número telefónico incorrecto");
  }  
}

/*
 *Función que valida el ingreso de un número entero.
 *utiliza una mascara: ###,###,###
 */
function fnIntegerMask(object){  
  var cadena = object.value;
  if(cadena.indexOf(",")>0){    
    var val = cadena.split(",");
    var nCadena="";
    for(i=0;i<val.length;i++){
      nCadena += val[i];
    }
    if(nCadena.length > 3){
      var n = (nCadena.length)%3;
      if(n==0) n=3;
      var patron = new Array(n,3,3,3,3,3);
      object.value = mascara(nCadena, ",", patron, true);
    }else{
      object.value = nCadena;
    }
  }else{
    if(cadena.length > 3){
      var n = (cadena.length)%3;
      if(n==0) n=3;
      var patron = new Array(n,3,3,3,3,3);
      object.value = mascara(cadena, ",", patron, true);
    }
  }  
}

/*
 *Función que valida el ingreso de una fecha.
 *utiliza una mascara: ##/##/####
 */
function fnDateMask(object){
  var patron = new Array(2,2,4)
  var cadena = object.value;
  object.value = mascara(cadena, "/", patron, false);
}

/*
 *Función que valida el ingreso de un número decimal.
 *utiliza una mascara: ###,###,###.###
 */
function fnDoubleMask(object){  
  var cadena = object.value;
  var nuevaCadena="";
  var decimalCadena="";
  if(cadena.indexOf(".") > 0){
    nuevaCadena = cadena.substring(0,cadena.indexOf("."))
    decimalCadena = cadena.substring(cadena.indexOf("."),cadena.length)    
    if(nuevaCadena.indexOf(",")>0){
      var val = nuevaCadena.split(",");
      var nCadena="";
      for(i=0;i<val.length;i++){
        nCadena += val[i];
      }
      if(nCadena.length > 3){
        var n = (nCadena.length)%3;
        if(n==0) n=3;
        var patron = new Array(n,3,3,3,3,3);
        object.value = mascara(nCadena, ",", patron, true) + decimalCadena;
      }else{
        object.value = nCadena + decimalCadena;
      }
    }else{
      if(nuevaCadena.length > 3){
        var n = (nuevaCadena.length)%3;
        if(n==0) n=3;
        var patron = new Array(n,3,3,3,3,3);
        object.value = mascara(nuevaCadena, ",", patron, true) + decimalCadena;
      }      
    }     
  }else{
    fnIntegerMask(object);
  }
}

function mascara(val,sep,pat,nums){
  var largo = val.length;
	val = val.split(sep);
  var val2 = "";
  for(r=0;r<val.length;r++){
		val2 += val[r];	
	}
  if(nums){
		for(z=0;z<val2.length;z++){
			if(isNaN(val2.charAt(z))){
				var letra = new RegExp(val2.charAt(z),"g");
				val2 = val2.replace(letra,"");
			}
		}
	}
  val = "";
	var val3 = new Array();
	for(s=0; s<pat.length; s++){
		val3[s] = val2.substring(0,pat[s]);
		val2 = val2.substr(pat[s]);
	}
	for(q=0;q<val3.length; q++){
		if(q ==0){
			val = val3[q];
		}
		else{
			if(val3[q] != ""){
				val += sep + val3[q];
			}
		}
	}
  return val;
}

// Metodo creado por IChavez
// para dar formato decimal luego de ingresar una cantidad en una caja de texto
function fncFormatearNumeros( _id , _nDecimales ){
    if ( document.getElementById( _id ).value == "" )  {
        document.getElementById( _id ).value = "0.00" ;
    }
    
    var amount = document.getElementById( _id ).value ;
    amount = amount.replace(",","");
    document.getElementById( _id ).value = amount;
    document.getElementById( _id ).value = (parseFloat( document.getElementById( _id ).value )).toFixed(_nDecimales);
}

//Calcular tasa de anual a mensual
function fncConvertirTasaAnualMensual( _tasa , _id ) {
    var dTasa = 0 ;
    var dPotencia = 1.0/12 ;
    dPotencia = (parseFloat( dPotencia )).toFixed( 10 ) ;
    dTasa = ((Math.pow( (1+_tasa/100) , dPotencia ))-1)*100 ;
    dTasa = (parseFloat( dTasa )).toFixed( 10 ) ;
    dTasa = (parseFloat( dTasa )).toFixed( 8 ) ;
    _id.value = dTasa ;
    //document.getElementById( _id ).value = dTasa ;
    //return dTasa
}

function formatNumber( obj , decimal ) {
  //decimal  - the number of decimals after the digit from 0 to 3
  //-- Returns the passed number as a string in the xxx,xxx.xx format.
  anynum = eval( obj.value ) ;
  divider = 10;
  switch( decimal ){
    case 0:
      divider = 1   ; break ;
    case 1:
      divider = 10  ; break ; //1 D
    case 2:
      divider = 100 ; break ; //2 D
    case 3:
      divider = 1000 ; break ; //3 D
    case 4:
      divider = 10000 ; break ; //4 D
    case 5:
      divider = 100000 ; break ; //5 D
    default: divider = 1000000 ; //for 6 decimal places
  }
  
  workNum = Math.abs( ( Math.round( anynum * divider )/divider ) ) ;
  workStr = "" + workNum
  
  if ( workStr.indexOf(".") == -1 ){ workStr += "." }
  dStr = workStr.substr( 0 , workStr.indexOf(".") );
  dNum = dStr - 0 ;
  pStr = workStr.substr( workStr.indexOf(".") ) ;
  
  while ( pStr.length - 1 < decimal ){
    pStr+="0"
  }
  if( pStr == '.' )
    pStr ='' ;
  
  //--- Adds a comma in the thousands place.
  if ( dNum >= 1000 ) {
    dLen=dStr.length
    dStr=parseInt(""+(dNum/1000))+","+dStr.substring(dLen-3,dLen)
  }
  
  //-- Adds a comma in the millions place.
  if (dNum>=1000000) {
    dLen=dStr.length
    dStr=parseInt(""+(dNum/1000000))+","+dStr.substring(dLen-7,dLen)
  }
  
  retval = dStr + pStr
  //-- Put numbers in parentheses if negative.
  if (anynum<0) {retval="("+retval+")";}
  
  //You could include a dollar sign in the return value.
  //retval =  "$"+retval
  if(retval.substring(0,3)!="NaN"){
  obj.value = retval;
  }else{
    obj.value = "0.00";
  }
}

function emailExp1(data) {
  return /^[a-zA-Z0-9_\-.]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9]+$/.test(data);
}

//Creado por: Luis Alfredo Murguía Gastelo
//Fecha: 11/12/2008
//Descripción: Valida que el porcentaje ingresado no sea mayor que 100

function validaPorcentajeMenor100( _id, porDef ) {
    var cadena = _id.value ;
    cadNum = eval(cadena);
    if (cadNum>100){
        alert("El porcentaje no puede ser mayor que 100%");
        _id.value = porDef;
        event.returnValue = false;
    }
}

//Creado por: Luis Alfredo Murguía Gastelo
//Fecha: 11/12/2008
//Descripción: Valida que un número ingresado en un campo, sea menor que otro

function validaNumMenor( _idNum, _idOtro){
    var cadenaNum = _idNum.value ;
    cadNum = eval(cadenaNum)
    var cadenaOtro = _idOtro.value ;
    cadOtro = eval(cadenaOtro);
    if (cadNum>cadOtro){
        return false;
    }else{
        return true;
    }
}

//Creado por: Luis Alfredo Murguía Gastelo
//Fecha: 11/12/2008
//Descripción: Valida que un número ingresado en un campo, sea mayor que otro

function validaNumMayor( _idNum, _idOtro){
    var cadenaNum = _idNum.value ;
    cadNum = eval(cadenaNum);
    var cadenaOtro = _idOtro.value ;
    cadOtro = eval(cadenaOtro);
    
    if (cadNum<cadOtro){
        return false;
    }else{
        return true;
    }
}

function fnValidateInteger(textbox) {
    var strValue = textbox.value;
 
    if (strValue != "" && !isInteger(strValue)) {
        alert("Por favor, ingrese sólo números.");            
        textbox.focus();
        textbox.select();
        return false;
    }
 
    return true;
}

function fnValidatePositiveInteger(textbox) {
    var strValue = textbox.value;

    if (strValue != "" && !isPositiveInteger(strValue)) {
        alert("Por favor, ingrese sólo enteros mayores que cero.");            
        textbox.focus();
        textbox.select();
        return false;
    }            
    
    return true;
}

function isInteger(strValue) {
    var re = /(^-?\d\d*$)/;  
    return re.test(strValue);
}

function isPositiveInteger(strValue) {
    var re = /^\d+$/;  
    return re.test(strValue);
}

function isDate(strValue) {
    var re = /^((((0?[1-9]|[12]\d|3[01])[/](0?[13578]|1[02])[/]((1[6-9]|[2-9]\d)?\d{4}))|((0?[1-9]|[12]\d|30)[/](0?[13456789]|1[012])[/]((1[6-9]|[2-9]\d)?\d{4}))|((0?[1-9]|1\d|2[0-8])[/]0?2[/]((1[6-9]|[2-9]\d)?\d{4}))|(29[/]0?2[/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{4}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{4}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{4}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$/;
    return re.test(strValue);
}