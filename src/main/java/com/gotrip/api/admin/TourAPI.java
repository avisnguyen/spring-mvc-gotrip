package com.gotrip.api.admin;

import com.gotrip.model.TourModel;
import com.gotrip.service.ITourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "tourAPIOfAdmin")
public class TourAPI {
    @Autowired
    private ITourService tourService;

    @PostMapping("/api/tour")
    public TourModel createTour(@RequestBody TourModel tourModel) {
        return tourService.save(tourModel);
    }

    @PutMapping("api/tour")
    public TourModel updateTour(@RequestBody TourModel tourModel){
        return tourService.save(tourModel);
    }
}
