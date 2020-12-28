package com.gotrip.entity;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "parent_place")
public class ParentPlaceEntity extends BaseEntity{
    @Getter
    @Setter
    @Column(name = "name")
    private String name;

    @Getter
    @Setter
    @Column(name = "code")
    private String code;

    @OneToMany(mappedBy = "parentPlace")
    private List<PlaceEntity> places = new ArrayList<>();
}
