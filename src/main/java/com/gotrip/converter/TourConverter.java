package com.gotrip.converter;

import com.gotrip.entity.TourEntity;
import com.gotrip.entity.TourEntity;
import com.gotrip.model.TourModel;
import com.gotrip.model.TourModel;
import org.springframework.stereotype.Component;

@Component
public class TourConverter {
    public TourEntity toEntity(TourEntity result, TourModel model){
        result.setName(model.getName());
        result.setSubtitle(model.getSubtitle());
        result.setThumbnailUrl(model.getThumbnailUrl());
        result.setDescription(model.getDescription());
        result.setDuringTime(model.getDuringTime());
        result.setDeparture(model.getDeparture());
        result.setDestination(model.getDestination());
        result.setItinerary(model.getItinerary());
        result.setTermAndCondition(model.getTermAndCondition());
        result.setFaq(model.getFaq());
        return result;
    }
}
