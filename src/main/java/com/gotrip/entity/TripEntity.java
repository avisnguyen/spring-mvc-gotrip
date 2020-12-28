package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "trip")
public class TripEntity extends BaseEntity {
    @Getter
    @Setter
    private String code;
    @Getter
    @Setter
    @Column(name = "depature_place")
    private String departurePlace;
    @Getter
    @Setter
    @Column(name = "depature_time")
    @Temporal(TemporalType.DATE)
    private Date departureTime;
    @Getter
    @Setter
    @Column(name = "return_time")
    @Temporal(TemporalType.DATE)
    private Date returnTime;
    @Getter
    @Setter
    @Column(name = "adult_price")
    private Double adultPrice;
    @Getter
    @Setter
    @Column(name = "child_price")
    private Double childPrice;
    @Getter
    @Setter
    @Column(name = "infant_price")
    private Double infantPrice;

    @Getter
    @Setter
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_id", nullable = false)
    private TourEntity tour;

    @Getter
    @Setter
    @OneToMany(mappedBy = "trip")
    private List<BillEntity> bills = new ArrayList<>();
}
