package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;


import java.util.List;

public class UserModel extends AbstractModel<UserModel> {
    @Getter
    @Setter
    private String email;

    @Getter
    @Setter
    private String password;

    @Getter
    @Setter
    private String firstName;

    @Getter
    @Setter
    private String lastName;

    @Getter
    @Setter
    private String phone;

    @Getter
    @Setter
    private String sex;

    @Getter
    @Setter
    private String address;

    @Getter
    @Setter
    private String passport;

    @Getter
    @Setter
    private String nationality;

    @Getter
    @Setter
    private Integer status;

    @Getter
    @Setter
    private List<RoleModel> roles;

    @Getter
    @Setter
    private List<String> roleCode;
}
