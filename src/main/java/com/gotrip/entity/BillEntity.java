package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "bill")
public class BillEntity extends BaseEntity {
    @Getter
    @Setter
    private String code;
    @Getter
    @Setter
    @Column(name = "adult_price")
    private Double adultPrice;
    @Getter
    @Setter
    @Column(name = "adult_quantity")
    private Integer adultQuantity;
    @Getter
    @Setter
    @Column(name = "child_price")
    private Double childPrice;
    @Getter
    @Setter
    @Column(name = "child_quantity")
    private Integer childQuantity;
    @Getter
    @Setter
    @Column(name = "infant_price")
    private Double infantPrice;
    @Getter
    @Setter
    @Column(name = "infant_quantity")
    private Integer infantQuantity;

    @Getter
    @Setter
    @ManyToOne
    @JoinColumn
    private TripEntity trip;

    @Getter
    @Setter
    @OneToMany(mappedBy = "bill")
    private List<PaymentLogEntity> paymentLogs = new ArrayList<>();

    @Getter
    @Setter
    @OneToMany(mappedBy = "bill")
    private List<TicketEntity> tickets = new ArrayList<>();
}
