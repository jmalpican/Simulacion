package service;

import java.util.List;

import bean.Combo;
import bean.Metadatos;
import bean.Responsable;
import bean.Usuario;

public interface SMEHService {

	Usuario autenticar(Usuario usuario);

	List<Metadatos> getListAll();

	List<Responsable> getListAllResponsable();

	List<Combo> getListAllMotivo();

	void actualizarMetadatos(Metadatos metadatos);

	void guardarCombo(Combo combo);

}
