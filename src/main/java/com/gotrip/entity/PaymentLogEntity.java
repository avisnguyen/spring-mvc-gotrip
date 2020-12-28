package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "payment_log")
public class PaymentLogEntity extends BaseEntity {
    @Getter
    @Setter
    private String code;
    @Getter
    @Setter
    @Column(columnDefinition = "LONGTEXT")
    private String description;
    @Getter
    @Setter
    private String content;
    @Getter
    @Setter
    @Column(columnDefinition = "LONGTEXT")
    private String note;
    @Getter
    @Setter
    private String method;

    @Getter
    @Setter
    @ManyToOne
    @JoinColumn(name = "bill_id")
    private BillEntity bill;
}
