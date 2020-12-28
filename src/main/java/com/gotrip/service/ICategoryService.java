package com.gotrip.service;

import com.gotrip.model.CategoryModel;
import com.gotrip.model.PostModel;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface ICategoryService {
    Map<String, String> findAll();
    List<CategoryModel> findAll(Pageable pageable);
    int getTotalItem();
    CategoryModel findById(long id);
    CategoryModel save(CategoryModel dto);
    void delete(long[] ids);
    CategoryModel findByCode(String code);
}
