package com.gotrip.service;

import com.gotrip.entity.UserEntity;
import com.gotrip.model.UserModel;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface IUserService {
    int getTotalItems();
    Map<String, String> findAll();
    List<UserModel> findAll(Pageable pageable);
    int getTotalItem();
    UserModel findById(long id);
    UserModel save(UserModel model);
    UserModel saveWeb(UserModel model);
    void delete(long ids[]);
}
