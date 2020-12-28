package com.gotrip.api.admin;

import com.gotrip.model.ParentPlaceModel;
import com.gotrip.service.IParentPlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class ParentPlaceAPI {
    @Autowired
    private IParentPlaceService parentPlaceService;

    @PostMapping("/api/parentPalce")
    public ParentPlaceModel createParentPlace(@RequestBody ParentPlaceModel parentPlaceModel) {
        return parentPlaceService.save(parentPlaceModel);
    }

    @PutMapping("/api/parentPalce")
    public ParentPlaceModel updateParentPlace(@RequestBody ParentPlaceModel updateParentPlace) {
        return parentPlaceService.save(updateParentPlace);
    }

    @DeleteMapping("/api/parentPalce")
    public void deleteNew(@RequestBody long[] ids) {
        parentPlaceService.delete(ids);
    }
}
