package service;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import bean.Combo;

public interface SensorService {


	List<Combo> getListAllGradoInterferencia();
	List<Combo> getListAllTipoSuperficie();
	List<Combo> getListAllTipoBase();
	


}
