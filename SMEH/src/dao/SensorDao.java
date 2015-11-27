package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import bean.Combo;

@Component
public interface SensorDao {
	

	@Select("SELECT codigo, descripcion FROM GRADO_INTERFERENCIA")
	List<Combo> getListAllGradoInterferencia();
	
	@Select("SELECT codigo, descripcion FROM TIPO_SUPERFICIE")
	List<Combo> getListAllTipoSuperficie();
	
	@Select("SELECT codigo, descripcion FROM TIPO_BASE")
	List<Combo> getListAllTipoBase();



}
