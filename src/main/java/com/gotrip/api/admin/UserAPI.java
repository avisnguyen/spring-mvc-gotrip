package com.gotrip.api.admin;

import com.gotrip.entity.UserEntity;
import com.gotrip.model.UserModel;
import com.gotrip.repository.UserRepository;
import com.gotrip.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserAPI {
    @Autowired
    private IUserService userService;

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/api/user")
    public UserModel createUser(@RequestBody UserModel userModel) {
        return userService.save(userModel);
    }

    @PutMapping("/api/user")
    public UserModel updateUser(@RequestBody UserModel updateUser) {
        return userService.save(updateUser);
    }

    @DeleteMapping("/api/user")
    public void deleteUser(@RequestBody long[] ids) {
        userService.delete(ids);
    }
}
