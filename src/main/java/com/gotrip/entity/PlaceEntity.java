package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "place")
public class PlaceEntity extends BaseEntity {
    @Getter
    @Setter
    private String name;
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

    @Getter
    @Setter
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parentPlace_id", nullable = false)
    private ParentPlaceEntity parentPlace;

    @Getter
    @Setter
    @ManyToMany(mappedBy = "places")
    private List<TourEntity> tours = new ArrayList<>();
}
