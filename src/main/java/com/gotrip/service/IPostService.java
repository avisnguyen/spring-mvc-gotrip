package com.gotrip.service;


import com.gotrip.model.PostModel;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IPostService {
    List<PostModel> findAll(Pageable pageable);
    List<PostModel> findAllIdDesc();
    List<PostModel> findAllByCategory(PostModel model);
    List<PostModel> findAllByCategoryCode(String code);
    int getTotalItem();
    PostModel findById(long id);
    PostModel save(PostModel model);
    void delete(long[] ids);
    PostModel findByCateCode(String code);
}
