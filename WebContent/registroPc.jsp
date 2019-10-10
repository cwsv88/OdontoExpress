
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


</script>

<head>
<title>:::Inserta Paciente:::</title>
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

		<table align="center">
			<tr>
				<td colspan="3" align="center">
					<h3>Registro de Pacientes</h3>
				</td>
			</tr>
			<tr>
				
				
				<td><input type="hidden" name="hAccion" value="registrarPc" method="POST">
					<table style="margin: auto" border="0"
						style="border-style:solid;border-color:#C0C0C0">
						<tr>
							<td colspan="9">
								<hr> <b>Datos Generales</b>
								<hr>
							</td>



						</tr>
						<tr>
							<td style="width: 186px;">Nombres</td>
							<td><input dojoType="dijit.form.ValidationTextBox"
								name="nombres" required="True"
								missingMessage="Oops!! Campos Requeridos!" size="30"
								maxlength="50" /></td>
							<td style="width: 41px;"></td>

							<td>Estado Civil</td>
							<td><select dojoType="dijit.form.FilteringSelect"
								onchange="javascritp:obetenEstadoCivil(this.id);"
								name="estadoCivil">
									<option value="C">Casado</option>
									<option value="S">Soltero</option>
									<option value="V">Viudo</option>
									<option value="D">Divorciado</option>
									<option value="Z">Conviviente</option>
							</select></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Apellido Paterno</td>
							<td><input dojoType="dijit.form.ValidationTextBox"
								name="apellidopat" required="True" size="30" maxlength="50" /></td>
							<td style="width: 110px;"></td>
							<td>Fec. Nacimiento</td>
							<td><input dojoType="dijit.form.DateTextBox"
								name="nacimiento" required="True" size="30" maxlength="50" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td>Apellido Materno</td>
							<td><input dojoType="dijit.form.ValidationTextBox"
								name="apellidomat" required="True" size="30" maxlength="50" /></td>
							<td style="width: 110px;"></td>
							<td>Ocupación</td>
							<td> <input dojoType="dijit.form.ValidationTextBox"
								name="ocupacion" required="True" size="30" maxlength="50" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td>DNI</td>
							<td><input dojoType="dijit.form.ValidationTextBox"
								name="dni" required="True" size="30" maxlength="50" /></td>
							<td style="width: 110px;"></td>
							<td>Celular</td>
							<td><input dojoType="dijit.form.NumberTextBox" name="celular"
								required="True" size="12" maxlength="12" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Dirección</td>
							<td><input dojoType="dijit.form.TextBox" name="direccion"
								required="True" size="30" maxlength="50" /></td>
							<td style="width: 110px;"></td>
							<td>Teléfono</td>
							<td><input dojoType="dijit.form.ValidationTextBox"
								name="telefono" required="True" size="08" maxlength="12" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>


						</tr>
						<tr>
							<td>Distrito</td>
							<td><select dojoType="dijit.form.FilteringSelect"
								name="iddistrito">
									<option value="1">Comas</option>
									<option value="2">Carabayllo</option>
									<option value="3">Los Olivos</option>
									<option value="4">San Luis</option>
									<option value="5">San Martin de Porres</option>
									<option value="6">San Juan de Lurigancho</option>
									<option value="7">Condevilla</option>
									<option value="8">San Borja</option>
									<option value="9">Santiago de Surco</option>
									<option value="10">Independencia</option>
							</select></td>

							<td style="width: 110px;"></td>
							<td>Email</td>
							<td><input dojoType="dijit.form.TextBox" name="email"
								required="True" size="30" maxlength="50" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>



						</tr>
						<tr>
							<td></td>
							<td></td>
							<td style="width: 110px;"></td>
							<td colspan="1">Sexo</td>
							<td><select dojoType="dijit.form.FilteringSelect"
								name="sexo">
									<option value="M">Masculino</option>
									<option value="F">Femenino</option>
									<select /></select></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>





						</tr>

						<tr>





						</tr>
						<tr>



						</tr>

						<tr>




						</tr>


						<tr>
							<td colspan="5">

								<hr> <b>Antecedentes del estado general</b>
								<hr>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td></td>
							<td align="center">Si No</td>
							<td colspan="3" align="left">Detalle</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>Hospitalizado en los dos últimos años?</td>

							<td align="center">
							<input dojoType="dijit.form.RadioButton" name="hospital" size="05" maxlength="50" value="S"  /> 
							<input dojoType="dijit.form.RadioButton" name="hospital" size="05" maxlength="50" value="N" /></td>
							<td colspan="3">
							<input dojoType="dijit.form.ValidationTextBox" name="hospitalizadoDetalle" 	required="false" size="30" maxlength="50" style="width: 402px;" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td>Antención médica en los dos últimos años?</td>
							<td align="center"><input dojoType="dijit.form.RadioButton"
								name="atencion" size="05" maxlength="50" value="S" /> <input
								dojoType="dijit.form.RadioButton" name="atencion" size="05"
								maxlength="50" value="N" /></td>
							<td colspan="3"><input
								dojoType="dijit.form.ValidationTextBox" name="atencionMedicaDetalle"
								required="false" size="30" maxlength="50" style="width: 402px;" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>


						</tr>
						<tr>
							<td>Alérgico a algún medicamento o comida</td>
							<td align="center"><input dojoType="dijit.form.RadioButton"
								name="alergia" size="05" maxlength="50" value="S" /> <input
								dojoType="dijit.form.RadioButton" name="alergia" size="05"
								maxlength="50" value="N" /></td>
							<td colspan="3"><input
								dojoType="dijit.form.ValidationTextBox" name="alergiaDetalle"
								required="false" size="30" maxlength="50" style="width: 402px;" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>


						</tr>
						<tr>
							<td>Sangrado bajo tratamiento?</td>
							<td align="center"><input dojoType="dijit.form.RadioButton"
								name="sangrado" size="05" maxlength="50" value="S" /> <input
								dojoType="dijit.form.RadioButton" name="sangrado" size="05"
								maxlength="50" value="N" /></td>
							<td colspan="3"><input
								dojoType="dijit.form.ValidationTextBox" name="sangradoDetalle"
								required="false" size="30" maxlength="50" style="width: 402px;" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr>
							<td colspan="5">
								<hr>
							</td>
						</tr>
						<tr>
							<td colspan="2">Ha tenido alguna de estas enfermedades?</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td><input dojoType="dijit.form.CheckBox" name="infarto"
								size="05" maxlength="50" value="S" />Infarto Cárdico</td>
							<td><input dojoType="dijit.form.CheckBox" name="coagulacion"
								size="05" maxlength="50" value="S" />Coagulación Alterada</td>
							<td></td>
							<td><input dojoType="dijit.form.CheckBox" name="hepatitis"
								size="05" maxlength="50" value="S" />Hepatitis</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><input dojoType="dijit.form.CheckBox" name="insuficiencia"
								size="05" maxlength="50" value="S"/>Insuficiencia Cárdica</td>
							<td><input dojoType="dijit.form.CheckBox" name="epilepsia"
								size="05" maxlength="50" value="S"/>Epilepsia</td>
							<td></td>
							<td><input dojoType="dijit.form.CheckBox" name="tuberculosis"
								size="05" maxlength="50" value="S"/>Tuberculosis</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><input dojoType="dijit.form.CheckBox" name="oncologico"
								size="05" maxlength="50" value="S" />Tratamiento Oncológico</td>
							<td><input dojoType="dijit.form.CheckBox" name="presion"
								size="05" maxlength="50" value="S" />Presión Alta</td>
							<td></td>
							<td><input dojoType="dijit.form.CheckBox" name="vih"
								size="05" maxlength="50" value="S" />VIH/ETS</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><input dojoType="dijit.form.CheckBox" name="diabetes"
								size="05" maxlength="50" value="S" />Diabetes</td>
							<td><input dojoType="dijit.form.CheckBox" name="artritis"
								size="05" maxlength="50" value="S" />Artritis</td>
							<td></td>
							<td><input dojoType="dijit.form.CheckBox" name="gastritis"
								size="05" maxlength="50" value="S" />Gastritis</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td colspan="5">
								<hr>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Toma algún medicamento?</td>
							<td align="center"><input dojoType="dijit.form.RadioButton"
								name="medicamento" size="05" maxlength="50" value="S" /> <input
								dojoType="dijit.form.RadioButton" name="medicamento" size="05"
								maxlength="50" value="N" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Está embarazada?</td>
							<td align="center"><input dojoType="dijit.form.RadioButton"
								name="embarazo" size="05" maxlength="50" value="S" /> <input
								dojoType="dijit.form.RadioButton" name="embarazo" size="05"
								maxlength="50" value="N" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Sufre de convulsiones o desmayos?</td>
							<td align="center"><input dojoType="dijit.form.RadioButton"
								name="desmayo" size="05" maxlength="50" value="S" /> <input
								dojoType="dijit.form.RadioButton" name="desmayo" size="05"
								maxlength="50" value="N" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Está dando de lactar?</td>
							<td align="center"><input dojoType="dijit.form.RadioButton"
								name="lactar" size="05" maxlength="50" value="S" /> <input
								dojoType="dijit.form.RadioButton" name="lactar" size="05"
								maxlength="50" value="N" /></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							
							<c:if test="${ not empty requestScope.valorInsert}">
									<td colspan="9" style="color: red;" colspan="3"><b>
											${requestScope.valorInsert} </td>
								</c:if>
							
							
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>

						<tr>
							<td colspan="5" align="center"><input type="submit"
								value="Guardar" label="Guardar" id="Guardar"
								dojoType="dijit.form.Button" iconClass="dijitIcon dijitIconSave" />
								<a
								href="<%=request.getContextPath()%>/servletPersona?hAccion=listarPersonas&page=persona"><button
										type="type" dojoType="dijit.form.Button"
										iconClass="dijitIcon dijitIconDelete" style="width: 99px">Cancelar</button></a>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
						<tr>
								
							<tr>
						</tr>

					</table>
		</table>
	</form>
</body>
</html>
