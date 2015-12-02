package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import bean.Combo;
import bean.Estacion;
import bean.Metadatos;
import bean.Observador;
import bean.Responsable;
import bean.SubEstacion;
import bean.SubEstacion2;
import bean.SubEstacion3;
import bean.Usuario;

@Component
public interface SMEHDao {
	
	@Select("Select UYC_USUARIO as usuario, UYC_CLAVE as clave from Login where UYC_USUARIO = #{usuario}  and UYC_CLAVE = #{clave}")
	Usuario autenticar(Usuario usuario);

	@Select("select m.id_metadatos as idMetadatos, m.RDM_FECHA as fecha, m.RDM_AUTORIZAC as autorizado,m.id_motivo as idMotivo, mo.descripcion as motivo, m.RDM_RESP as idResp, r.nombre || ' ' || r.apellidos as nombreCompleto from METADATOS m left join responsable r on m.RDM_RESP = r.id_Resp left join motivo mo on m.id_motivo = mo.codigo")
	List<Metadatos> getListAll();
	
	@Select("SELECT ID_RESP as idResp, nombre, apellidos as apellido FROM RESPONSABLE")
	List<Responsable> getListAllResponsable();

	@Select("SELECT codigo, descripcion FROM motivo")
	List<Combo> getListAllMotivo();

	@Update("UPDATE METADATOS SET RDM_RESP=#{idResp}, ID_MOTIVO=#{idMotivo} WHERE id_metadatos = #{idMetadatos}")
	void actualizarMetadatos(Metadatos metadatos);

	@Insert("INSERT INTO ${tabla} (descripcion ) VALUES (#{descripcion} )")
	void guardarCombo(Combo combo);

	
	
	@Insert("INSERT INTO Estacion(ID, NOMBRE, ALIAS, COD_SENAMHI, " +
	 		" COD_OMM,COD_OTRO,COD_CLASESTAC,COD_SUB1ESTAC,COD_SUB2ESTAC,COD_SUB3ESTAC, " +
	 		" TIPO_ESTAC,ESTAC_MIXTA,FEC_INI,AUTORIZA_INI,FEC_FIN,AUTORIZA_FIN,PROPIEDAD,SITUACION_LEGAL,NOMBRE_RED,PROPOSITO_RED) VALUES"
	            + "(#{id}, #{nombre}, #{alias}, #{codSenamhi}," +
	            "#{codOmn},#{codOtro},#{clasificacion},#{sub1estacion},#{sub2estacion},#{sub3estacion}," +
	            "#{tipoEstacion},#{estacionMixt},#{fInicio},#{autorizacionIni},#{fCierre},#{autorizacionCierre}," +
	            "#{propiedad},#{situacionLegal},#{nombreRed},#{propositoEstacionRed}" +
	            ")")
	 

    @SelectKey(
            keyProperty = "id",
            before = true,
            resultType = Integer.class,
            statement = { "SELECT estacion_seq.nextval AS id FROM dual" })
    void registrarEstacion(Estacion estacion);
    
    
	@Select("SELECT codigo, descripcion FROM SITUACION_LEGAL")
	List<Combo> getListAllSituacionLegal();

	@Select("SELECT codigo, descripcion FROM TIPO_ESTACION")
	List<Combo> getListAllTipoEstacion();
	
	@Select("SELECT codigo, descripcion FROM PROPOSITO_RED")
	List<Combo> getListAllPropositoRed();
	
	
	@Select("SELECT codigo, descripcion FROM CLASIFICACION_ESTACION")
	List<Combo> getListAllClasificacionEstacion();

	@Select("SELECT CODIGO_SUB, descripcion FROM SUB_ESTACION1 where CODIGO = #{codigo}")
	List<SubEstacion> getListAllSubEstacion1(int codigo);
	
	@Select("SELECT CODIGO_SUB2, descripcion FROM SUB_ESTACION2 where CODIGO_SUB = #{codigo_sub}")
	List<SubEstacion2> getListAllSubEstacion2(int codigo);
	
	@Select("SELECT CODIGO_SUB3, descripcion FROM SUB_ESTACION3 where CODIGO_SUB2 = #{codigo_sub}")
	List<SubEstacion3> getListAllSubEstacion3(int codigo);

	@Select("select id, alias, nombre from ESTACION")
	List<Estacion> getListAllEstaciones();
}
