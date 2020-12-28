package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AbstractModel<T> {
    @Getter
    @Setter
    private Long id;
    @Getter
    @Setter
    private Timestamp createdDate;
    @Getter
    @Setter
    private Timestamp modifiedDate;
    @Getter
    @Setter
    private String createdBy;
    @Getter
    @Setter
    private String modifiedBy;
    @Getter
    @Setter
    private long[] ids;
    @Getter
    @Setter
    private List<T> listResult = new ArrayList<>();
    @Getter
    @Setter
    private Integer page;
    @Getter
    @Setter
    private Integer maxPageItem;
    @Getter
    @Setter
    private Integer limit;
    @Getter
    @Setter
    private Integer totalPage;
    @Getter
    @Setter
    private Integer totalItem;
    @Getter
    @Setter
    private String sortName;
    @Getter
    @Setter
    private String sortBy;
    @Getter
    @Setter
    private String type;
}
