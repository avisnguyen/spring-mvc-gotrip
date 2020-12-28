package com.gotrip.controller.web;

import com.gotrip.entity.PlaceEntity;
import com.gotrip.model.PlaceModel;
import com.gotrip.model.TripModel;
import com.gotrip.service.IPlaceService;
import com.gotrip.service.ITripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TourController {
    @Autowired
    private IPlaceService placeService;

    @Autowired
    private ITripService tripService;

    @RequestMapping(value = "/tour", method = RequestMethod.GET)
    public ModelAndView tourPage(@RequestParam("page") int page,
                                 @RequestParam("limit") int limit,
                                 @RequestParam(value = "_sort", defaultValue = "gia-thap") String _sort) {
        ModelAndView mav = new ModelAndView("web/tour/tour");
        TripModel model = new TripModel();
        model.setPage(page);
        model.setLimit(limit);
        int sortCode = 1;
        String sort = "adultPrice";
        if (_sort.equals("sap-toi")) {
            sort = "departureTime";
            sortCode = 2;
        }
        Pageable pageable = new PageRequest(page - 1, limit, Sort.Direction.ASC, sort);
        model.setListResult(tripService.findAll(pageable));
        model.setTotalItem(tripService.getTotalItem());
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        mav.addObject("model", model);
        mav.addObject("MB", placeService.findAllMB());
        mav.addObject("MT", placeService.findAllMT());
        mav.addObject("MN", placeService.findAllMN());
        mav.addObject("sortCode", sortCode);
        return mav;
    }

    @RequestMapping(value = "/tour/chi-tiet", method = RequestMethod.GET)
    public ModelAndView tourDetailsPage(@RequestParam(value = "id", required = false) Long id) {
        ModelAndView mav = new ModelAndView("web/tour/chi-tiet");
        TripModel tripModel = new TripModel();
        if (id != null) {
            tripModel = tripService.findById(id);
        }
        TripModel relationTrip = new TripModel();
        relationTrip.setListResult(tripService.searchByName(tripModel.getDeparturePlace()));
        mav.addObject("model", tripModel);
        mav.addObject("relationTrip", relationTrip);
        mav.addObject("MB", placeService.findAllMB());
        mav.addObject("MT", placeService.findAllMT());
        mav.addObject("MN", placeService.findAllMN());
        return mav;
    }

    @RequestMapping(value = "/tour/dia-danh", method = RequestMethod.GET)
    public ModelAndView tourOfPlacePage(@RequestParam("placeId") int placeId,
                                        @RequestParam("page") int page,
                                        @RequestParam("limit") int limit,
                                        @RequestParam(value = "_sort", defaultValue = "gia-thap") String _sort) {
        ModelAndView mav = new ModelAndView("web/tour/danh-muc");
        TripModel model = new TripModel();
        model.setPage(page);
        model.setLimit(limit);
        int sortCode = 1;
        String sort = "adultPrice";
        if (_sort.equals("sap-toi")) {
            sort = "departureTime";
            sortCode = 2;
        }
        Pageable pageable = new PageRequest(page - 1, limit, Sort.Direction.ASC, sort);
        model.setListResult(tripService.findAllByPlace(placeId, pageable));
        model.setTotalItem((int) tripService.getTotalItemByPlace(placeId));
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        PlaceModel placeModel = placeService.findById(placeId);
        mav.addObject("model", model);
        mav.addObject("MB", placeService.findAllMB());
        mav.addObject("MT", placeService.findAllMT());
        mav.addObject("MN", placeService.findAllMN());
        mav.addObject("placeId", placeId);
        mav.addObject("placeModel", placeModel);
        mav.addObject("sortCode", sortCode);
        return mav;
    }
}
