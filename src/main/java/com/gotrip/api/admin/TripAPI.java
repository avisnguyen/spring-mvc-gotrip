package com.gotrip.api.admin;

import com.gotrip.model.TripModel;
import com.gotrip.service.ITripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "tripAPIOfAdmin")
public class TripAPI {
    @Autowired
    private ITripService tripService;

    @PostMapping("/api/trip")
    public TripModel createTrip(@RequestBody TripModel tripModel) {
        return tripService.save(tripModel);
    }

    @PutMapping("/api/trip")
    public TripModel updateTrip(@RequestBody TripModel updateTrip) {
        return tripService.save(updateTrip);
    }

    @DeleteMapping("/api/trip")
    public void deleteTrip(@RequestBody long[] ids) {
        tripService.delete(ids);
    }
}
