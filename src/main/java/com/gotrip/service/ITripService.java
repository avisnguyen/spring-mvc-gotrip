package com.gotrip.service;

import com.gotrip.model.TripModel;
import org.springframework.data.domain.Pageable;

import java.util.Date;
import java.util.List;

public interface ITripService {
    List<TripModel> findAll(Pageable pageable);
    int getTotalItem();
    TripModel findById(long id);
    TripModel save(TripModel model);
    void delete(long[] ids);
    List<TripModel> findAllIdDesc();
    List<TripModel> findAllByPlace(TripModel model);
    List<TripModel> findAllByPlace(long placeId, Pageable pageable);
    long getTotalItemByPlace(long placeId);
    List<TripModel> searchByName(String keyword, Pageable pageable);
    List<TripModel> searchByName(String keyword);
    long getTotalItemByName(String keyword, String from, String to);
    List<TripModel> searchByNameAndDepartureTime(String keyword, String from, String to, Pageable pageable);
}
