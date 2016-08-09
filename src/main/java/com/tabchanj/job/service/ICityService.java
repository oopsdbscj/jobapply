package com.tabchanj.job.service;

import java.io.Serializable;
import java.util.List;

import com.tabchanj.job.domain.City;


public interface ICityService {
	void saveCity(City u);

	void updateCity(City u);

	void deleteCity(Serializable id);

	City getCity(Serializable id);

	List<City> listCitys();
}
