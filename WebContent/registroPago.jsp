
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>:::Registro de Pago:::</title>


<%@include file="include.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$(".loader").fadeOut("slow");
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
	
		$("button").click(function() {
			var tratamientos = [];
			$.each($(".chosen-select-no-results option:selected"), function() {
				tratamientos.push($(this).val());
			});
			
			f = document.forms[0];
			f.trata.value = tratamientos;
			//alert("trata :" +trata)
			f.action ='sPago';
			f.method='post'
		    f.submit();
			
			alert("Envio al servlet - " + tratamientos);
		});
		
		
		  $("Guardar").click(function() {
            alert("Hello, world!");
          });
		
	});
	
	function guardar() {
		
		
		var tratamientos = [];
			$.each($(".chosen-select-no-results option:selected"), function() {
				tratamientos.push($(this).val());
			});
			
			f = document.forms[0];
			f.trata.value = tratamientos;
			f.action ='sPago';
			f.method='post'
		    f.submit();
			
			
		
		
	}
	
	
</script>

<link rel="stylesheet" href="docsupport/prism.css" type="text/css" />
<link rel="stylesheet" href="css/chosen.css" type="text/css" />


<script src="docsupport/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="docsupport/prism.js" type="text/javascript" charset="utf-8"></script>

</head>






<body class="claro">
	<div class="loader"></div>
	<form dojoType="dijit.form.Form" method="post" action="sPago"
		id="formPago">
		
		<input type="hidden" name="trata">

		<script type="dojo/method" event="onSubmit">
			if(this.validate()) {
				return confirm('Datos correctos!!');
			} else {
				alert('Necesita Ingresar los Campos Obligatorios');
				return false;
			}
			return true;
		</script>

		<table align="center">
			<tr>
				<td colspan="5" align="center">
					<h3>REGISTRO DE INGRESOS</h3>
				</td>
				
			</tr>

			<tr>
				<td colspan="5">
					<hr> <b></b>
					<hr>
				</td>



			</tr>
			<tr>
				<td style="width: 186px;">Paciente</td>
				<td>
					<select dojoType="dijit.form.FilteringSelect" id="idpcpago" name="pcpago" required="True" placeholder="Paciente">
								<option value="0"></option>
								<c:forEach var="item" items="${sessionScope.listaPacientesAll}">
									<option value="${item[4]}">${item[0]} - ${item[4]} </option>
								</c:forEach>
						</select>
				</td>
				<td></td>

				<td>Doctor</td>
				<td><select dojoType="dijit.form.FilteringSelect" id="iddoctor"
					name="doctor" placeholder="Doctor">
						<option value="0"></option>
						<option value="Monica Malpartida">Monica Malpartida</option>
						<option value="Erika luna">Erika luna</option>
						<option value="Ana Quinteros">Ana Quinteros</option>
						<option value="Carlos Ramos">Carlos Ramos</option>
						<option value="Junior Ortiz">Junior Ortiz</option>
						<option value="Karen Hidalgo">Karen Hidalgo</option>
						<option value="German Maravi">German Maravi</option>
						<option value="Carlos Urbina">Carlos Urbina</option>

				</select></td>




			</tr>
			<tr>
				<td>Monto S./</td>
				<td><input dojoType="dijit.form.NumberTextBox" name="monto" placeholder="00,00"
					required="True" size="12" maxlength="12" /></td>
				<td></td>
				<td>Fecha Pago</td>
				<td> <input dojoType="dijit.form.DateTextBox" name="fechaPago"
					required="True" /></td>





			</tr>
			<tr>
				<td>Tipo de Pago</td>
				<td><select dojoType="dijit.form.FilteringSelect"
					name="tipoPago">
						<option value="E">Efectivo</option>
						<option value="V">Visa</option>
						<option value="M">Mastercard</option>
						
				</select></td>
				<td ></td>
				<td>ID Transacción</td>
				<td><input dojoType="dijit.form.NumberTextBox"
					name="idTransaccion" required="false" size="12" maxlength="12" /></td>





			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>




			</tr>
			<tr>
				<td>Comprobante</td>
				<td><select dojoType="dijit.form.FilteringSelect"
					name="comprobante">
						<option value="B">Boleta</option>
						<option value="F">Factura</option>
						<option value="NV">Nota de Venta</option>
						<option value="NA">Ninguno</option>
				</select></td>
				<td></td>
				<td>N° de Comprobante</td>
				<td><input dojoType="dijit.form.TextBox"
					name="nroComprobante" required="True" size="12" maxlength="12" /></td>
			</tr>
			<tr>
				<td colspan="5">

					<hr> <b>Tratamientos realizados</b>
					<hr> <b></b>
				</td>

			</tr>

			<tr>
				<td></td>
				<td></td>

				<td style="width: 110px;"></td>
				<td></td>
				<td></td>

			</tr>
			<tr>
				<td></td>
				<td></td>
				<td style="width: 110px;"></td>
				<td colspan="1"></td>
				<td></td>

			</tr>

			<td><input type="hidden" name="hAccion" value="registrarPc"
				method="POST">

				<table>
					<tr>

						<div>
							<select id="multiple" name="tratamientos"
								data-placeholder="Tratamientos" multiple
								class="chosen-select-no-results" tabindex="11">
								<option value=""></option>
								
								<c:forEach var="item" items="${sessionScope.listaConceptos}">
									<option value="${item[1]}">${item[1]} </option>
								</c:forEach>
								
							</select>
							
						</div>

						<script src="docsupport/init.js" type="text/javascript"
							charset="utf-8"></script>

					</tr>

				</table>
				<tr>
				<td colspan="5"style="color: red;">

					<hr> <b><c:if test="${ not empty requestScope.msgInsertPago}"> ${requestScope.msgInsertPago} </c:if> </b>
					<hr> <b></b>
					
				</td>

			</tr>
				
			<tr>
				
				<td colspan="5" align="center"><input type="button"
					value="Guardar" label="Guardar" id="Guardar" name="Guardar"
					dojoType="dijit.form.Button" iconClass="dijitIcon dijitIconSave" onclick="guardar();" />
					<a href="<%=request.getContextPath()%>/home.jsp">
					<button type="type" dojoType="dijit.form.Button"
						iconClass="dijitIcon dijitIconDelete" style="width: 99px"  
						   >Atras</button></a>
					
					
			   </td>

			</tr>
		</table>
	</form>
</body>
</html>
</html>