package com.gotrip.converter;


import com.gotrip.entity.PlaceEntity;
import com.gotrip.model.PlaceModel;
import org.springframework.stereotype.Component;

@Component
public class PlaceConverter {
    public PlaceEntity toEntity(PlaceEntity result, PlaceModel model){
        result.setDescription(model.getDescription());
        result.setName(model.getName());
        result.setThumbnailUrl(model.getThumbnailUrl());
        result.setSubtitle(model.getSubtitle());
        return result;
    }
}
