package com.gotrip.service.impl;

import com.gotrip.converter.TicketConverter;
import com.gotrip.entity.TicketEntity;
import com.gotrip.entity.TicketEntity;
import com.gotrip.model.TicketModel;
import com.gotrip.model.TicketModel;
import com.gotrip.repository.BillRepository;
import com.gotrip.repository.TicketRepository;
import com.gotrip.repository.UserRepository;
import com.gotrip.service.ITicketService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class TicketService implements ITicketService {
    @Autowired
    TicketRepository ticketRepository;

    @Autowired
    BillRepository billRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    TicketConverter ticketConverter;


    ModelMapper mapper = new ModelMapper();

    @Override
    public TicketModel save(TicketModel ticketModel) {
        TicketModel result = new TicketModel();
        TicketEntity ticketEntity  = ticketConverter.toEntity(ticketModel);
        ticketEntity.setBill(billRepository.findOne(ticketModel.getBillId()));
        ticketEntity.setUser(userRepository.findOne(ticketModel.getUserId()));
        result = mapper.map(ticketRepository.save(ticketEntity), TicketModel.class);
        return result;
    }

    @Override
    public List<TicketModel> findAll(Pageable pageable) {
        List<TicketModel> models = new ArrayList<>();
        List<TicketEntity> entities = ticketRepository.findAll(pageable).getContent();
        for (TicketEntity item : entities) {
            TicketModel tripModel = mapper.map(item, TicketModel.class);
            models.add(tripModel);
        }
        return models;
    }
}
