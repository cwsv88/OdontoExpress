<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-with, initial-scale=1.0">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" href="css/morris.css" />
<script src="js/morris.min.js" charset="utf-8"></script>

<script type="text/javascript">
    function onload(){
    	$.ajax({
    		url: "${pageContext.request.contextPath}/sReports",
    		type: "GET",
    		dataType: "JSON",
    		success: function (data){
    			
    			Morris.Bar({
    				  element: 'bar-example',
    				  data: data,
    				  xkey: 'mes',
    				  ykeys: ['monto'],
    				  labels: ['Ingresos']
    				});
    			
    		}
    		
    	});
    	
    }
    
</script>

<title>Insert title here</title>
</head>
<body onload="onload()">
	<div class="container">
	<h1>Reporte Anual OdontoExpress</h1>
	<hr>
	<div class="row">
		<div class="col-md-6"> <h2>Grafica de Barra</h2> <hr> 
			<div id="bar-example" style="height: 250px;"></div>
		</div>
		
      		
	</div>
	
	</div>

<script src="js/lineas.js" charset="utf-8"></script>

</body>
</html>