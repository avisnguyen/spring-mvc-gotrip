package com.gotrip.service.impl;

import com.gotrip.converter.BillConverter;
import com.gotrip.entity.BillEntity;
import com.gotrip.entity.TripEntity;
import com.gotrip.model.BillModel;
import com.gotrip.model.CategoryModel;
import com.gotrip.repository.BillRepository;
import com.gotrip.repository.TripRepository;
import com.gotrip.service.IBillService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BillService implements IBillService {
    @Autowired
    private BillRepository billRepository;

    @Autowired
    private TripRepository tripRepository;

    @Autowired
    private BillConverter billConverter;

    ModelMapper modelMapper = new ModelMapper();

    @Override
    public BillModel save(BillModel model) {
        TripEntity tripEntity = tripRepository.findOne(model.getTripId());
        BillEntity billEntity = billConverter.toEntity(model);
        billEntity.setTrip(tripEntity);
        BillModel result = modelMapper.map(billRepository.save(billEntity), BillModel.class);
        return result;
    }
}
