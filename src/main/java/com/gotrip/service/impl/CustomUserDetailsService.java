package com.gotrip.service.impl;

import com.gotrip.constant.SystemConstant;
import com.gotrip.security.MyUser;
import com.gotrip.entity.RoleEntity;
import com.gotrip.entity.UserEntity;
import com.gotrip.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity userEntity = userRepository.findByEmailAndStatus(username, SystemConstant.ACTIVE_STATUS);

        if(userEntity == null) {
            throw new UsernameNotFoundException("User not found!");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (RoleEntity role:userEntity.getRoles()){
            authorities.add(new SimpleGrantedAuthority(role.getCode()));
        }
        /*put thông tin vào security duy trì thông tin khi user login vào hệ thống*/
        MyUser myUser = new MyUser(userEntity.getEmail(), userEntity.getPassword(),
                true, true, true, true, authorities);
        myUser.setFirstName(userEntity.getFirstName());
        myUser.setLastName(userEntity.getLastName());
        myUser.setPhone(userEntity.getPhone());
        myUser.setEmail(userEntity.getEmail());
        myUser.setAddress(userEntity.getAddress());
        myUser.setNationality(userEntity.getNationality());
        myUser.setId(userEntity.getId());
        return myUser;
    }
}
