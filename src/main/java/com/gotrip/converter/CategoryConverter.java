package com.gotrip.converter;

import com.gotrip.entity.CategoryEntity;
import com.gotrip.model.CategoryModel;
import org.springframework.stereotype.Component;

@Component
public class CategoryConverter {
    public CategoryEntity toEntity(CategoryEntity result, CategoryModel model){
        result.setCode(model.getCode());
        result.setName(model.getName());
        result.setThumbnailUrl(model.getThumbnailUrl());
        result.setSubtitle(model.getSubtitle());
        return result;
    }
}