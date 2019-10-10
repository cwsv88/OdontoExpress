  function fncSoloNumeros( _id ){
    var charCode = event.keyCode ;
    var costo    = document.getElementById( _id ).value ;
    
    if( ( ( charCode < 48 ) || ( charCode > 57 ) ) && ( charCode != 46 ) ) {
      alert("Por favor, ingrese sólo números");
      event.returnValue = false;
    }
    
    if( charCode == 46 ){
      if ( costo.indexOf(".") != -1 ){
        alert("No puede ingresar mas de 1 punto decimal");
        event.returnValue = false;
      }
    }
  }

  function fncNoSombreaFila( table_id, row ){
    tbl = document.getElementById( table_id );
    tbl.rows( row ).className = "x1l x4x";
  }
     
  function fncSombreaFila( table_id, row ){
    tbl = document.getElementById(table_id);
    
    for ( var i = 0 ; i < tbl.rows.length ; i++ ) {
      tbl.rows( i ).className = "x1l x4x";
    }
    tbl.rows( row ).className = "x1pr x4x";
  }
  
  /*
   *Abre Ventana
   * 
   ***************************************************************************/
   
   function fncAbrirVentana(alto,ancho,nroform,ventana){
      
    var f= document.forms[nroform];
    window.showModalDialog(ventana,window,"dialogHeight:"+alto+";dialogWidth:"+ancho+";resizable:no;help:no;status:no;scroll:yes");
    
   }
   
   /*
   *Arbol
   * 
   ***************************************************************************/
  
    var imagenDesplegar = "../../images/plus.gif";
    var imagenContraer = "../../images/minus.gif";
    function fncDesplegar(objeto,idFila){
      var estado=objeto.id; //Indica si esta abierto o cerrado
      if (estado=="1"){  //Si estado es Cerrado
        objeto.src=imagenDesplegar;   
        objeto.id="0";
        document.getElementById(idFila).className="clsTdHidden";
      }else if(estado=="0"){ // Si estado es Abierto
        objeto.src=imagenContraer;    
        objeto.id="1";
        document.getElementById(idFila).className="clsTdShow";            
      }
    }
    
    
    function fncSeleccionarFila( table_id, row,inicio,div){

     var divs=document.getElementsByTagName("DIV") ;
     for ( var x = 0 ; x < divs.length ; x++ ) {  
         if(divs[x].id==div){
           var tables=divs[x].getElementsByTagName("TABLE");
           for ( var z = 0 ; z < tables.length ; z++ ) {  
           var _tbl= document.getElementById(tables[z].id);      
           for ( var y = 0 ; y < tables[z].rows.length ; y++ ) {
            if(tables[z].rows(y).id!="idHeader"){
              tables[z].rows( y).className = "x1l x4x";
            }
            }
           }
         }
     }
     // Evaluamos selección de tabla actual
     tbl = document.getElementById(table_id);       
     tbl.rows( row ).className = "x1pr x4x";
  }
 
  /*Funcion agregada el 05/08/2008 por LOT para mostrar/ocultar bloques de informacion*/
  function fncMuestraOcultaBloques( idBloque ){        
       
    if (document.getElementById( idBloque ).className == "clsOcultaFila" ){
        document.getElementById( idBloque ).className = "clsMuestraFila";
       }else{
        document.getElementById( idBloque ).className = "clsOcultaFila" ;
       }                
  }