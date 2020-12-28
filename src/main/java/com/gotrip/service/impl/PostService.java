package com.gotrip.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.gotrip.converter.PostConverter;
import com.gotrip.entity.CategoryEntity;
import com.gotrip.entity.PostEntity;
import com.gotrip.model.PostModel;
import com.gotrip.repository.CategoryRepository;
import com.gotrip.repository.PostRepository;
import com.gotrip.service.IPostService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

@Service
public class PostService implements IPostService {
    @Autowired
    private PostRepository postRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private PostConverter postConverter;

    ModelMapper modelMapper = new ModelMapper();

    /*Admin*/
    @Override
    public List<PostModel> findAll(Pageable pageable) {
        List<PostModel> models = new ArrayList<>();
        List<PostEntity> entities = postRepository.findAll(pageable).getContent();
        for (PostEntity item: entities) {
            PostModel postModel = modelMapper.map(item, PostModel.class);
            models.add(postModel);
        }
        return models;
    }

    @Override
    public int getTotalItem() {
        return (int) postRepository.count();
    }

    @Override
    public PostModel findById(long id) {
        PostEntity entity = postRepository.findOne(id);
        return modelMapper.map(entity, PostModel.class);
    }

    @Override
    @Transactional
    public PostModel save(PostModel model) {
        CategoryEntity category = categoryRepository.findOneByCode(model.getCategoryCode());
        PostEntity postEntity = new PostEntity();
        if (model.getId() != null) {
            PostEntity oldNew = postRepository.findOne(model.getId());
            oldNew.setCategory(category);
            postEntity = postConverter.toEntity(oldNew, model);
        } else {
            postEntity = postConverter.toEntity(model);
            postEntity.setCategory(category);
        }
        PostModel result = modelMapper.map(postRepository.save(postEntity), PostModel.class);
        return result;
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id: ids) {
            postRepository.delete(id);
        }
    }

    @Override
    public PostModel findByCateCode(String code) {
        PostEntity entity = postRepository.findOneByCategoryCode(code);
        return modelMapper.map(entity, PostModel.class);
    }

    /*Web*/
    @Override
    public List<PostModel> findAllIdDesc() {
        List<PostModel> models = new ArrayList<>();
        List<PostEntity> entities = postRepository.findAllByOrderByIdDesc();
        for (PostEntity item: entities) {
            PostModel postModel = modelMapper.map(item, PostModel.class);
            models.add(postModel);
        }
        return models;
    }

    @Override
    public List<PostModel> findAllByCategory(PostModel model) {
        List<PostModel> models = new ArrayList<>();
        List<PostEntity> entities = postRepository.findAllByCategoryIdOrderByIdDesc(model.getCategoryId());
        for (PostEntity item: entities) {
            PostModel postModel = modelMapper.map(item, PostModel.class);
            models.add(postModel);
        }
        return models;
    }

    @Override
    public List<PostModel> findAllByCategoryCode(String code) {
        List<PostModel> result = new ArrayList<>();
        List<PostEntity> entities = postRepository.findAllByCategoryCodeOrderByIdDesc(code);
        for (PostEntity postEntity :
             entities) {
            result.add(modelMapper.map(postEntity, PostModel.class));
        }
        return result;
    }
}

