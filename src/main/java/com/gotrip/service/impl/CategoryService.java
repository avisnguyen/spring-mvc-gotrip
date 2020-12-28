package com.gotrip.service.impl;

import com.gotrip.converter.CategoryConverter;
import com.gotrip.model.CategoryModel;
import com.gotrip.entity.CategoryEntity;
import com.gotrip.repository.CategoryRepository;
import com.gotrip.service.ICategoryService;
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
@Transactional
public class CategoryService implements ICategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private CategoryConverter categoryConverter;
    
    ModelMapper modelMapper = new ModelMapper();
    @Override
    public Map<String, String> findAll() {
        Map<String, String> result = new HashMap<>();
        List<CategoryEntity> entities = categoryRepository.findAll();
        for(CategoryEntity item:entities){
            result.put(item.getCode(), item.getName());
        }
        return result;
    }

    @Override
    public List<CategoryModel> findAll(Pageable pageable) {
        List<CategoryModel> models = new ArrayList<>();
        List<CategoryEntity> entities = categoryRepository.findAll(pageable).getContent();
        for (CategoryEntity item: entities) {
            CategoryModel categoryModel = modelMapper.map(item, CategoryModel.class);
            models.add(categoryModel);
        }
        return models;
    }

    @Override
    public int getTotalItem() {
        return (int) categoryRepository.count();
    }

    @Override
    public CategoryModel findById(long id) {
        CategoryEntity categoryEntity = categoryRepository.findOne(id);
        return modelMapper.map(categoryEntity, CategoryModel.class);
    }

    @Override
    public CategoryModel findByCode(String code) {
        CategoryEntity categoryEntity = categoryRepository.findOneByCode(code);
        return modelMapper.map(categoryEntity, CategoryModel.class);
    }

    @Override
    public CategoryModel save(CategoryModel model) {
        CategoryEntity categoryEntity;
        if (model.getId() != null) {
            CategoryEntity oldNew = categoryRepository.findOne(model.getId());
            categoryEntity = categoryConverter.toEntity(oldNew, model);
        } else {
            categoryEntity = modelMapper.map(model, CategoryEntity.class);
        }
        CategoryModel result = modelMapper.map(categoryRepository.save(categoryEntity), CategoryModel.class);
        return result;
    }

    @Override
    public void delete(long[] ids) {
        for (long id: ids) {
            categoryRepository.delete(id);
        }
    }


}
