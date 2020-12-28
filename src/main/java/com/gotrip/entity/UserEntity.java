package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity{
    @Column(name = "email")
    @Getter
    @Setter
    private String email;

    @Column(name = "password")
    @Getter
    @Setter
    private String password;

    @Getter
    @Setter
    @Column(name = "first_name")
    private String firstName;

    @Getter
    @Setter
    @Column(name = "last_name")
    private String lastName;

    @Column(name = "phone")
    @Getter
    @Setter
    private String phone;

    @Column(name = "sex")
    @Getter
    @Setter
    private String sex;

    @Column(name = "address")
    @Getter
    @Setter
    private String address;

    @Getter
    @Setter
    private String passport;

    @Getter
    @Setter
    private String nationality;

    @Column(name = "status")
    @Getter
    @Setter
    private Integer status;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Getter
    @Setter
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<RoleEntity> roles = new ArrayList<>();

    @Getter
    @Setter
    @OneToMany(mappedBy = "user")
    private List<TicketEntity> tickets = new ArrayList<>();

}
