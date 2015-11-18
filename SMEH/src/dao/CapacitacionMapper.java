package dao;

import bean.Capacitacion;
import bean.Observador;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import java.util.List;

/**
 * Created by manueltejeda on 11/18/15.
 */
public interface CapacitacionMapper {

    @Insert("INSERT INTO capacitacion(id, nombre, duracion, lugar,"
            + "certificado, organizador, observacion) VALUES"
            + "(#{id}, #{nombre}, #{duracion}, #{lugar}, #{certificado}, "
            + "#{organizador},#{observacion})")
    @SelectKey(
            keyProperty = "id",
            before = true,
            resultType = Integer.class,
            statement = { "SELECT capacitacion_seq.nextval AS id FROM dual" })
    void insertarCapacitacion(Capacitacion capacitacion);


    @Select("SELECT id, nombre, certificado, fecha, duracion  FROM capacitacion WHERE observador_id=#{id}")
    List<Capacitacion> getCapacitacionPorObservador(int id);

    @Select("SELECT id, nombre, certicado, fecha, duracion FROM capacitacion WHERE id=#{id}")
    Capacitacion getCapacitacionPorId(int id);
}
