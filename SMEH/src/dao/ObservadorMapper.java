package dao;

import bean.Estacion;
import bean.Observador;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * Created by manueltejeda on 11/18/15.
 */
public interface ObservadorMapper {

    @Insert("INSERT INTO observador(id, nombre, dni, celular,"
            + "fijo, direccion, referencia, mail, estacion_id) VALUES"
            + "(#{id}, #{nombre}, #{dni}, #{celular}, #{fijo}, #{direccion},"
            + "#{referencia}, #{mail}, #{estacionId})")
    @SelectKey(
            keyProperty = "id",
            before = true,
            resultType = Integer.class,
            statement = { "SELECT observador_seq.nextval AS id FROM dual" })
    void registrarObservador(Observador observador);

    @Update("UPDATE observador SET nombre=#{nombre}, dni=#{dni}, celular=#{celular},"
            + "fijo=#{fijo}, direccion=#{direccion}, referencia=#{referencia}, mail=#{mail}"
            + "WHERE id=#{id}")
    void actualizarObservador(Observador observador);

    @Select("SELECT id, nombre, dni, fecha_ingreso as fechaIngreso FROM observador")
    List<Observador> getAll();

    @Select("SELECT id, nombre, dni, celular, fijo, direccion, referencia, mail, fecha_ingreso as fechaIngreso FROM observador WHERE id=#{id}")
    Observador getObservadorPorId(int id);

    @Select("SELECT id, nombre, dni, celular, fijo, direccion, referencia, mail, fecha_ingreso as fechaIngreso,"+
            "grado_instruccion as gradoInstruccion, otra_ocupacion as otraOcupacion FROM observador WHERE estacion_id=#{id}")
    List<Observador> getObservadoresPorEstacionId(int id);
}
