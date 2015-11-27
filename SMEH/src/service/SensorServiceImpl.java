package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.Combo;

import dao.SensorDao;


@Service
public class SensorServiceImpl implements SensorService{
	@Autowired
	 protected SensorDao sensorDao;
		
	@Override
	public List<Combo> getListAllGradoInterferencia() {
		// TODO Auto-generated method stub
		return sensorDao.getListAllGradoInterferencia();
	}

	@Override
	public List<Combo> getListAllTipoSuperficie() {
		// TODO Auto-generated method stub
		return sensorDao.getListAllTipoSuperficie();
	}

	@Override
	public List<Combo> getListAllTipoBase() {
		// TODO Auto-generated method stub
		return sensorDao.getListAllTipoBase();
	}

	


    

}
