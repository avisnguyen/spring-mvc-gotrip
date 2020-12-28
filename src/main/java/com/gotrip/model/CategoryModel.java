package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;


public class CategoryModel extends AbstractModel<CategoryModel>{
    @Getter
    @Setter
    private String name;
    @Getter
    @Setter
    private String code;
    @Getter
    @Setter
    private String subtitle;
    @Getter
    @Setter
    private String thumbnailUrl;
}
