package dao;

import java.util.Date;
import java.util.List;

import bean.Estacion;
import bean.Sensor;
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


	@Insert("INSERT INTO Mnt_instrumento(ID, SENSOR, FINSTAL, INSTALPOR, " +
			" INSTALEMP, INSTALAREARESP, DISTANCIA, ALTBASE, MATERIAL, NOTAS, " +
			" ESQUEMA, GRADINTERF, TSUPERF, TIPOBASE) VALUES"
			+ "(#{id}, #{sensor}, #{fInstal}, #{instalpor}," +
			"#{instalemp} ,#{instalarearesp}, #{distancia}, #{altbase}," +
			"#{material}, #{notas}, #{esquema},#{gradinterf},#{tsuperfbajosensor},#{tipobase}" +
			")")
	@SelectKey(
			keyProperty = "id",
			before = true,
			resultType = Integer.class,
			statement = { "SELECT mntinstrumento_seq.nextval AS id FROM dual" })
	void registrarSensor(Sensor sensor);

}
