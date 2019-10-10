package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.pacienteImpl;
import factoria.DAOFactory;

public class sDetalle  extends javax.servlet.http.HttpServlet implements
javax.servlet.Servlet{

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		DAOFactory objDAOFactory = DAOFactory.getDAOFactory("MY_SQL");
		pacienteImpl objPacienteImpl = objDAOFactory.getListaPacientes();
		
		String idPc = (String) request.getParameter("idPaciente");
		int idPaciente = Integer.parseInt(idPc);
		
		HttpSession session = request.getSession();
		//List<Object[]> listaPacientes = objPacienteImpl.ListarPaciente(nombre);
		List<Object[]> listaCitasxPaciente = objPacienteImpl.getListaCitas(idPaciente);
		request.setAttribute("listaCitas", listaCitasxPaciente);
		session.setAttribute("listaCitas", listaCitasxPaciente);
		getServletContext().getRequestDispatcher("/detallePC.jsp").forward(request, response);
		
		
		
		
		
	}
}
