package com.gotrip.service;

import com.gotrip.model.PlaceModel;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IPlaceService {
    List<PlaceModel> findAll(Pageable pageable);
    /*List<PlaceModel> findAll();*/
    /*List<PlaceModel> findByName(String name);*/
    int getTotalItem();
    Map<String, String> findAll();
    PlaceModel findById(long id);
    PlaceModel save(PlaceModel model);
    void delete(long[] ids);
    List<PlaceModel> findAllMB();
    List<PlaceModel> findAllMT();
    List<PlaceModel> findAllMN();
}
