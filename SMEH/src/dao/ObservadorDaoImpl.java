package dao;

import bean.Observador;
import bean.Usuario;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface ObservadorDaoImpl {// implements SMEHDao {

    // TODO listar observador cuando edites una estacion
	@Select("SELECT nombre, dni, celular, fijo, direccion, referencia, mail, fecha_ingreso as fechaIngreso, grado_instruccion as gradoInstruccion FROM OBSERVADOR WHERE estacion_id = '${estacionId}'")
	public Observador getAllByEstacionId(Integer estacionId);

}
