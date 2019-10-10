package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.beanCita;
import dao.citaImpl;
import dao.pacienteImpl;
import factoria.DAOFactory;

public class servletCita extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public servletCita() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		DAOFactory objDAOFactory = DAOFactory.getDAOFactory("MY_SQL");
		citaImpl implementaCita = objDAOFactory.getCita();
		pacienteImpl objPacienteImpl = objDAOFactory.getListaPacientes();
		
		
		String ACTION = req.getParameter("__ACTION");
		
		
		
		
		HttpSession session=req.getSession();
		
		
		
		if (ACTION.equalsIgnoreCase("guardaCita")) {
			System.out.println("Entra al IF");
			String ARGUMENT = req.getParameter("__ARGUMENT");
			System.out.println("Argumentos "+ARGUMENT);
			String[] arrResult = ARGUMENT.split("\\t");
			String txtid = arrResult[0];
			int intid = Integer.parseInt(txtid);
			System.out.println("IntId" + intid);
			String txtFecha = arrResult[1];
			String txtHora = arrResult[2];
			String txtCelular = arrResult[3];
			String txtDoctor = arrResult[4];
			
			int txtConsultorio = Integer.parseInt(arrResult[5]);
			int txtDuracion = Integer.parseInt(arrResult[6]);
			String txtObs = arrResult[7];
			
			
			beanCita citabean = new beanCita();
			citabean.setIdPaciente(intid);
			citabean.setFechaAtencion(txtFecha);
			citabean.setHoraCita(txtHora);
			citabean.setCelularPc(txtCelular);
			citabean.setDoctor(txtDoctor);
			citabean.setConsultorio(txtConsultorio);
			citabean.setDuracion(txtDuracion);
			citabean.setDetalleCita(txtObs);
			
			
			String msgInsertCita = implementaCita.insertaCita(citabean);
			req.setAttribute("msgInsertCita", msgInsertCita);
			getServletContext().getRequestDispatcher("/buscarCita.jsp")
					.forward(req, res);
			
		}
		
			if (ACTION.equalsIgnoreCase("rptSemanal")){
			System.out.println("Ingresa a reporte semanal");
			String fechacita = req.getParameter("fechacita");
			String doctorcita = req.getParameter("doctor");
			String rptsemana = req.getParameter("rptsemanal");
			
			System.out.println("rptsemana" +rptsemana);
			System.out.println("doctorcita " +doctorcita);
			System.out.println("fechacita" +fechacita);
			
			//List<Object[]> listaPacientesAll = objPacienteImpl.ListarPacienteAll();
			
			if(rptsemana != null ) {

			List<Object[]> listaRTPSemanal = implementaCita.ListarRTPSemanal();
			
			

			
			req.setAttribute("listaRTPSemanal", listaRTPSemanal);
			
			
			getServletContext().getRequestDispatcher("/buscarCita.jsp")
					.forward(req, res);
			}else {
				
				List<Object[]> listaxDia = implementaCita.ListaxDia(fechacita, doctorcita);
				
				
				List<String> horasxDia = Arrays.asList("T09:00:00","T09:15:00","T09:30:00","T10:00:00","T10:15:00","T10:30:00","T11:00:00","T11:15:00","T11:30:00","T12:00:00","T12:15:00","T12:30:00","T13:00:00","T13:15:00","T13:30:00","T15:00:00","T15:15:00","T15:30:00","T16:00:00","T16:15:00","T16:30:00","T17:00:00","T17:15:00","T17:30:00","T18:00:00","T18:15:00","T18:30:00","T19:00:00","T19:15:00","T19:30:00","T20:00:00","T20:15:00","T20:30:00","T21:00:00","T21:15:00","T21:30:00","T22:00:00");
							
				req.setAttribute("fechacita", fechacita);
				req.setAttribute("horasxDia", horasxDia);
				req.setAttribute("listaxDia", listaxDia);
				
				getServletContext().getRequestDispatcher("/buscarCita.jsp")
				.forward(req, res);
			}
			
			
			
		}
		
	}
}