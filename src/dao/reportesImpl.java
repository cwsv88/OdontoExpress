package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.beanReporteAnual;
import factoria.MySqlDAOFactory;
import interfaz.InterfaceReporte;


public class reportesImpl  implements InterfaceReporte{
	
	public ArrayList listarMontosMensuales() {
		Connection con = MySqlDAOFactory.getConnection();
		ArrayList array =new ArrayList();
		beanReporteAnual bean;
		try {
			Statement st = con.createStatement();
			String sql ="SELECT MONTH(fechapago) Mes, SUM(montopago) total_mes FROM pago GROUP BY Mes order by 1;";
			ResultSet rs =st.executeQuery(sql);
			
		while (rs.next()) {
			bean = new beanReporteAnual();
			
			String mes = rs.getString(1);
			System.out.println("MES DEVUELTO :" + mes);
			switch (mes) {
			case "1":
				System.out.println("JAN");
				mes="JAN";
				break;
			case "2":
				System.out.println("FEB");
				mes="FEB";
				break;
			case "3":
				System.out.println("MAR");
				mes="MAR";
				break;
			case "4":
				System.out.println("APR");
				mes="APR";
				break;
			case "5":
				System.out.println("MAY");
				mes="MAY";
				break;
			case "6":
				System.out.println("JUN");
				mes="JUN";
				break;
			case "7":
				System.out.println("JUL");
				mes="JUL";
				break;
			case "8":
				System.out.println("AUG");
				mes="AUG";
				break;
			case "9":
				System.out.println("SEP");
				mes="SEP";
				break;
			case "10":
				System.out.println("OCT");
				mes="OCT";
				break;
			case "11":
				System.out.println("NOV");
				mes="NOV";
				break;
			case "12":
				System.out.println("DEC");
				mes="DEC";
				break;
			default:
				System.out.println("INVALID MONTH");
			}
			
			bean.setMes(mes);
			bean.setMonto(rs.getDouble(2));
			array.add(bean);			
			
		}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return array;
	}

}
