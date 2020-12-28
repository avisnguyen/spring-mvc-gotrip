package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "customer")
public class CustomerEntity extends BaseEntity {
    @Getter
    @Setter
    @Column(name = "first_name")
    private String firstName;
    @Getter
    @Setter
    @Column(name = "last_name")
    private String lastName;
    @Getter
    @Setter
    private String phone;
    @Getter
    @Setter
    private String sex;
    @Getter
    @Setter
    private String address;
    @Getter
    @Setter
    private String nationality;
    @Getter
    @Setter
    private String passport;

    @ManyToOne
    @JoinColumn(name = "ticket_id")
    private TicketEntity ticket;
}
