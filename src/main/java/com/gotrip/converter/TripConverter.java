package com.gotrip.converter;

import com.gotrip.entity.TripEntity;
import com.gotrip.model.TripModel;
import org.springframework.stereotype.Component;

@Component
public class TripConverter {
    public TripEntity toEntity(TripEntity result, TripModel model){
        result.setCode(model.getCode());
        result.setAdultPrice(model.getAdultPrice());
        result.setChildPrice(model.getChildPrice());
        result.setInfantPrice(model.getInfantPrice());
        result.setDeparturePlace(model.getDeparturePlace());
        result.setDepartureTime(model.getDepartureTime());
        result.setReturnTime(model.getReturnTime());
        return result;
    }
    public TripEntity toEntity(TripModel model){
        TripEntity result = new TripEntity();
        result.setCode(model.getCode());
        result.setAdultPrice(model.getAdultPrice());
        result.setChildPrice(model.getChildPrice());
        result.setInfantPrice(model.getInfantPrice());
        result.setDeparturePlace(model.getDeparturePlace());
        result.setDepartureTime(model.getDepartureTime());
        result.setReturnTime(model.getReturnTime());
        return result;
    }
}
