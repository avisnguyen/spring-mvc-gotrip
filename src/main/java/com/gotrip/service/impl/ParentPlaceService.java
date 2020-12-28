package com.gotrip.service.impl;

import com.gotrip.converter.CategoryConverter;
import com.gotrip.converter.ParentPlaceConverter;
import com.gotrip.entity.ParentPlaceEntity;
import com.gotrip.entity.PlaceEntity;
import com.gotrip.model.ParentPlaceModel;
import com.gotrip.model.ParentPlaceModel;
import com.gotrip.model.PlaceModel;
import com.gotrip.repository.ParentPlaceRepository;
import com.gotrip.repository.PlaceRepository;
import com.gotrip.service.IParentPlaceService;
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
public class ParentPlaceService implements IParentPlaceService {
    @Autowired
    private ParentPlaceRepository parentPlaceRepository;

    @Autowired
    private ParentPlaceConverter parentPlaceConverter;

    @Autowired
    private PlaceRepository placeRepository;

    ModelMapper modelMapper = new ModelMapper();
    
    @Override
    public Map<String, String> findAll() {
        Map<String, String> result = new HashMap<>();
        List<ParentPlaceEntity> entities = parentPlaceRepository.findAll();
        for(ParentPlaceEntity item:entities){
            result.put(item.getCode(), item.getName());
        }
        return result;
    }

    @Override
    public List<ParentPlaceModel> findAll(Pageable pageable) {
        List<ParentPlaceModel> models = new ArrayList<>();
        List<ParentPlaceEntity> entities = parentPlaceRepository.findAll(pageable).getContent();
        for (ParentPlaceEntity item: entities) {
            ParentPlaceModel categoryModel = modelMapper.map(item, ParentPlaceModel.class);
            models.add(categoryModel);
        }
        return models;
    }

    @Override
    public int getTotalItem() {
        return (int) parentPlaceRepository.count();
    }

    @Override
    public ParentPlaceModel findById(long id) {
        ParentPlaceEntity parentPlaceEntity = parentPlaceRepository.findOne(id);
        return modelMapper.map(parentPlaceEntity, ParentPlaceModel.class);
    }

    @Override
    @Transactional
    public ParentPlaceModel save(ParentPlaceModel model) {
        ParentPlaceEntity parentPlaceEntity;
        if (model.getId() != null) {
            ParentPlaceEntity oldNew = parentPlaceRepository.findOne(model.getId());
            parentPlaceEntity = parentPlaceConverter.toEntity(oldNew, model);
        } else {
            parentPlaceEntity = modelMapper.map(model, ParentPlaceEntity.class);
        }
        ParentPlaceModel result = modelMapper.map(parentPlaceRepository.save(parentPlaceEntity), ParentPlaceModel.class);
        return result;
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id: ids) {
            List<PlaceEntity> placeEntities = placeRepository.findOneByParentPlaceId(id);
            for(PlaceEntity entity: placeEntities){
                placeRepository.delete(entity);
            }
            parentPlaceRepository.delete(id);
        }
    }
}
