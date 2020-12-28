package com.gotrip.repository;

import com.gotrip.entity.TourEntity;
import com.gotrip.entity.TripEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface TripRepository extends JpaRepository<TripEntity, Long> {
    List<TripEntity> findAllByOrderByIdDesc();
    List<TripEntity> findAllByTour(TourEntity tourEntity);
    List<TripEntity> findByTourNameContaining(String key, Pageable pageable);
    List<TripEntity> findByTourNameContaining(String key);
    List<TripEntity> findByTourNameContainingAndDepartureTimeBetween(String key, Date fromDate, Date toDate, Pageable pageable);
    List<TripEntity> findByTourNameContainingAndDepartureTimeBetween(String key, Date fromDate, Date toDate);
    TripEntity findById(Long id);
    @Query("select tr from TripEntity tr join tr.tour tour join tour.places pl where pl.id = ?1")
    List<TripEntity> findByPlaceId(long PlaceId, Pageable pageable);

    @Query("select tr from TripEntity tr join tr.tour tour join tour.places pl where pl.id = ?1")
    List<TripEntity> findByPlaceId(long PlaceId);
}
