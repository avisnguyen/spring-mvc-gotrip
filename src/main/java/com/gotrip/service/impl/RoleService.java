package com.gotrip.service.impl;

import com.gotrip.entity.CategoryEntity;
import com.gotrip.entity.RoleEntity;
import com.gotrip.repository.RoleRepository;
import com.gotrip.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleService implements IRoleService {
    @Autowired
    private RoleRepository roleRepository;
    @Override
    public Map<String, String> findAll() {
        Map<String, String> result = new HashMap<>();
        List<RoleEntity> entities = roleRepository.findAll();
        for(RoleEntity item:entities){
            result.put(item.getCode(), item.getName());
        }
        return result;
    }
}
