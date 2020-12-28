package com.gotrip.model;

import com.gotrip.entity.PlaceEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

public class TourModel extends AbstractModel<TourModel>{
    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private String subtitle;

    @Getter
    @Setter
    private String thumbnailUrl;

    @Getter
    @Setter
    private String description;

    @Getter
    @Setter
    private String duringTime;
    @Getter
    @Setter
    private String departure;

    @Getter
    @Setter
    private String destination;

    @Getter
    @Setter
    private String transport;

    @Getter
    @Setter
    private String itinerary;

    @Getter
    @Setter
    private String termAndCondition;

    @Getter
    @Setter
    private String faq;

    @Getter
    @Setter
    private List<PlaceModel> places = new ArrayList<>();

    @Getter
    @Setter
    private List<String> placeName;

}
