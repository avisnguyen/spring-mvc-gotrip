package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;

public class PlaceModel extends AbstractModel<PlaceModel>{
    @Getter
    @Setter
    private String name;
    @Getter
    @Setter
    private String description;
    @Getter
    @Setter
    private String subtitle;
    @Getter
    @Setter
    private String thumbnailUrl;

    @Getter
    @Setter
    private String parentPlaceName;

    @Getter
    @Setter
    private String parentPlaceCode;
}
