package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "ticket")
public class TicketEntity extends BaseEntity {
    @Getter
    @Setter
    private String code;
    @Getter
    @Setter
    @Column(name = "during_time")
    private String duringTime;
    @Getter
    @Setter
    @Column(columnDefinition = "LONGTEXT")
    private String description;
    @Getter
    @Setter
    private String transport;
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
    @Column(name = "return_place")
    private String returnPlace;
    @Getter
    @Setter
    @Column(name = "return_time")
    @Temporal(TemporalType.DATE)
    private Date returnTime;
    @Getter
    @Setter
    @Column(name = "customer_note")
    private String customerNote;
    @Getter
    @Setter
    @ManyToOne
    @JoinColumn(name = "bill_id")
    private BillEntity bill;

    @Getter
    @Setter
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = true)
    private UserEntity user;

    @Getter
    @Setter
    @OneToMany(mappedBy = "ticket")
    private List<CustomerEntity> customers = new ArrayList<>();

    @Getter
    @Setter
    @OneToOne(mappedBy = "ticket")
    private ContactInfoEntity contactInfo;
}
