package com.gotrip.service.impl;

import com.gotrip.converter.TourConverter;
import com.gotrip.entity.*;
import com.gotrip.entity.PlaceEntity;
import com.gotrip.entity.TourEntity;
import com.gotrip.model.TourModel;
import com.gotrip.model.TourModel;
import com.gotrip.repository.PlaceRepository;
import com.gotrip.repository.TourRepository;
import com.gotrip.service.ITourService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("ITourService")
public class TourService implements ITourService {
    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private PlaceRepository placeRepository;

    @Autowired
    private TourConverter tourConverter;

    ModelMapper modelMapper = new ModelMapper();


    @Override
    public Map<String, String> findAll() {
        Map<String, String> result = new HashMap<>();
        List<TourEntity> entities = tourRepository.findAll();
        for(TourEntity item:entities){
            result.put(item.getName(), item.getName());
        }
        return result;
    }

    @Override
    public List<TourModel> findAll(Pageable pageable) {
        List<TourModel> models = new ArrayList<>();
        List<TourEntity> entities = tourRepository.findAll(pageable).getContent();
        for (TourEntity item: entities) {
            TourModel tourModel = modelMapper.map(item, TourModel.class);
            models.add(tourModel);
        }
        return models;
    }

    @Override
    public int getTotalItem() {
        return (int) tourRepository.count();
    }

    @Override
    public TourModel findById(long id) {
        TourEntity entity = tourRepository.findOne(id);
        return modelMapper.map(entity, TourModel.class);
    }

    @Override
    @Transactional
    public TourModel save(TourModel model) {
        List<PlaceEntity> placeEntityList = new ArrayList<>();
        for (int i = 0; i < model.getPlaceName().size(); i++) {
            PlaceEntity placeEntities = placeRepository.findOneByName(model.getPlaceName().get(i));
            placeEntityList.add(placeEntities);
        }
        TourEntity tourEntity = new TourEntity();
        if (model.getId() != null) {
            TourEntity oldNew = tourRepository.findOne(model.getId());
            oldNew.setPlaces(placeEntityList);
            tourEntity = tourConverter.toEntity(oldNew, model);
        } else {
            tourEntity = modelMapper.map(model, TourEntity.class);
            tourEntity.setPlaces(placeEntityList);
        }
        TourModel result = modelMapper.map(tourRepository.save(tourEntity), TourModel.class);
        return result;
    }
    
    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id: ids) {
            tourRepository.delete(id);
        }
    }

    @Override
    public TourModel saveWeb(TourModel model) {
        return null;
    }

}
