package com.gotrip.model;

import lombok.Getter;
import lombok.Setter;

public class BillModel extends AbstractModel<BillModel>{
    @Getter
    @Setter
    private String code;
    /*@Getter
    @Setter
    private String tripCode;*/
    @Getter
    @Setter
    private Double adultPrice;
    @Getter
    @Setter
    private Integer adultQuantity;
    @Getter
    @Setter
    private Double childPrice;
    @Getter
    @Setter
    private Integer childQuantity;
    @Getter
    @Setter
    private Double infantPrice;
    @Getter
    @Setter
    private Integer infantQuantity;
    /*@Getter
    @Setter
    private TripModel trip;*/

    @Getter
    @Setter
    private Long tripId;
}
