package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.beanAcceso;
import factoria.MySqlDAOFactory;
import interfaz.InterfaceLogin;


public class loginImpl implements InterfaceLogin{

	public beanAcceso validaCredenciales(String usuario, String password) {
		

		Connection con=MySqlDAOFactory.getConnection();
		beanAcceso bean=null;
		try {

			Statement st=con.createStatement();
			String sql="SELECT * FROM acceso  where idauser='"+usuario+"' AND password='"+password+"'";
			ResultSet rs=st.executeQuery(sql);
			if(rs.next()){
				bean=new beanAcceso();
				bean.setIdUsuario(rs.getString(1));
				bean.setPassword(rs.getString(2));

			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}

}
