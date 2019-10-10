<%@ page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	List<String> horasxdia = (List) request.getAttribute("horasxDia");
%>
<%
	List<Object> ListDia = (List) request.getAttribute("listaxDia");
%>

<html>


<head>
<title>:::Gestion de Citas:::</title>
<%@include file="include.jsp"%>
<script language="javascript" src="js/cita.js"></script>
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

	<form dojoType="dijit.form.Form" method="post" action="servletCita"
		id="formCita">
		<input id="__ACTION" name="__ACTION" type="HIDDEN" value="rptSemanal" />

		<script type="dojo/method" event="onSubmit">
			if(!this.validate()) {
				alert('Necesita Ingresar los Campos Obligatorios');
				return false;
			}
			return true;
		</script>


		<table align="center">
			
			<tr>


				<td><input type="hidden" name="hAccion" value="registrarPc"
					method="POST">
					<table style="margin: auto" border="0"
						style="border-style:solid;border-color:#C0C0C0">
						
						<tr>
				<td colspan="8" align="center">
					<h3>GESTION DE CITAS</h3>
				</td>
				<td style="width: 74px;" align="center"><a href="home.jsp">
										<img src="images/Home.png" alt="Inicio" />
								</a></td>
			</tr>
						
						<tr>
							<td colspan="9">
								<hr> <b>Ver disponibilidad</b>
								<hr>
							</td>



						</tr>
						<tr>
							<td style="width: 186px;">Fecha de Cita</td>
							<td><input dojoType="dijit.form.DateTextBox"
								name="fechacita" required="false" size="30" maxlength="50" /></td>
							<td style="width: 41px;"></td>

							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Doctor</td>
							<td><select dojoType="dijit.form.FilteringSelect"
								name="doctor">
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
							<td style="width: 110px;"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td></td>
							<td><input dojoType="dijit.form.CheckBox" name="rptsemanal"
								size="05" maxlength="50" /> Esta semana</td>
							<td style="width: 110px;"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td style="width: 110px;"><input type="submit"
								value="Buscar Cita" label="Buscar" id="Buscar"
								dojoType="dijit.form.Button"
								iconClass="dijitIcon dijitIconSearch" /></td>
							<td></td>
							<td> <button dojoType="dijit.form.Button" id="dialog2button"
						iconClass="dijitIcon dijitIconFilter" onclick="addCita()">Ingresar Cita</button>  </td>
							
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>

						</tr>

						<tr>
							<c:if test="${ not empty requestScope.msgInsertCita}">
								<td colspan="9" style="color: red;"><b>
										${requestScope.msgInsertCita} </b></td>
							</c:if>
							
							
						</tr>
						<tr>
					</table>
		</table>

		<c:if test="${ not empty requestScope.listaRTPSemanal}">
			<div id="dBuscarSemana">
				
				<table class="bordered">
					<thead>
						<tr>
							<th>Dïa</th>
							<th>Hora</th>
							<th>Paciente</th>
							<th>Celular</th>
							<th>Doctor</th>
							<th>Detalle</th>
						</tr>
					</thead>

					<tr>
						<c:forEach var="fila" items="${requestScope.listaRTPSemanal}">
							<tr id="rowID">
								<td align="left">${fila[0]}</td>
								<td align="left">${fila[1]}</td>
								<td align="center">${fila[2]}</td>
								<td align="left">${fila[3]}</td>
								<td align="left">${fila[4]}</td>
								<td align="left">${fila[5]}</td>
							</tr>
						</c:forEach>
					</tr>
				</table>
			</div>
		</c:if>

		<c:if test="${ not empty requestScope.listaxDia}">
			<div id="dBuscarDia">
				<table class="bordered">

					<thead>
						<tr>
							<th>Dïa</th>
							<th>Hora</th>
							<th>Duración</th>
							<th>Paciente</th>
							<th>Celular</th>
							<th>Doctor</th>
							<th>Detalle</th>
						</tr>
					</thead>
				<% int identificador =-1;
				 for (int i=0; i<horasxdia.size();i++){ 
						
				 for (int j=0; j<ListDia.size();j++){
					 Object[] row = (Object[]) ListDia.get(j);
						if(row[1].equals(horasxdia.get(i))){ %>
									<tr id="rowID">
												<td align="left"><%= row[0]%></td>
												<td align="left"><%= row[1]%></td>
												<td align="left"><%= row[2]%></td>
												<td align="left"><%= row[3]%></td>
												<td align="left"><%= row[4]%></td>
												<td align="left"><%= row[5]%></td>
												<td align="left"><%= row[6]%></td>
									</tr>
									
									<%identificador = i; %>
									<%break; 
						}	
				}
				 if( identificador !=i) {%>
					
					<tr id="rowID2">
													<td align="left"><%= request.getAttribute("fechacita") %>  </td>
													<td align="left"><%= horasxdia.get(i)%></td>
													<td align="left"></td>
													<td align="left"></td>
													<td align="left"></td>
													<td align="left"></td>
													<td align="left"></td>
												</tr>
				<%}
				 
		
		} %>


				</table>
			</div>
		</c:if>
	</form>

	<%@include file="citaPc.jsp"%>

</body>
</html>
