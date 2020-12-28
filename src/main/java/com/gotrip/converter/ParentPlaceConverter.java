package com.gotrip.converter;

import com.gotrip.entity.ParentPlaceEntity;
import com.gotrip.model.CategoryModel;
import com.gotrip.model.ParentPlaceModel;
import org.springframework.stereotype.Component;

@Component
public class ParentPlaceConverter {
    public ParentPlaceEntity toEntity(ParentPlaceEntity result, ParentPlaceModel model){
        result.setCode(model.getCode());
        result.setName(model.getName());
        return result;
    }
}
