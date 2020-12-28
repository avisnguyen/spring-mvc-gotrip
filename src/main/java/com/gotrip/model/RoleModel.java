package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;

public class RoleModel extends AbstractModel<RoleModel>{
    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private String code;
}
