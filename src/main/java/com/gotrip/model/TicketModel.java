package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

public class TicketModel extends AbstractModel<TicketModel>{
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
    private Date departureTime;
    @Getter
    @Setter
    private String returnPlace;
    @Getter
    @Setter
    private Date returnTime;
    @Getter
    @Setter
    private String customerNote;

    @Getter
    @Setter
    private long billId;

    @Getter
    @Setter
    private long userId;
}
