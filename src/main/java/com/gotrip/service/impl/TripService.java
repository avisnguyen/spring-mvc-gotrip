package com.gotrip.service.impl;

import com.gotrip.converter.TripConverter;
import com.gotrip.entity.PlaceEntity;
import com.gotrip.entity.TourEntity;
import com.gotrip.entity.TripEntity;
import com.gotrip.model.TripModel;
import com.gotrip.repository.PlaceRepository;
import com.gotrip.repository.TourRepository;
import com.gotrip.repository.TripRepository;
import com.gotrip.service.ITripService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class TripService implements ITripService {
    @Autowired
    private TripRepository tripRepository;

    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private TripConverter tripConverter;

    @Autowired
    private PlaceRepository placeRepository;

    ModelMapper modelMapper = new ModelMapper();

    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

    /*Admin*/
    @Override
    public List<TripModel> findAll(Pageable pageable) {
        List<TripModel> models = new ArrayList<>();
        List<TripEntity> entities = tripRepository.findAll(pageable).getContent();
        for (TripEntity item : entities) {
            TripModel tripModel = modelMapper.map(item, TripModel.class);
            models.add(tripModel);
        }
        return models;
    }

    @Override
    public int getTotalItem() {
        return (int) tripRepository.count();
    }

    @Override
    public TripModel findById(long id) {
        TripEntity entity = tripRepository.findOne(id);
        return modelMapper.map(entity, TripModel.class);
    }

    @Override
    @Transactional
    public TripModel save(TripModel model) {
        TourEntity tour = tourRepository.findOneByName(model.getTourName());
        TripEntity tripEntity = new TripEntity();
        if (model.getId() != null) {
            TripEntity oldNew = tripRepository.findOne(model.getId());
            oldNew.setTour(tour);
            tripEntity = tripConverter.toEntity(oldNew, model);
        } else {
            tripEntity = tripConverter.toEntity(model);
            tripEntity.setTour(tour);
        }
        TripModel result = modelMapper.map(tripRepository.save(tripEntity), TripModel.class);
        return result;
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id : ids) {
            tripRepository.delete(id);
        }
    }

    @Override
    public List<TripModel> findAllIdDesc() {
        List<TripModel> models = new ArrayList<>();
        List<TripEntity> entities = tripRepository.findAllByOrderByIdDesc();
        for (TripEntity item : entities) {
            TripModel tripModel = modelMapper.map(item, TripModel.class);
            models.add(tripModel);
        }
        return models;
    }

    @Override
    public List<TripModel> findAllByPlace(TripModel model) {
        List<TourEntity> tourEntityList = new ArrayList<>();
        for (int i = 0; i < model.getTour().getPlaceName().size(); i++) {
            PlaceEntity placeEntity = placeRepository.findOneByName(model.getTour().getPlaceName().get(i));
            String placeName = placeEntity.getName();
            tourEntityList.add((TourEntity) tourRepository.findAllByPlaces(placeName));
        }
        List<TripEntity> tripEntities = new ArrayList<>();
        for (TourEntity item : tourEntityList) {
            tripEntities = tripRepository.findAllByTour(item);
        }
        return null;
    }

    @Override
    public List<TripModel> findAllByPlace(long placeId, Pageable pageable) {
        List<TripModel> result = new ArrayList<>();
        List<TripEntity> tripEntities = tripRepository.findByPlaceId(placeId, pageable);
        for (TripEntity tripEntity :
                tripEntities) {
            result.add(modelMapper.map(tripEntity, TripModel.class));
        }
        return result;
    }

    @Override
    public long getTotalItemByPlace(long placeId) {
        return tripRepository.findByPlaceId(placeId).stream().count();
    }

    @Override
    public List<TripModel> searchByName(String keyword, Pageable pageable) {
        List<TripModel> models = new ArrayList<>();
        List<TripEntity> tripEntities = tripRepository.findByTourNameContaining(keyword, pageable);
        for (TripEntity tripEntity :
                tripEntities) {
            models.add(modelMapper.map(tripEntity, TripModel.class));
        }
        return models;
    }

    @Override
    public List<TripModel> searchByName(String keyword) {
        List<TripModel> models = new ArrayList<>();
        List<TripEntity> tripEntities = tripRepository.findByTourNameContaining(keyword);
        for (TripEntity tripEntity :
                tripEntities) {
            models.add(modelMapper.map(tripEntity, TripModel.class));
        }
        return models;
    }

    @Override
    public long getTotalItemByName(String keyword, String from, String to) {
        Date fromDate = null;
        Date toDate = null;
        try {
            Date today = new Date();
            if (from == "") fromDate = today;
            else
                fromDate = formatter.parse(from);
            if (fromDate.before(today)) fromDate = today;
            if (to == "") to = "01/01/2999";
            toDate = formatter.parse(to);
            return tripRepository.findByTourNameContainingAndDepartureTimeBetween(keyword, fromDate, toDate).size();
        } catch (ParseException e) {
            e.printStackTrace();
            return 0;
        }


    }

    @Override
    public List<TripModel> searchByNameAndDepartureTime(String keyword, String from, String to, Pageable pageable) {
        List<TripModel> models = new ArrayList<>();
        Date fromDate = null;
        Date toDate = null;
        try {
            Date today = new Date();
            if (from == "") fromDate = today;
            else
                fromDate = formatter.parse(from);
            if (fromDate.before(today)) fromDate = today;
            if (to == "") to = "01/01/2999";
            toDate = formatter.parse(to);
            List<TripEntity> tripEntities =
                    tripRepository.findByTourNameContainingAndDepartureTimeBetween(keyword, fromDate, toDate, pageable);
            for (TripEntity tripEntity :
                    tripEntities) {
                models.add(modelMapper.map(tripEntity, TripModel.class));
            }
            return models;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
