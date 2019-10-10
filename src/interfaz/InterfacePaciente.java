package interfaz;

import java.util.List;

import bean.beanPc;

public interface InterfacePaciente {
	public List<Object[]> ListarPaciente(String nombre);
	public List<Object[]> getListaCitas(int idPaciente);
	public String insertaPaciente(beanPc pacienteBean);
}
