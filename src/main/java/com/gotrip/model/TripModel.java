package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Calendar;
import java.util.Date;

public class TripModel extends AbstractModel<TripModel>{
    @Getter
    @Setter
    private String code;

    @Getter
    @Setter
    private String departurePlace;

    @Getter
    @Setter
    private Date departureTime;

    @Getter
    @Setter
    private Date returnTime;

    @Getter
    @Setter
    private Double adultPrice;

    @Getter
    @Setter
    private Double childPrice;

    @Getter
    @Setter
    private Double infantPrice;

    @Getter
    @Setter
    private String tourName;

    @Getter
    @Setter
    private TourModel tour;
}
