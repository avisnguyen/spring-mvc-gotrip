package com.gotrip.service;

import com.gotrip.model.CategoryModel;
import com.gotrip.model.ParentPlaceModel;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IParentPlaceService {
    Map<String, String> findAll();
    List<ParentPlaceModel> findAll(Pageable pageable);
    int getTotalItem();
    ParentPlaceModel findById(long id);
    ParentPlaceModel save(ParentPlaceModel model);
    void delete(long[] ids);
}
