package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.beanPc;
import dao.pacienteImpl;
import factoria.DAOFactory;

public class servletPaciente extends javax.servlet.http.HttpServlet implements
javax.servlet.Servlet {
	
	

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		DAOFactory objDAOFactory = DAOFactory.getDAOFactory("MY_SQL");
		pacienteImpl objPacienteImpl = objDAOFactory.getListaPacientes();
		
		HttpSession session = request.getSession();
		String action = (String) request.getParameter("hAccion");
		
		
		
		if (action.equalsIgnoreCase("buscarPaciente")) {
			System.out.println("Ingresa al IF :");
			String nombre = request.getParameter("varBusqueda");
			System.out.println("nombre: "+nombre);
			List<Object[]> listaPacientes = objPacienteImpl.ListarPaciente(nombre);
			request.setAttribute("listaPacientes", listaPacientes);
			session.setAttribute("listaPacientes", listaPacientes);
			getServletContext().getRequestDispatcher("/listaPc.jsp").forward(request, response);
		}
		if(action.equalsIgnoreCase("registrarPc")) {
			System.out.println("Ingresa al registro de paciente");
			
			String nombres = request.getParameter("nombres");
			String Apep = request.getParameter("apellidopat");
			//String Apem = request.getParameter("apellidomat");
			String dni = request.getParameter("dni");
			String direccion = request.getParameter("direccion");
			String distrito = request.getParameter("distrito");
			String es = request.getParameter("estadoCivil");
			char   estadoCivil = es.charAt(0);
			String nacimiento = request.getParameter("nacimiento");
			String ocupacion = request.getParameter("ocupacion");
			String celular = request.getParameter("celular");
			String historia = request.getParameter("historia");
			String mail = request.getParameter("email");
			String sex = request.getParameter("sexo");
			char  sexo= sex.charAt(0);

			
			String hospital = request.getParameter("hospital");
			String hospitalizadoDetalle = request.getParameter("hospitalizadoDetalle");
			String atencion = request.getParameter("atencion");
			String atencionMedicaDetalle = request.getParameter("atencionMedicaDetalle");
			String alergia = request.getParameter("alergia");
			String alergiaDetalle = request.getParameter("alergiaDetalle");
			String sangrado = request.getParameter("sangrado");
			String sangradoDetalle = request.getParameter("sangradoDetalle");
			
			String infarto = request.getParameter("infarto");
			String coagulacion = request.getParameter("coagulacion");
			String hepatitis = request.getParameter("hepatitis");
			String insuficiencia = request.getParameter("insuficiencia");
			String epilepsia = request.getParameter("epilepsia");
			String tuberculosis = request.getParameter("tuberculosis");
			String oncologico = request.getParameter("oncologico");
			String presion = request.getParameter("presion");
			String vih = request.getParameter("vih");
			String diabetes = request.getParameter("diabetes");
			String artritis = request.getParameter("artritis");
			String gastritis = request.getParameter("gastritis");
			
			String medicamento = request.getParameter("medicamento");
			String embarazo = request.getParameter("embarazo");
			String desmayo = request.getParameter("desmayo");
			String lactar = request.getParameter("lactar");
			
			int idpaciente = objPacienteImpl.obtenerIdPaciente() +1;
			
			System.out.println("ID paciente :"+idpaciente);
			beanPc pacienteBean = new beanPc();
			pacienteBean.setNombre(nombres);
			pacienteBean.setAppelidoP(Apep);
			
			pacienteBean.setDni(dni);
			pacienteBean.setDireccion(direccion);
			pacienteBean.setDistrito(distrito);
			pacienteBean.setEstadoCivil(estadoCivil);
			pacienteBean.setFechaNac(nacimiento);
			pacienteBean.setOcupacion(ocupacion);
			pacienteBean.setCelular(celular);
			pacienteBean.setHistoria(historia);
			pacienteBean.setEmail(mail);
			pacienteBean.setSexo(sexo);

			//---------------------------
			pacienteBean.setHospital(hospital);
			pacienteBean.setHospitalizadoDetalle(hospitalizadoDetalle);
			pacienteBean.setAtencion(atencion);
			pacienteBean.setAtencionMedicaDetalle(atencionMedicaDetalle);
			pacienteBean.setAlergia(alergia);
			pacienteBean.setAlergiaDetalle(alergiaDetalle);
			pacienteBean.setSangrado(sangrado);
			pacienteBean.setSangradoDetalle(sangradoDetalle);
			//---------------------------
			pacienteBean.setInfarto(infarto);
			pacienteBean.setCoagulacion(coagulacion);
			pacienteBean.setHepatitis(hepatitis);
			pacienteBean.setInsuficiencia(insuficiencia);
			pacienteBean.setEpilepsia(epilepsia);
			pacienteBean.setTuberculosis(tuberculosis);
			pacienteBean.setOncologico(oncologico);
			pacienteBean.setPresion(presion);
			pacienteBean.setVih(vih);
			pacienteBean.setDiabetes(diabetes);
			pacienteBean.setArtritis(artritis);
			pacienteBean.setGastritis(gastritis);
			//---------------------------
			pacienteBean.setMedicamento(medicamento);
			pacienteBean.setEmbarazo(embarazo);
			pacienteBean.setDesmayo(desmayo);
			pacienteBean.setLactar(lactar);
			
			pacienteBean.setIdPersona(idpaciente);
			//pacienteBean.setIdHistoria(idpaciente);
			
			String valorInsert = objPacienteImpl.insertaPaciente(pacienteBean);
			System.out.println("valor de insercion :"+valorInsert );
			request.setAttribute("valorInsert", valorInsert);
			getServletContext().getRequestDispatcher("/registroPc.jsp").forward(request, response);
				
				
			
			
		}if(action.equalsIgnoreCase("deletePersona")) {
			
			System.out.println("ingresa a delete Persona: "+action);
			String idPaciente = request.getParameter("idPaciente"); 
			String deletePaciente = objPacienteImpl.deletePaciente(idPaciente);
			request.setAttribute("successDelete", deletePaciente);
			getServletContext().getRequestDispatcher("/listaPc.jsp").forward(request, response);
		}
		
		if(action.equalsIgnoreCase("ingresoRapido")) {
			System.out.println("Ingresa a ingresoRapido " +action);
			
			String nombres = request.getParameter("nombres");
			String Apep = request.getParameter("apellidopat");
			//String Apem = request.getParameter("apellidomat");
			String dni = request.getParameter("dni");
			String direccion = request.getParameter("direccion");
			String distrito = request.getParameter("distrito");
			String es = request.getParameter("estadoCivil");
			char   estadoCivil = es.charAt(0);
			String nacimiento = request.getParameter("nacimiento");
			String ocupacion = request.getParameter("ocupacion");
			String celular = request.getParameter("celular");
			String historia = request.getParameter("historia");
			String mail = request.getParameter("email");
			String sex = request.getParameter("sexo");
			char  sexo= sex.charAt(0);
			
			//----
			beanPc pacienteBean = new beanPc();
			pacienteBean.setNombre(nombres);
			pacienteBean.setAppelidoP(Apep);
			//pacienteBean.setApellidoM(Apem);
			pacienteBean.setDni(dni);
			pacienteBean.setDireccion(direccion);
			pacienteBean.setDistrito(distrito);
			pacienteBean.setEstadoCivil(estadoCivil);
			pacienteBean.setFechaNac(nacimiento);
			pacienteBean.setOcupacion(ocupacion);
			pacienteBean.setCelular(celular);
			pacienteBean.setHistoria(historia);
			pacienteBean.setEmail(mail);
			pacienteBean.setSexo(sexo);
			
			String valorInsert = objPacienteImpl.insertaPacienteInicial(pacienteBean);
			request.setAttribute("valorInsert", valorInsert);
			getServletContext().getRequestDispatcher("/listaPc.jsp")
					.forward(request, response);
			
			
			
		}
		
		
		
	}

}
