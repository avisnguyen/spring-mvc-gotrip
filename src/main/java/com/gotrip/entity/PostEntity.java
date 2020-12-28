package com.gotrip.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "post")
public class PostEntity extends BaseEntity{
    @Getter
    @Setter
    @Column(name = "title")
    private String title;

    @Getter
    @Setter
    @Column(name = "thumbnail_url")
    private String thumbnail;

    @Getter
    @Setter
    @Column(name = "short_description", columnDefinition = "LONGTEXT")
    private String shortDescription;

    @Getter
    @Setter
    @Column(name = "content", columnDefinition = "LONGTEXT")
    private String content;

    @Getter
    @Setter
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", nullable = false)
    private CategoryEntity category;
}
