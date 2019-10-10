package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.beanAcceso;
import dao.citaImpl;
import dao.loginImpl;
import dao.pacienteImpl;
import dao.pagoImpl;
import factoria.DAOFactory;



public class servletLogin extends javax.servlet.http.HttpServlet implements
javax.servlet.Servlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		DAOFactory objDAOFactory1 = DAOFactory.getDAOFactory("MY_SQL");
		loginImpl objLoginImpl = new loginImpl();
		pacienteImpl objPacienteImpl = objDAOFactory1.getListaPacientes();
		pagoImpl implementaPago =objDAOFactory1.getPago();
		
		
		String usuario=request.getParameter("usuario");
		String password=request.getParameter("password");
		
		System.out.println("user" +usuario);
		System.out.println("password" +usuario);
		
		beanAcceso beanAcceso= objLoginImpl.validaCredenciales(usuario, password);
		
		HttpSession session=request.getSession();
		
		if(beanAcceso == null) {
			
			request.setAttribute("mensaje","Usuario y/o password incorrectos");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
		}else {
			
			List<Object[]> listaPacientesAll = objPacienteImpl.ListarPacienteAll();
			List<Object[]> listaConceptos = implementaPago.ListarConceptosAll();
			
			session.setAttribute("listaPacientesAll", listaPacientesAll);
			session.setAttribute("beanAcceso",beanAcceso);
			session.setAttribute("listaConceptos",listaConceptos);
			
			getServletContext().getRequestDispatcher("/home.jsp").forward(request,response);
			//getServletContext().getRequestDispatcher("/listaPc.jsp").forward(request,response);
		}
		
		
		

		
		
		
	}

}
