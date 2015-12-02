package service;

import java.util.List;

import bean.Combo;
import bean.Estacion;
import bean.Metadatos;
import bean.Responsable;
import bean.SubEstacion;
import bean.SubEstacion2;
import bean.SubEstacion3;
import bean.Usuario;

public interface SMEHService {

	Usuario autenticar(Usuario usuario);

	List<Metadatos> getListAll();

	List<Responsable> getListAllResponsable();

	List<Combo> getListAllMotivo();

	void actualizarMetadatos(Metadatos metadatos);

	void guardarCombo(Combo combo);

	byte[] descargar(int parseInt);

	void eliminarCombo(Combo combo);

	List<Combo> getListAllTablas();

	List<Combo> getListAllCombo(Combo combo);

	void createTablaCombo(String valorParam);

void registrarEstacion(Estacion estacion);
	List<Combo> getListAllSituacionLegal();
	List<Combo> getListAllTipoEstacion();
	List<Combo> getListAllPropositoRed();
	List<Combo> getListAllClasificacionEstacion();
	List<SubEstacion>  getListAllSubEstacion1(int codigo);
	List<SubEstacion2> getListAllSubEstacion2(int codigo);
	List<SubEstacion3> getListAllSubEstacion3(int codigo);
	List<Estacion> getListAllEstaciones();
}
