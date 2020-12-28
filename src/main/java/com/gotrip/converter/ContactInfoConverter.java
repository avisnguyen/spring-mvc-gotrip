package com.gotrip.converter;

import com.gotrip.entity.ContactInfoEntity;
import com.gotrip.model.BookingModel;
import com.gotrip.model.ContactInfoModel;
import org.springframework.stereotype.Component;

@Component
public class ContactInfoConverter {
    public ContactInfoModel toModel(BookingModel model) {
        ContactInfoModel result = new ContactInfoModel();
        result.setFirstName(model.getFirstName());
        result.setLastName(model.getLastName());
        result.setPhone(model.getPhone());
        result.setAddress(model.getAddress());
        result.setEmail(model.getEmail());
        result.setNationality(model.getNationality());
        result.setTicketId(model.getTicketId());
        return result;
    }

    public ContactInfoEntity toEntity(ContactInfoModel model) {
        ContactInfoEntity result = new ContactInfoEntity();
        result.setFirstName(model.getFirstName());
        result.setLastName(model.getLastName());
        result.setPhone(model.getPhone());
        result.setAddress(model.getAddress());
        result.setEmail(model.getEmail());
        result.setNationality(model.getNationality());
        return result;
    }
}
