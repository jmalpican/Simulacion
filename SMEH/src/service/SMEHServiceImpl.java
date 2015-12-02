package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.Combo;
import bean.Estacion;
import bean.Mapa;
import bean.Metadatos;
import bean.Responsable;
import bean.SubEstacion;
import bean.SubEstacion2;
import bean.SubEstacion3;
import bean.Usuario;
import dao.SMEHDao;

@Service
public class SMEHServiceImpl implements SMEHService{

	@Autowired
	protected SMEHDao smehDao;
	
	@Override
	public Usuario autenticar(Usuario usuario) {
		return smehDao.autenticar(usuario);
	}

	@Override
	public List<Metadatos> getListAll() {
		return smehDao.getListAll();
	}

	@Override
	public List<Responsable> getListAllResponsable() {
		return smehDao.getListAllResponsable();
	}

	@Override
	public List<Combo> getListAllMotivo() {
		return smehDao.getListAllMotivo();
	}

	@Override
	public void actualizarMetadatos(Metadatos metadatos) {
		smehDao.actualizarMetadatos(metadatos);
	}

	@Override
	public void guardarCombo(Combo combo) {
		if (combo.getCodigo() != null) {
			smehDao.actualizarCombo(combo);
		}else{
			smehDao.guardarCombo(combo);
		}
	}

	@Override
	public byte[] descargar(int id) {
		Mapa mapa = smehDao.descargar(id);
		return mapa.getImagen();
	}

	@Override
	public void eliminarCombo(Combo combo) {
		smehDao.eliminarCombo(combo);
	}

	@Override
	public List<Combo> getListAllTablas() {
		return smehDao.getListAllTablas();
	}

	@Override
	public List<Combo> getListAllCombo(Combo combo) {
		return smehDao.getListAllCombo(combo);
	}

	@Override
	public void createTablaCombo(String tabla) {
		smehDao.createTablaCombo(tabla);
	}

	@Override
	public void registrarEstacion(Estacion estacion) {
		// TODO Auto-generated method stub
		smehDao.registrarEstacion(estacion);
	}

	@Override
	public List<Combo> getListAllSituacionLegal() {
		// TODO Auto-generated method stub
		return smehDao.getListAllSituacionLegal();
	}

	@Override
	public List<Combo> getListAllTipoEstacion() {
		// TODO Auto-generated method stub
		return smehDao.getListAllTipoEstacion();
	}

	@Override
	public List<Combo> getListAllPropositoRed() {
		// TODO Auto-generated method stub
		return smehDao.getListAllPropositoRed();
	}

	@Override
	public List<Combo> getListAllClasificacionEstacion() {
		// TODO Auto-generated method stub
		return smehDao.getListAllClasificacionEstacion();
	}

	@Override
	public List<SubEstacion> getListAllSubEstacion1(int codigo) {
		// TODO Auto-generated method stub
		return smehDao.getListAllSubEstacion1(codigo);
	}

	@Override
	public List<SubEstacion2> getListAllSubEstacion2(int codigo) {
		// TODO Auto-generated method stub
		return smehDao.getListAllSubEstacion2(codigo);
	}

	@Override
	public List<SubEstacion3> getListAllSubEstacion3(int codigo) {
		// TODO Auto-generated method stub
		return smehDao.getListAllSubEstacion3(codigo);
	}

	@Override
	public List<Estacion> getListAllEstaciones() {
		return smehDao.getListAllEstaciones();
	}

}
