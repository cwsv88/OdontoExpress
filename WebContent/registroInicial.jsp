<div align="center" dojoType="dijit.Dialog" id="divRegistroInicial"
	title="Registro Inicial del Paciente">

	<form name="formRegInicial" id="formRegInicial">
		<input type="hidden" name="hAccion" id="hAccion" />
		<div class="dijitDialogPaneContentArea"></div>

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
					missingMessage="Oops!! Campos Requeridos!" size="30" maxlength="50" /></td>
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
				<td><input dojoType="dijit.form.DateTextBox" name="nacimiento"
					required="True" size="30" maxlength="50" placeholder="dd/mm/aaaa"/></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>

			</tr>
			<tr>
				<td></td>
				<td></td>
				<td style="width: 110px;"></td>
				<td>Ocupación</td>
				<td><input dojoType="dijit.form.ValidationTextBox"
					name="ocupacion" required="True" size="30" maxlength="50" /></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>

			</tr>
			<tr>
				<td>DNI</td>
				<td><input dojoType="dijit.form.ValidationTextBox" name="dni"
					required="True" size="30" maxlength="50" /></td>
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
				<td>Historia</td>
				<td><input dojoType="dijit.form.ValidationTextBox"
					name="historia" required="True" size="08" maxlength="12" /></td>
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
				<td><select dojoType="dijit.form.FilteringSelect" name="sexo">
						<option value="M">Masculino</option>
						<option value="F">Femenino</option>
						<select /></select></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>

			</tr>
			<tr>
										<td colspan="9" align="center">
							<button type="type" dojoType="dijit.form.Button"
								iconClass="dijitIcon dijitIconSave" style="width: 99px"
								onclick="javascript:btnAceptar_onclick();">Guardar</button>

							<button type="type" dojoType="dijit.form.Button"
								iconClass="dijitIcon dijitIconDelete" style="width: 99px"
								onclick="javascript:btnCancelar_onclick();">Cancelar</button>


						</td>
			</tr>
	</form>

</div>