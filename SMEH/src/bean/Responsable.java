package bean;

import java.io.Serializable;

public class Responsable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer idResp;
	private String nombre;
	private String apellido;
	
	public Integer getIdResp() {
		return idResp;
	}
	public void setIdResp(Integer idResp) {
		this.idResp = idResp;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	
}
