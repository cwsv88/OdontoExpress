package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import bean.beanPc;
import factoria.MySqlDAOFactory;
import interfaz.InterfacePaciente;

public class pacienteImpl implements InterfacePaciente {

	@Override
	public List<Object[]> ListarPaciente(String nombre) {

		

		Connection con = MySqlDAOFactory.getConnection();
		List<Object[]> list = null;

		try {

			Statement st = con.createStatement();
			String sql = "SELECT upper(concat(p.apellidoP,' ',p.nombre)), p.direccion, p.telefono, p.celular, p.idpaciente "
					+ "FROM paciente p "
					+ "WHERE nombre LIKE  '"+nombre+"' ";
					
			System.out.println("SQL :" + sql);
			ResultSet rs = st.executeQuery(sql);
			list = new ArrayList<Object[]>();

			while (rs.next()) {
				Object[] fila = new Object[6];

				fila[0] = rs.getString(1);
				fila[1] = rs.getString(2);
				fila[2] = rs.getString(3);
				fila[3] = rs.getString(4);
				fila[4] = rs.getString(5);
				

				list.add(fila);

			}
			if (list.isEmpty()) {
				System.out.println("lsta vacia");
				list = null;
			}

		} catch (SQLException e) {
			list = null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
		return list;

		
	
		
	}

	@Override
	public List<Object[]> getListaCitas(int idPaciente) {

		

		Connection con = MySqlDAOFactory.getConnection();
		List<Object[]> list = null;

		try {

			Statement st = con.createStatement();
			String sql = "    SELECT idcita, fechaAtencion, detalleAtencion, costoAtencion, modoPago, paciente_idpaciente, nroBoleta, nroFactura, doctor, p.nombre FROM cita c INNER JOIN paciente p WHERE p.idpaciente=paciente_idpaciente="+idPaciente +";";
			System.out.println("SQL :" + sql);
			ResultSet rs = st.executeQuery(sql);
			list = new ArrayList<Object[]>();

			while (rs.next()) {
				Object[] fila = new Object[10];

				fila[0] = rs.getString(1);
				fila[1] = rs.getString(2);
				fila[2] = rs.getString(3);
				fila[3] = rs.getString(4);
				fila[4] = rs.getString(5);
				fila[5] = rs.getString(6);
				fila[6] = rs.getString(7);
				fila[7] = rs.getString(8);
				fila[8] = rs.getString(9);
				fila[9] = rs.getString(10);

				list.add(fila);
				
				
				
			}
			if (list.isEmpty()) {
				System.out.println("lista vacia");
				list = null;
			}

		} catch (SQLException e) {
			list = null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
		return list;

		
	
		
	}

	public String insertaPaciente(beanPc pacienteBean) {
		System.out.println("Ingresa al SQL");
		String result ="NULL";
		Connection con = MySqlDAOFactory.getConnection();
		try {
			
			System.out.println(" iNGRESA A sql1 :"); 
			Statement st = con.createStatement();			
			 String sql = "INSERT INTO paciente(idpaciente,nombre,apellidoP,Sexo,dni,direccion,estadoCivil,distrito,fechaNac,ocupacion,celular,email) VALUES "
			 		+ " ('" +pacienteBean.getIdPersona()+"','"+ pacienteBean.getNombre()+"','"+pacienteBean.getAppelidoP()+"','"+pacienteBean.getSexo()+"','"+pacienteBean.getDni()+ 
			 		"','"+pacienteBean.getDireccion()+"','"+pacienteBean.getEstadoCivil()+"','"+pacienteBean.getDistrito()+"','"+pacienteBean.getFechaNac()+"','"+pacienteBean.getOcupacion()+
			 		"','"+pacienteBean.getCelular()+"','"+pacienteBean.getEmail()+"' )" ;
			 System.out.println("+++++" + sql);  
			int ctos = st.executeUpdate(sql);
			if (ctos == 0) {
				result = "No se realizó el registro";
				
			}else {
				
				System.out.println(" iNGRESA A sql2 :"); 
				String sql2 ="INSERT INTO  historia (atencionMedica,alergia,sangrado,hospitalizado,detalleHospitalizado,detalleAlergia,detalleSangrado,detalleAtencionMedica,"
						+ "infartoCardico,insuficienciaCardica,tratamientoOncologico,diabetes,coagulacion,epilepsia,presionAlta,"
						+ "artritis,hepatitis,tuberculosis,ets,gastritis,paciente_idpaciente) VALUES ("
						+ " '"+pacienteBean.getAtencion()+"','"+pacienteBean.getAlergia()+"','"+pacienteBean.getSangrado()+"','"+pacienteBean.getHospital()+"','"+pacienteBean.getHospitalizadoDetalle()+"','"+pacienteBean.getAlergiaDetalle()+"','"+pacienteBean.getSangradoDetalle()+"','"+pacienteBean.getAtencionMedicaDetalle()+
						"','"+pacienteBean.getInfarto()+"','"+pacienteBean.getInsuficiencia()+"','"+pacienteBean.getOncologico()+"','"+pacienteBean.getDiabetes()+"','"+pacienteBean.getCoagulacion()+"','"+pacienteBean.getEpilepsia()+"','"+pacienteBean.getPresion()+
						"','"+pacienteBean.getArtritis()+"','"+pacienteBean.getHepatitis()+"','"+pacienteBean.getTuberculosis()+"','"+pacienteBean.getVih()+"','"+pacienteBean.getGastritis()+"','"+pacienteBean.getIdPersona()+"' )";
				System.out.println("+++++" + sql2);
				int ctos2 = st.executeUpdate(sql2);
				if (ctos2 == 0) {
					result = "No se realizó el registro en Historia";
					
				}else {

					result = "Registro de Historia Exitoso";	
				}
			}


		} catch (Exception e) {
			System.out.println("ERROR " +e.getMessage() );
		}
		
		return result;
	}

	public int obtenerIdPaciente() {
		Connection con = MySqlDAOFactory.getConnection();
		int contadorPaciente =0;
		
		try {

			Statement st = con.createStatement();
			String sql = "SELECT count(*) FROM paciente ";
			ResultSet rs = st.executeQuery(sql);

			
			if (rs.next()) {
				contadorPaciente= rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println( "ERROR "+e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
		
		return contadorPaciente;
	}

	public String deletePaciente(String idpacient) {
		System.out.println("Ingresa al deletePacient SQL");
		String result ="NULL";
		Connection con = MySqlDAOFactory.getConnection();
		try {
			
			Statement st = con.createStatement();			
			 String sql = "delete FROM paciente where idpaciente="+idpacient+"";
			 		
			 System.out.println("+++++" + sql);  
			int ctos = st.executeUpdate(sql);
			System.out.println("ctos "+ctos);

		} catch (Exception e) {
			System.out.println("ERROR " +e.getMessage() );
			result = "Error al eliminar el mensaje "+e.getMessage();
		}
		
		return "Se eliminó el registro de forma satisfactoria";
	}

	public List<Object[]> ListarPacienteAll() {

		Connection con = MySqlDAOFactory.getConnection();
		List<Object[]> list = null;

		try {

			Statement st = con.createStatement();
			String sql = "SELECT upper(concat(apellidoP,'  ',nombre )), direccion, telefono, celular, idpaciente, idHistoria FROM paciente;";
			System.out.println("SQL :" + sql);
			ResultSet rs = st.executeQuery(sql);
			list = new ArrayList<Object[]>();

			while (rs.next()) {
				Object[] fila = new Object[6];

				fila[0] = rs.getString(1);
				fila[1] = rs.getString(2);
				fila[2] = rs.getString(3);
				fila[3] = rs.getString(4);
				fila[4] = rs.getString(5);
				fila[5] = rs.getString(6);

				list.add(fila);
				
			

			}
			if (list.isEmpty()) {
				System.out.println("lsta vacia");
				list = null;
			}

		} catch (SQLException e) {
			list = null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
		return list;

		
	
		
	
	}

	public String insertaPacienteInicial(beanPc pacienteBean) {
		System.out.println("Ingresa al SQL");
		String result ="NULL";
		Connection con = MySqlDAOFactory.getConnection();
		try {
			
			System.out.println(" iNGRESA A sql1 :"); 
			Statement st = con.createStatement();			
			 String sql = "INSERT INTO paciente(idpaciente,nombre,apellidoP,Sexo,dni,direccion,estadoCivil,distrito,fechaNac,ocupacion,celular,telefono,email) VALUES "
			 		+ " ('" +pacienteBean.getIdPersona()+"','"+ pacienteBean.getNombre()+"','"+pacienteBean.getAppelidoP()+"','"+pacienteBean.getSexo()+"','"+pacienteBean.getDni()+ 
			 		"','"+pacienteBean.getDireccion()+"','"+pacienteBean.getEstadoCivil()+"','"+pacienteBean.getDistrito()+"','"+pacienteBean.getFechaNac()+"','"+pacienteBean.getOcupacion()+
			 		"','"+pacienteBean.getCelular()+"','"+pacienteBean.getHistoria()+"','"+pacienteBean.getEmail()+"' )" ;
			 System.out.println("+++++" + sql);  
			int ctos = st.executeUpdate(sql);
			if (ctos != 0) {
				result = "Registro exitoso del Paciente";
			}
			} catch (Exception e) {
				System.out.println("ERROR " +e.getMessage() );
				result = "ERROR " +e.getMessage();
			}
			
			return result;
				
		
	}
	

}
