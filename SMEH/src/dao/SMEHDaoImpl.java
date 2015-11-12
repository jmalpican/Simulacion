package dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import bean.Usuario;

@Repository
public interface SMEHDaoImpl {// implements SMEHDao {

	@Select("Select UYC_USUARIO as usuario, UYC_CLAVE as clave from Login where UYC_USUARIO = '${usuario}' and UYC_CLAVE = '${clave}'")
	public Usuario autenticar(Usuario usuario);

}
