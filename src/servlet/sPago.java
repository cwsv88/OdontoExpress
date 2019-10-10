package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.beanPago;
import bean.beanPc;
import dao.citaImpl;
import dao.pacienteImpl;
import dao.pagoImpl;
import factoria.DAOFactory;

public class sPago extends javax.servlet.http.HttpServlet implements
javax.servlet.Servlet {
	
	

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DAOFactory objDAOFactory = DAOFactory.getDAOFactory("MY_SQL");
		pagoImpl implementaPago =objDAOFactory.getPago();
		
		
		String idTransaccion = "nulo";
		
		System.out.println("Llega al servlet de pago");
		int idpaciente = Integer.parseInt(request.getParameter("pcpago"));
		String doctor = request.getParameter("doctor");
		String monto = request.getParameter("monto");
		String tipoPago = request.getParameter("tipoPago");
		idTransaccion = request.getParameter("idTransaccion");
		
		System.out.println(" id trx "+idTransaccion);
		if (idTransaccion.equalsIgnoreCase("nulo")) {
			System.out.println("Entra al IF");
			idTransaccion = "NA";}
		String fechapago = request.getParameter("fechaPago");
		String comprobante = request.getParameter("comprobante");
		String nroComprobante = request.getParameter("nroComprobante");
		String tratamientos = request.getParameter("trata");
		
		System.out.println("ID de transaccion xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " +idTransaccion);
		System.out.println("FECHA xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " +fechapago);
		
		beanPago beanpago = new beanPago();
		beanpago.setDoctor(doctor);
		beanpago.setMonto( Double.valueOf(monto));
		beanpago.setTipopago(tipoPago);
		beanpago.setIdTrx(idTransaccion);
		beanpago.setComprobante(comprobante);
		beanpago.setNcomprobante(nroComprobante);
		beanpago.setIdpaciente(idpaciente);
		beanpago.setFechapago(fechapago);
		
		System.out.println("Termina de setear el bean");

		String msgInsertPago = implementaPago.insertaPago(beanpago, tratamientos);
		if (msgInsertPago != null) {
			request.setAttribute("msgInsertPago",msgInsertPago);
			System.out.println("Ingresa IF");
			System.out.println("Resultado :"+msgInsertPago);			
			getServletContext().getRequestDispatcher("/registroPago.jsp").forward(request,response);

		}
		else {
			System.out.println("Ingresa ELSE");
			request.setAttribute("msgInsertPago",msgInsertPago);
			getServletContext().getRequestDispatcher("/registroPago.jsp").forward(request,response);
			
			
			
		}
			
		
		
		
		
		
		
				
						
	}
	
}