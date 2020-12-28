package com.gotrip.converter;

import com.gotrip.entity.RoleEntity;
import com.gotrip.entity.UserEntity;
import com.gotrip.model.UserModel;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
public class UserConverter {
    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    public UserEntity toEntity(UserEntity result, UserModel model){
        result.setEmail(model.getEmail());
        result.setFirstName(model.getFirstName());
        result.setLastName(model.getLastName());
        result.setAddress(model.getAddress());
        result.setSex(model.getSex());
        result.setNationality(model.getNationality());
        result.setPassport(model.getPassport());
        result.setPhone(model.getPhone());
        result.setStatus(model.getStatus());
        return result;
    }

    public UserEntity toEntity(UserModel model){
        UserEntity result = new UserEntity();
        result.setEmail(model.getEmail());
        result.setFirstName(model.getFirstName());
        result.setLastName(model.getLastName());
        result.setAddress(model.getAddress());
        result.setSex(model.getSex());
        result.setNationality(model.getNationality());
        result.setPhone(model.getPhone());
        result.setPassport((model.getPassport()));
        result.setPassword(bCryptPasswordEncoder.encode(model.getPassword()));
        result.setStatus(1);
        return result;
    }
}
