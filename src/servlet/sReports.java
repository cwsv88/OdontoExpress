package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import dao.citaImpl;
import dao.pacienteImpl;
import dao.reportesImpl;
import factoria.DAOFactory;


public class sReports extends javax.servlet.http.HttpServlet implements
javax.servlet.Servlet {
	

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DAOFactory objDAOFactory = DAOFactory.getDAOFactory("MY_SQL");
		reportesImpl implementaRepo = objDAOFactory.getReportes();
				
		ArrayList arrayMontosMensuales =implementaRepo.listarMontosMensuales();
		
		Gson gson = new Gson();
		String JSON = gson.toJson(arrayMontosMensuales);
		System.out.println(JSON);
		
		System.out.println("LLega al GET");
		PrintWriter out = response.getWriter();
		out.print(JSON);
		
		/**JSONObject json = new JSONObject();
		json.put("year", "2018");
		json.put("valor", "100");
		System.out.println("Salida de Json :"+response.toString());
		out.print(json); **/
		
		
	}
	
}