package com.gotrip.service.impl;

import com.gotrip.converter.UserConverter;
import com.gotrip.entity.RoleEntity;
import com.gotrip.entity.UserEntity;
import com.gotrip.model.UserModel;
import com.gotrip.repository.RoleRepository;
import com.gotrip.repository.UserRepository;
import com.gotrip.service.IUserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService implements IUserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public int getTotalItems() {
        return (int) userRepository.count();
    }

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserConverter userConverter;

    ModelMapper modelMapper = new ModelMapper();

    @Override
    public Map<String, String> findAll() {
        Map<String, String> result = new HashMap<>();
        List<UserEntity> entities = userRepository.findAll();
        return result;
    }

    @Override
    public List<UserModel> findAll(Pageable pageable) {
        List<UserModel> models = new ArrayList<>();
        List<UserEntity> entities = userRepository.findAll(pageable).getContent();
        for (UserEntity item: entities) {
            UserModel userModel = modelMapper.map(item, UserModel.class);
            models.add(userModel);
        }
        return models;
    }

    @Override
    public int getTotalItem() {
        return (int) userRepository.count();
    }

    @Override
    public UserModel findById(long id) {
        UserEntity entity = userRepository.findOne(id);
        return modelMapper.map(entity, UserModel.class);
    }

    @Override
    @Transactional
    public UserModel save(UserModel model) {
        List<RoleEntity> roleEntityList = new ArrayList<>();
        for (int i = 0; i < model.getRoleCode().size(); i++) {
            RoleEntity roleEntities = roleRepository.findOneByCode(model.getRoleCode().get(i));
            roleEntityList.add(roleEntities);
        }
        UserEntity email = userRepository.findByEmail(model.getEmail());
        UserEntity userEntity = new UserEntity();
        if (model.getId() != null) {
            UserEntity oldNew = userRepository.findOne(model.getId());
            oldNew.setRoles(roleEntityList);
            userEntity = userConverter.toEntity(oldNew, model);
        } else {
            if(email == null){
                userEntity = userConverter.toEntity(model);
                userEntity.setRoles(roleEntityList);
            }
            else
                return null;
        }
        UserModel result = modelMapper.map(userRepository.save(userEntity), UserModel.class);
        return result;
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id: ids) {
            userRepository.delete(id);
        }
    }

    /*Web*/
    @Override
    @Transactional
    public UserModel saveWeb(UserModel model) {
        /*RoleEntity role = new RoleEntity();*/
        List<RoleEntity> roleEntity = roleRepository.findAllByCode("USER");
        UserEntity userEntity = new UserEntity();
        userEntity = userConverter.toEntity(model);
        userEntity.setRoles(roleEntity);
        UserModel result = modelMapper.map(userRepository.save(userEntity), UserModel.class);
        return result;
    }
}
