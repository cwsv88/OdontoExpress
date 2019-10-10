
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<script type="text/javascript">
	function guardarPersona() {
		alert("Ingresa a guardar persona");
		f = document.forms[0];
		//f.method ='POST';
		f.action = 'servleLogin';
		f.submit();
		window.close();
	}

	function obetenComprobante(id) {
		var value = dijit.byId(id).attr("value");
		if (value == 'F') {
			var divID = document.getElementById('DetalleFactura');
			//alert('Div '+ divID );
			//divID.style.display =='block';
			document.getElementById('DetalleFactura').style.display = '';
			document.getElementById('DetalleBoleta').style.display = 'none';
		} else {
			if (value == 'B') {
				document.getElementById('DetalleBoleta').style.display = '';
				document.getElementById('DetalleFactura').style.display = 'none';
			} else {
				document.getElementById('DetalleFactura').style.display = 'none';
				document.getElementById('DetalleBoleta').style.display = 'none';
			}

		}

	}
</script>

<head>
<title>:::Registro de Egresos:::</title>
<%@include file="include.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$(".loader").fadeOut("slow");
	});
</script>

</head>






<body class="claro">
	<div class="loader"></div>
	<form dojoType="dijit.form.Form" method="post" action="servletPaciente"
		id="formPersona">

		<script type="dojo/method" event="onSubmit">
			if(this.validate()) {
				return confirm('Datos correctos!!');
			} else {
				alert('Necesita Ingresar los Campos Obligatorios');
				return false;
			}
			return true;
		</script>






		<input type="hidden" name="hAccion" value="registrarEgr" method="POST">
		<table style="margin: auto" border="0"
			style="border-style:solid;border-color:#C0C0C0">
			<tr>
				<td colspan="5" align="center">
					<h3>REGISTRO DE EGRESOS</h3>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<hr> <b>Datos Generales</b>
					<hr>
				</td>



			</tr>
			<tr>
				<td style="width: 186px;">Fecha de Pago</td>
				<td><input dojoType="dijit.form.DateTextBox" name="nacimiento"
					required="True" size="30" maxlength="50" /></td>
				<td style="width: 58px;"></td>

				<td>Concepto</td>
				<td><select dojoType="dijit.form.FilteringSelect"
					name="concepto">
						<option value="C">Doctor</option>
						<option value="S">Limpieza</option>
						<option value="V">Materiales</option>
						<option value="D">Servicios</option>
						<option value="Z">Otros</option>
				</select></td>




			</tr>
			<tr>
				<td>Monto S/.</td>
				<td><input dojoType="dijit.form.NumberTextBox" name="celular"
					required="True" size="12" maxlength="12" /></td>
				<td style="width: 110px;"></td>
				<td>Tipo Comprobante</td>
				<td><select dojoType="dijit.form.FilteringSelect"
					onchange="javascritp:obetenComprobante(this.id);"
					name="estadoCivil">
						<option value="N">N/A</option>
						<option value="B">Boleta</option>
						<option value="F">Factura</option>
						<option value="R">Recibos x Honorario</option>

				</select></td>

			</tr>

			<tr>
				<td>Forma de pago</td>
				<td><select dojoType="dijit.form.FilteringSelect"
					name="iddistrito">
						<option value="E">Efectivo</option>
						<option value="Tx">Transferencia</option>
						<option value="PT">Pago con Tarjeta</option>

				</select></td>

				<td style="width: 110px;"></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td rowspan="2">De<c:if
						test="${ not empty requestScope.valorInsert}">
						<td colspan="9" style="color: red;" colspan="3"><b>
								${requestScope.valorInsert} </b></td>
					</c:if>talle
				</td>
				<td colspan="4" rowspan="2"><textarea rows="4" cols="30"
						dojoType="dijit.form.SimpleTextarea" name="detalle" id="iddetalle"></textarea>
			<tr>
			</tr>
			</td>
			</tr>

		</table>

		
		<div id="DetalleFactura" style="display: none">
			<table>
				<tr>
					<td colspan="3">
						<hr> <b>Detalle de Factura</b>
						<hr>
					</td>
				</tr>

				<tr>
					<td style="width: 186px;">Fecha de Emision</td>
					<td><input dojoType="dijit.form.DateTextBox" name="emision"
						required="True" size="30" maxlength="50" /></td>

				</tr>
				<tr>
					<td>Fecha de Vencimiento</td>
					<td><input dojoType="dijit.form.DateTextBox"
						name="vencimiento" required="True" size="30" maxlength="50" /></td>
				</tr>
				<tr>
					<td>Serie o Código</td>
					<td><input dojoType="dijit.form.ValidationTextBox"
						name="serie" required="True" /></td>
				</tr>
				<tr>
					<td>N° Comprobante</td>
					<td><input dojoType="dijit.form.ValidationTextBox"
						name="comprobante" required="True" /></td>
				</tr>
				<tr>
					<td>Razón Social</td>
					<td><input dojoType="dijit.form.ValidationTextBox"
						name="razon" required="True" style="width: 389px;" /></td>
				</tr>
				<tr>
					<td>RUC</td>
					<td><input dojoType="dijit.form.ValidationTextBox"
						name="ruc" required="True" /></td>
				</tr>

			</table>
		</div>



<div id="DetalleBoleta" style="display: none">
			<table >
				<tr>
					<td colspan="3">
						<hr> <b>Detalle de Boleta</b>
						<hr>
					</td>
				</tr>
				<tr>
					<td style="width: 186px;">Fecha de Vencimiento</td>
					<td><input dojoType="dijit.form.DateTextBox" name="vencimiento"
						required="True" size="30" maxlength="50" /></td>

				</tr>
				<tr>
					<td>Serie o Código</td>
					<td><input dojoType="dijit.form.ValidationTextBox"
						name="serieb" required="True" /></td>
				</tr>
				<tr>
					<td>N° Comprobante</td>
					<td><input dojoType="dijit.form.ValidationTextBox"
						name="comprobanteb" required="True" /></td>
				</tr>
				<tr>
					<td>Razón Social</td>
					<td><input dojoType="dijit.form.ValidationTextBox"
						name="razonb" required="True" style="width: 389px;" /></td>
				</tr>
				<tr>
					<td>RUC</td>
					<td><input dojoType="dijit.form.ValidationTextBox"
						name="rucb" required="True" /></td>
				</tr>


			</table>

		</div>


<div>
<table >
<tr>
<td > 
<br>
</td>
</tr>
<tr>
				<td colspan="5" align="center"><input type="submit"
					value="Guardar" label="Guardar" id="Guardar"
					dojoType="dijit.form.Button" iconClass="dijitIcon dijitIconSave" />
					<a href="<%=request.getContextPath()%>/home.jsp">
					<button type="type" dojoType="dijit.form.Button"
						iconClass="dijitIcon dijitIconDelete" style="width: 99px"  
						   >Atras</button></a>

				</td>
			</tr>
</table>
</div>




	</form>
</body>
</html>
