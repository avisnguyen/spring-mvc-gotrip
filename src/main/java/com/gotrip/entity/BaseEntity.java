package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    private Long id;

    @Column(name = "created_date")
    @CreatedDate
    @Getter
    @Setter
    private Date createDate;

    @Column(name = "created_by")
    @CreatedBy
    @Getter
    @Setter
    private String createBy;

    @Column(name = "modified_date")
    @LastModifiedDate
    @Getter
    @Setter
    private Date modifiedDate;

    @Column(name = "modified_by")
    @LastModifiedBy
    @Getter
    @Setter
    private String modifiedBy;

    @Column(name = "is_deleted")
    @Getter
    @Setter
    private Boolean isDeleted;
}
