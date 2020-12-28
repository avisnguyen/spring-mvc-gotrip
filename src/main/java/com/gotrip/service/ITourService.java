package com.gotrip.service;

import com.gotrip.model.TourModel;
import com.gotrip.model.TourModel;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface ITourService {
    Map<String, String> findAll();
    List<TourModel> findAll(Pageable pageable);
    int getTotalItem();
    TourModel findById(long id);
    TourModel save(TourModel model);
    TourModel saveWeb(TourModel model);
    void delete(long ids[]);
}
