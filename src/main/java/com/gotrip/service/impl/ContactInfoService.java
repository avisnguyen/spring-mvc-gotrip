package com.gotrip.service.impl;

import com.gotrip.converter.ContactInfoConverter;
import com.gotrip.entity.ContactInfoEntity;
import com.gotrip.model.ContactInfoModel;
import com.gotrip.repository.ContactInfoRepository;
import com.gotrip.repository.TicketRepository;
import com.gotrip.service.IContactInfoService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ContactInfoService implements IContactInfoService {
    @Autowired
    ContactInfoRepository contactInfoRepository;

    @Autowired
    TicketRepository ticketRepository;

    @Autowired
    ContactInfoConverter contactInfoConverter;

    ModelMapper mapper = new ModelMapper();

    @Override
    public ContactInfoModel save(ContactInfoModel contactInfoModel) {
        ContactInfoModel result = new ContactInfoModel();
        ContactInfoEntity contactInfoEntity = contactInfoConverter.toEntity(contactInfoModel);
        contactInfoEntity.setTicket(ticketRepository.findOne(contactInfoModel.getTicketId()));
        result = mapper.map(contactInfoRepository.save(contactInfoEntity), ContactInfoModel.class);
        return result;
    }
}
