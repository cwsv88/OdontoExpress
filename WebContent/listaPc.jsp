<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>

<html>

<script type="text/javascript">
	f.action = 'servletPaciente';
	function fncPress(evt) {
		evt = (evt) ? evt : event
		var charCode = (evt.which) ? evt.which : evt.keyCode
		if (charCode == 13) {
			buscarXnombre();
			return false
		}
		return true
	}

	function buscarXnombre() {
		f = document.forms[0];
		f.action = 'servletPaciente';
		f.method = 'POST'
		f.submit();
	}

	function detallePC(id) {
		f = document.forms[0];
		document.getElementById('idPaciente').value = id
		f.action = 'sDetalle';
		f.method = 'POST';
		f.submit();
	}
</script>





<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" src="js/addPaciente.js"></script>

<title>JSP Page</title>
<%@include file="include.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$(".loader").fadeOut("slow");
	});
</script>


</head>
<body>
	<div class="loader"></div>
	<form>
		<input type="hidden" name="hAccion" value="buscarPaciente" /> <input
			type="hidden" name="page" value="persona" /> <input type="hidden"
			name="idPaciente" id="idPaciente" />
						<tr>
				<td colspan="2" align="center">
					<h3>REGISTRO DE PACIENTES</h3>
				</td>
				
				<td style="width: 74px;" align="center"><a href="home.jsp">
										<img src="images/Home.png" alt="Inicio" />
								</a></td>
				
			</tr>
					
						<tr>
							<td colspan="2"><input type="text" name="varBusqueda"
								style="width: 290px;" onkeypress="fncPress(event)"> <img
								alt="Buscar" src="images/search_f2.png"
								style="height: 22px; width: 25px" onclick="buscarXnombre()">
							</td>
							<td colspan="2" align="center">
								<button dojoType="dijit.form.Button" id="dialog2button"
									iconClass="dijitIcon dijitIconFilter" onclick="addPaciente()">Add
									Paciente</button>
							</td>
						</tr>
						</td>
						<table class="bordered">
							<thead>
								<tr>
									<th>Nombres</th>
									<th>Dirección</th>
									<th>Teléfono</th>
									<th>Celular</th>
									<th>Historia</th>
								</tr>
							</thead>

							<c:forEach var="fila" items="${requestScope.listaPacientes}">
								<tr id="rowID">
									<td align="left">${fila[0]}</td>
									<td align="left">${fila[1]}</td>
									<td align="left">${fila[2]}</td>
									<td align="left">${fila[3]}</td>
									<td align="left">${fila[4]}</td>

								</tr>

							</c:forEach>
							<tr>
								<c:if test="${ not empty requestScope.valorInsert}">
									<td colspan="5" style="color: red;" colspan="3"><b>
											${requestScope.valorInsert} </td>
								</c:if>
							<tr>

							</tr>
					</table>
	</form>
	<%@include file="registroInicial.jsp"%>
</body>
</html>
