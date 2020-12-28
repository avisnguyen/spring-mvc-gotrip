package com.gotrip.service;

import com.gotrip.model.TicketModel;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ITicketService {
    TicketModel save(TicketModel ticketModel);
    List<TicketModel> findAll(Pageable pageable);
}
