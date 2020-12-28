package com.gotrip.api.admin;

import com.gotrip.model.PlaceModel;
import com.gotrip.service.IPlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class PlaceAPI {
    @Autowired
    private IPlaceService placeService;

    @PostMapping("/api/place")
    public PlaceModel createPlace(@RequestBody PlaceModel placeModel) {
        return placeService.save(placeModel);
    }

    @PutMapping("/api/place")
    public PlaceModel updatePlace(@RequestBody PlaceModel updatePlace) {
        return placeService.save(updatePlace);
    }

    @DeleteMapping("/api/place")
    public void deleteNew(@RequestBody long[] ids) {
        placeService.delete(ids);
    }
}
