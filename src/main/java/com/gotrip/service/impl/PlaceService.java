package com.gotrip.service.impl;

import com.gotrip.converter.PlaceConverter;
import com.gotrip.entity.ParentPlaceEntity;
import com.gotrip.entity.PlaceEntity;
import com.gotrip.model.PlaceModel;
import com.gotrip.repository.ParentPlaceRepository;
import com.gotrip.repository.PlaceRepository;
import com.gotrip.service.IPlaceService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PlaceService implements IPlaceService {

    @Autowired
    private PlaceRepository placeRepository;

    @Autowired
    private ParentPlaceRepository parentPlaceRepository;

    @Autowired
    private PlaceConverter placeConverter;

    ModelMapper modelMapper = new ModelMapper();

    @Override
    public List<PlaceModel> findAll(Pageable pageable) {
        List<PlaceModel> models = new ArrayList<>();
        List<PlaceEntity> entities = placeRepository.findAll(pageable).getContent();
        for (PlaceEntity item : entities) {
            PlaceModel placeModel = modelMapper.map(item, PlaceModel.class);
            models.add(placeModel);
        }
        return models;
    }

    @Override
    public int getTotalItem() {
        return (int) placeRepository.count();
    }

    @Override
    public PlaceModel findById(long id) {
        PlaceEntity entity = placeRepository.findOne(id);
        return modelMapper.map(entity, PlaceModel.class);
    }

   /* @Override
    public List<PlaceModel> findAll() {
        List<PlaceModel> models = new ArrayList<>();
        List<PlaceEntity> entities = placeRepository.findAll();
        for (PlaceEntity item : entities) {
            PlaceModel placeModel = modelMapper.map(item, PlaceModel.class);
            models.add(placeModel);
        }
        return models;
    }*/
    /*
    @Override
    public List<PlaceModel> findByName(String name) {
        List<PlaceModel> result = new ArrayList<>();
        List<PlaceEntity> placeEntities = placeRepository.findAllByName(name);
        for (PlaceEntity placeEntity:
             placeEntities) {
            result.add(modelMapper.map(placeEntity,PlaceModel.class));
        }
        return result;
    }*/

    @Override
    public Map<String, String> findAll() {
        Map<String, String> result = new HashMap<>();
        List<PlaceEntity> entities = placeRepository.findAll();
        for(PlaceEntity item:entities){
            result.put(item.getName(), item.getName());
        }
        return result;
    }

    @Override
    @Transactional
    public PlaceModel save(PlaceModel model) {
        ParentPlaceEntity parentPlace = parentPlaceRepository.findOneByCode(model.getParentPlaceCode());
        PlaceEntity placeEntity = new PlaceEntity();
        if (model.getId() != null) {
            PlaceEntity oldNew = placeRepository.findOne(model.getId());
            oldNew.setParentPlace(parentPlace);
            placeEntity = placeConverter.toEntity(oldNew, model);
        } else {
            placeEntity = modelMapper.map(model, PlaceEntity.class);
            placeEntity.setParentPlace(parentPlace);
        }
        PlaceModel result = modelMapper.map(placeRepository.save(placeEntity), PlaceModel.class);
        return result;
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id : ids) {
            placeRepository.delete(id);
        }
    }

    @Override
    public List<PlaceModel> findAllMB() {
        List<PlaceModel> models = new ArrayList<>();
        List<PlaceEntity> entities = placeRepository.findAllByParentPlaceId(1);
        for (PlaceEntity item : entities) {
            PlaceModel placeModel = modelMapper.map(item, PlaceModel.class);
            models.add(placeModel);
        }
        return models;
    }

    @Override
    public List<PlaceModel> findAllMT() {
        List<PlaceModel> models = new ArrayList<>();
        List<PlaceEntity> entities = placeRepository.findAllByParentPlaceId(2);
        for (PlaceEntity item : entities) {
            PlaceModel placeModel = modelMapper.map(item, PlaceModel.class);
            models.add(placeModel);
        }
        return models;
    }

    @Override
    public List<PlaceModel> findAllMN() {
        List<PlaceModel> models = new ArrayList<>();
        List<PlaceEntity> entities = placeRepository.findAllByParentPlaceId(3);
        for (PlaceEntity item : entities) {
            PlaceModel placeModel = modelMapper.map(item, PlaceModel.class);
            models.add(placeModel);
        }
        return models;
    }
}
