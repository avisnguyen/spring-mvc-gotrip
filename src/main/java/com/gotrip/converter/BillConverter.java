package com.gotrip.converter;

import com.gotrip.entity.BillEntity;
import com.gotrip.model.BillModel;
import com.gotrip.model.BookingModel;
import org.springframework.stereotype.Component;

@Component
public class BillConverter {
    public BillModel toModel(BookingModel model){
        BillModel result = new BillModel();
        result.setAdultPrice(model.getAdultPrice());
        result.setAdultQuantity(model.getAdultQuantity());
        result.setChildPrice(model.getChildPrice());
        result.setChildQuantity(model.getChildQuantity());
        result.setInfantPrice(model.getInfantPrice());
        result.setInfantQuantity(model.getInfantQuantity());
        result.setTripId(model.getTripId());
        return result;
    }

    public BillEntity toEntity(BillModel model){
        BillEntity result = new BillEntity();
        result.setAdultPrice(model.getAdultPrice());
        result.setAdultQuantity(model.getAdultQuantity());
        result.setChildPrice(model.getChildPrice());
        result.setChildQuantity(model.getChildQuantity());
        result.setInfantPrice(model.getInfantPrice());
        result.setInfantQuantity(model.getInfantQuantity());
        return result;
    }
}
