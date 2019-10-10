
<div align="center" dojoType="dijit.Dialog" id="divCitaPC"
	title="Generar Cita" >

	<form name="formcita" id="formcita">
		<div class="dijitDialogPaneContentArea">
			
				<input id="__ACTION" name="__ACTION" type="HIDDEN" />
				<input id="__ARGUMENT" name="__ARGUMENT" type="HIDDEN" />
				<input id="idPacienteCita" name="idPacienteCita" type="HIDDEN" />


				<table align="center">
					<tr>


					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Paciente</td>
						<td><select dojoType="dijit.form.FilteringSelect" id="idpccita" name="pccita" required="True" placeholder="Paciente">
								<option value="0"></option>
								<c:forEach var="item" items="${sessionScope.listaPacientesAll}">
									<option value="${item[4]}">${item[0]}</option>
								</c:forEach>
						</select></td>
						
					</tr>
					<tr>
						<td>Fecha</td>
						<td colspan="5"><input dojoType="dijit.form.DateTextBox"
							id="fechaCita" placeholder="dd/mm/aaaa" required="True"
							name="fechaCita" style="width: 97px;" /> &nbsp &nbsp &nbsp Hora
							<input dojoType="dijit.form.TimeTextBox" id="horacita"
							placeholder="hh:mm" required="True" name="horacita"
							style="width: 59px;" />
						</td>
						<td>
							&nbsp &nbsp &nbsp Duracion <input dojoType="dijit.form.NumberTextBox" name="duracion"
							id="duracion" placeholder="minutos" required="True" maxlength="4" style="width: 59px;"  />
						</td>


					</tr>
					<tr>
						<td>Celular</td>
						<td><input dojoType="dijit.form.NumberTextBox" name="celular"
							id="celular" placeholder="999999999"
							required="True" maxlength="12" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Doctor(a)</td>
						<td><select dojoType="dijit.form.FilteringSelect"
							id="iddoctor" name="doctor" placeholder="Doctor">
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
						<td></td>
						<td></td>
						<td colspan="3"> Cosultorio <select dojoType="dijit.form.FilteringSelect"
							id="idconsultorio" name="consultorio" placeholder="Consultorio">
								<option value="0"></option>
								<option value="1">Uno</option>
								<option value="2">Dos</option>
								<option value="3">Tres</option>
													</select> </td>
						
						
						
					</tr>
					<tr>
						<td rowspan="2">Detalle</td>
						<td colspan="6" rowspan="2"><textarea rows="4" cols="30"
								dojoType="dijit.form.SimpleTextarea" name="detalle"  id="iddetalle" ></textarea>

						</td>
						</tr>
						<tr>
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



				</table>
				</div>

				</form>
				</div>