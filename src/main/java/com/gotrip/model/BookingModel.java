package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

public class BookingModel {
    /*@Getter
    @Setter
    private String tripCode;*/
    @Getter
    @Setter
    private Double adultPrice;
    @Getter
    @Setter
    private Integer adultQuantity;
    @Getter
    @Setter
    private Double childPrice;
    @Getter
    @Setter
    private Integer childQuantity;
    @Getter
    @Setter
    private Double infantPrice;
    @Getter
    @Setter
    private Integer infantQuantity;
    /*@Getter
    @Setter
    private TripModel trip;*/

    @Getter
    @Setter
    private Long tripId;

    @Getter
    @Setter
    private String code;
    @Getter
    @Setter
    private String duringTime;
    @Getter
    @Setter
    private String description;
    @Getter
    @Setter
    private String transport;
    @Getter
    @Setter
    private String departurePlace;
    @Getter
    @Setter
    private String departureTime;
    @Getter
    @Setter
    private String returnPlace;
    @Getter
    @Setter
    private String returnTime;
    @Getter
    @Setter
    private String customerNote;

    @Getter
    @Setter
    private long billId;

    @Getter
    @Setter
    private long contactInfoId;

    @Getter
    @Setter
    private long userId;


    @Getter
    @Setter
    private String firstName;
    @Getter
    @Setter
    private String lastName;
    @Getter
    @Setter
    private String phone;
    @Getter
    @Setter
    private String address;
    @Getter
    @Setter
    private String email;
    @Getter
    @Setter
    private String nationality;

    @Getter
    @Setter
    private long ticketId;
}
