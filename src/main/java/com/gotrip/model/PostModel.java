package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;


public class PostModel extends AbstractModel<PostModel>{
    @Getter
    @Setter
    private String title;

    @Getter
    @Setter
    private String thumbnail;

    @Getter
    @Setter
    private String shortDescription;

    @Getter
    @Setter
    private String content;

    @Getter
    @Setter
    private long categoryId;

    @Getter
    @Setter
    private String categoryCode;

    @Getter
    @Setter
    private String categoryName;

    @Getter
    @Setter
    private CategoryModel category;
}
