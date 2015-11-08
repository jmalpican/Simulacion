package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SMEHDao;

import bean.Usuario;

@Service
public class SMEHServiceImpl implements SMEHService{

	@Autowired
	private SMEHDao smehDao;
	
	@Override
	public Usuario autenticar(Usuario usuario) {
		return smehDao.autenticar(usuario);
	}

}
