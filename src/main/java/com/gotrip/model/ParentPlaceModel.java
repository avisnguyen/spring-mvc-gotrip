package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;

public class ParentPlaceModel extends AbstractModel<ParentPlaceModel>{
    @Getter
    @Setter
    private String name;
    @Getter
    @Setter
    private String code;
}
