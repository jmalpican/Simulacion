package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.Combo;
import bean.Metadatos;
import bean.Responsable;
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
		smehDao.guardarCombo(combo);
	}

}
