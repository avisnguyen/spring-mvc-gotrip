package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEntity {
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
    @Column(name = "thumbnail_url")
    private String thumbnailUrl;
    @Getter
    @Setter
    @Column(columnDefinition = "LONGTEXT")
    private String description;

/*    @Getter
    @Setter
    @ManyToMany
    @JoinTable(
            name = "category_tour",
            joinColumns = @JoinColumn(name = "category_id"),
            inverseJoinColumns = @JoinColumn(name = "tour_id")
    )
    private List<TourEntity> tours = new ArrayList<>();*/

    @Getter
    @Setter
    @OneToMany(mappedBy = "category")
    private List<PostEntity> posts = new ArrayList<>();
}
