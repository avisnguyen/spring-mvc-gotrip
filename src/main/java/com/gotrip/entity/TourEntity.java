package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tour")
public class TourEntity extends BaseEntity {
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
    @Column(name = "during_time")
    private String duringTime;
    @Getter
    @Setter
    private String departure;
    @Getter
    @Setter
    private String destination;
    @Getter
    @Setter
    private String transport;
    @Getter
    @Setter
    @Column(columnDefinition = "LONGTEXT")
    private String itinerary;
    @Getter
    @Setter
    @Column(name = "tearm_condition",columnDefinition = "LONGTEXT")
    private String termAndCondition;
    @Getter
    @Setter
    @Column(columnDefinition = "LONGTEXT")
    private String faq;

    @Getter
    @Setter
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(
            name = "tour_place",
            joinColumns = @JoinColumn(name = "tour_id"),
            inverseJoinColumns = @JoinColumn(name = "place_id")
    )
    private List<PlaceEntity> places = new ArrayList<>();

    @Getter
    @Setter
    @OneToMany(mappedBy = "tour")
    private List<TripEntity> trips = new ArrayList<>();
}
