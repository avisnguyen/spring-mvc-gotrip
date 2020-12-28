package com.gotrip.repository;

import com.gotrip.entity.TourEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TourRepository extends JpaRepository<TourEntity, Long> {
    List<TourEntity> findAll();
    TourEntity findOneByName(String name);
    List<TourEntity> findAllByPlaces(String place);
}
