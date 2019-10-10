package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.beanPago;
import factoria.MySqlDAOFactory;
import interfaz.InterfaceCita;
import interfaz.InterfacePago;

public class pagoImpl implements InterfacePago {

	@Override
	public String insertaPago(beanPago pagoBean , String tratamientos) {
		int idpago = obtenerIdPaciente() +1;
		String result = null;
		System.out.println("fECHA ANTES DEL INSERT : "+pagoBean.getFechapago());
		Connection con = MySqlDAOFactory.getConnection();
		try {
			Statement st = con.createStatement();			
			 String sql = "insert into pago (idpago,montopago,tipopago,fechapago,paciente_idpaciente,doctor,idTransaccion,comprobante,nrocomprobante)  " +
			 		" VALUES (" +idpago+ ","+pagoBean.getMonto()+", '"+pagoBean.getTipopago()+"','" +pagoBean.getFechapago()+"',"+pagoBean.getIdpaciente()+", '"+pagoBean.getDoctor()+"' ,'"+pagoBean.getIdTrx()+"', '"+pagoBean.getComprobante()+"','"+pagoBean.getNcomprobante()+"')";
			 System.out.println("SQL: "+sql);
			int ctos = st.executeUpdate(sql);
			if (ctos != 0) {
				result = "Se ingresó el pago correctamente";
				insertTratamientos(tratamientos,idpago);
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



	public int obtenerIdPaciente() {
		Connection con = MySqlDAOFactory.getConnection();
		int contadorPago = 0;

		try {

			Statement st = con.createStatement();
			String sql = "SELECT count(*) FROM pago ";
			ResultSet rs = st.executeQuery(sql);

			if (rs.next()) {
				contadorPago = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("ERROR " + e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}

		return contadorPago;
	}


public void insertTratamientos(String tra, int idpago) {
	
	String[] ArrTrata = tra.split(",");
	String Tratamiento = null;
	
	for(int i=0; i < ArrTrata.length; i++ ) {
		
		Tratamiento = ArrTrata[i];
		System.out.println("Tratamiento :"+Tratamiento);
		
		Connection con = MySqlDAOFactory.getConnection();
		try {
			
			Statement st = con.createStatement();
			 String sql = "insert into tratamiento (tratamiento,pago_idpago)  " +
			 		" VALUES ('"+Tratamiento+"'," +idpago+ ")";
			 System.out.println("SQL: "+sql);
			int ctos = st.executeUpdate(sql);
			if (ctos != 0) {
				System.out.println("Se ingresó la Cita correctamente " +Tratamiento);
				
			}

		} catch (SQLException e) {
			
			System.out.println("ERROR: " + e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				
				System.out.println("ERROR2: " + e.getMessage());
			}
		}
	}
		
	
	
	
	
	
	
	
}



public List<Object[]> ListarConceptosAll() {

	Connection con = MySqlDAOFactory.getConnection();
	List<Object[]> list = null;

	try {

		Statement st = con.createStatement();
		String sql = "SELECT * FROM concepto";
		System.out.println("SQL :" + sql);
		ResultSet rs = st.executeQuery(sql);
		list = new ArrayList<Object[]>();

		while (rs.next()) {
			Object[] fila = new Object[2];

			fila[0] = rs.getString(1);
			fila[1] = rs.getString(2);

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
}
