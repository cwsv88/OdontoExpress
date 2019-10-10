/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package factoria;

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
public abstract class DAOFactory {
    public static final String basededatos="MY_SQL";
    
    
    public static DAOFactory getDAOFactory(String motor){
		if(motor==basededatos){
                    return new MySqlDAOFactory() ;
		}
		return null;
	}

    public abstract pacienteImpl getListaPacientes();
	public abstract loginImpl validaCredenciales(String User, String password) ;
	public abstract pacienteImpl ListarPaciente(String nombre);
	public abstract pacienteImpl getListaCitas() ;
	public abstract pacienteImpl getListaCitas(int idPaciente) ;
	public abstract pacienteImpl insertaPaciente(beanPc pacienteBean);
	
	public abstract citaImpl getCita();
	public abstract pagoImpl getPago() ;
	
	public abstract reportesImpl getReportes();


	

	
}
