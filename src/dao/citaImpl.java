package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import bean.beanCita;
import factoria.MySqlDAOFactory;
import interfaz.InterfaceCita;

public class citaImpl implements InterfaceCita{

	@Override
	public String insertaCita(beanCita citaBean) {
		String result = null;
		Connection con = MySqlDAOFactory.getConnection();
		try {
			Statement st = con.createStatement();			
			 String sql = "insert into cita(paciente_idpaciente,celular,doctor,fechaAtencion,horaCita,duracion,detalleAtencion,consultorio)  " +
			 		" VALUES (" +citaBean.getIdPaciente()+ ",'"+citaBean.getCelularPc()+"', '"+citaBean.getDoctor()+"','"+citaBean.getFechaAtencion()+"','"+citaBean.getHoraCita()+"', "+citaBean.getDuracion()+" ,'"+citaBean.getDetalleCita()+"', "+citaBean.getConsultorio()+")";
			 System.out.println("SQL: "+sql);
			int ctos = st.executeUpdate(sql);
			if (ctos != 0) {
				result = "Se ingresó la Cita correctamente";
				
				
			}

		} catch (SQLException e) {
			result = e.getMessage();
			System.out.println("ERROR: " + e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				result = e.getMessage();
				System.out.println("ERROR2: " + e.getMessage());
			}
		}
		
		return result;

	}

	public List<Object[]> ListarRTPSemanal() {
		Connection con = MySqlDAOFactory.getConnection();
		List<Object[]> list = null;

		try {

			Statement st = con.createStatement();
			String sql = "SELECT case when DAYNAME(fechaAtencion)='Monday' then \"Lunes\" when DAYNAME(fechaAtencion)='Tuesday' then \"Martes\" when DAYNAME(fechaAtencion)='Wednesday' then \"Miercoles\" when DAYNAME(fechaAtencion)='Thursday' then \"Jueves\" when DAYNAME(fechaAtencion)='Friday' then \"Viernes\" when DAYNAME(fechaAtencion)='Saturday' then \"Sabado\" when DAYNAME(fechaAtencion)='Sunday' then \"Domingo\" end ,horaCita, concat(p.nombre,' ',p.apellidoP,' ',p.apellidoM) as nombres ,c.celular, c.doctor, c.detalleAtencion FROM cita c, paciente p WHERE  YEARWEEK(`fechaAtencion`, 1) = YEARWEEK(CURDATE(), 1) and c.paciente_idpaciente=p.idpaciente order by c.fechaAtencion;";
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

	public List<Object[]> ListaxDia(String fechacita, String doctorcita) {
		Connection con = MySqlDAOFactory.getConnection();
		List<Object[]> list = null;

		try {

			Statement st = con.createStatement();
			String sql = "select fechaAtencion ,horaCita,duracion, concat(p.nombre,' ',p.apellidoP,' ',p.apellidoM) as nombres ,c.celular, c.doctor, c.detalleAtencion FROM cita c, paciente p WHERE fechaAtencion='"+fechacita+"'  and c.paciente_idpaciente=p.idpaciente and c.doctor='"+doctorcita+"' order by 2 asc;";
			System.out.println("SQL :" + sql);
			ResultSet rs = st.executeQuery(sql);
			list = new ArrayList<Object[]>();

			while (rs.next()) {
				Object[] fila = new Object[7];
			
				fila[0] = rs.getString(1);
				fila[1] = rs.getString(2);
				fila[2] = rs.getString(3);
				fila[3] = rs.getString(4);
				fila[4] = rs.getString(5);
				fila[5] = rs.getString(6);
				fila[6] = rs.getString(7);

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
		
		String hora="T17:30:00";
		
		/**for (int i=0; i<list.size(); i++){
			Object[] row = (Object[]) list.get(i);
			
				if(row[1].equals(hora)) {
					System.out.println("************* encuentra :" +row[1]);
					break;
				} 
				
			
			System.out.println("Element "+i+Arrays.toString(row));
			}**/
		
		return list;
	}

}
