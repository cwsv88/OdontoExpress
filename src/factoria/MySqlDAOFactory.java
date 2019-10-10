/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package factoria;

//import LDP.DAO.cursoMySql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import bean.beanCita;
import bean.beanPc;
import dao.citaImpl;
import dao.loginImpl;
import dao.pacienteImpl;
import dao.pagoImpl;
import dao.reportesImpl;


/**
 * 
 * @author CARLOS
 */
public class MySqlDAOFactory extends DAOFactory {

	private static String DRIVER = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/odontoexpress";
	//private static String URL = "jdbc:mysql://181.67.50.26:3306/odontoex_bd";
	private static String USER = "root";
	private static String PASSWORD = "root";

	public static Connection getConnection() {
		try {
			Class.forName(DRIVER);
			return DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public loginImpl validaCredenciales(String User, String password) {
		// TODO Auto-generated method stub
		return new loginImpl();
	}


	@Override
	public pacienteImpl getListaPacientes() {
		// TODO Auto-generated method stub
		return new pacienteImpl();
	}

	@Override
	public pacienteImpl ListarPaciente(String nombre) {
		// TODO Auto-generated method stub
		return new pacienteImpl();
	}

	@Override
	public pacienteImpl getListaCitas(int idPaciente) {
		// TODO Auto-generated method stub
		return new pacienteImpl();
	}

	@Override
	public pacienteImpl getListaCitas() {
		// TODO Auto-generated method stub
		return new pacienteImpl();
	}

	@Override
	public pacienteImpl insertaPaciente(beanPc pacienteBean) {
		// TODO Auto-generated method stub
		return new pacienteImpl();
	}

	@Override
	public citaImpl getCita() {
		// TODO Auto-generated method stub
		return new citaImpl();
	}

	@Override
	public pagoImpl getPago() {
		// TODO Auto-generated method stub
		return new pagoImpl();
	}

	@Override
	public reportesImpl getReportes() {
		// TODO Auto-generated method stub
		return new reportesImpl();
	}





}
