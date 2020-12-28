package com.gotrip.converter;

import com.gotrip.entity.TicketEntity;
import com.gotrip.model.BookingModel;
import com.gotrip.model.TicketModel;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Component
public class TicketConverter {
    SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");

    public TicketModel toModel(BookingModel model){
        TicketModel result = new TicketModel();
        result.setDuringTime(model.getDuringTime());
        result.setDescription(model.getDescription());
        result.setTransport((model.getTransport()));
        result.setDeparturePlace(model.getDeparturePlace());
        try {
            result.setDepartureTime(format.parse(model.getDepartureTime()));
            result.setReturnTime(format.parse(model.getReturnTime()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        result.setReturnPlace(model.getReturnPlace());

        result.setBillId(model.getBillId());
        result.setUserId(model.getUserId());
        return result;
    }

    public TicketEntity toEntity(TicketModel model){
        TicketEntity result = new TicketEntity();
        result.setDuringTime(model.getDuringTime());
        result.setDescription(model.getDescription());
        result.setTransport((model.getTransport()));
        result.setDeparturePlace(model.getDeparturePlace());
        result.setDepartureTime(model.getDepartureTime());
        result.setReturnPlace(model.getReturnPlace());
        result.setReturnTime(model.getReturnTime());
        return result;
    }
}
