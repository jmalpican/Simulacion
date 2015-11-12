package bean;

import java.io.Serializable;
import java.util.Date;

public class Metadatos implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idMetadatos;
	private String autorizado;
	private String motivo;
	private Date fecha;
	private Integer idMotivo;
	private Integer idResp;
	private String nombreCompleto;
	
	public String getAutorizado() {
		return autorizado;
	}
	public void setAutorizado(String autorizado) {
		this.autorizado = autorizado;
	}
	public String getMotivo() {
		return motivo;
	}
	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Integer getIdResp() {
		return idResp;
	}
	public void setIdResp(Integer idResp) {
		this.idResp = idResp;
	}
	public String getNombreCompleto() {
		return nombreCompleto;
	}
	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}
	public Integer getIdMotivo() {
		return idMotivo;
	}
	public void setIdMotivo(Integer idMotivo) {
		this.idMotivo = idMotivo;
	}
	public Integer getIdMetadatos() {
		return idMetadatos;
	}
	public void setIdMetadatos(Integer idMetadatos) {
		this.idMetadatos = idMetadatos;
	}
	
}
