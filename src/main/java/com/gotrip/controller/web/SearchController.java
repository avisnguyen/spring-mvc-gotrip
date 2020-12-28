package com.gotrip.controller.web;

import com.gotrip.model.TripModel;
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

import java.util.ArrayList;
import java.util.List;


@Controller(value = "searchControllerOfWeb")
public class SearchController {
    @Autowired
    ITripService tripService;

    @RequestMapping(value = "tour/tim-kiem-tour", method = RequestMethod.GET)
    public ModelAndView tourSearch(@RequestParam("keyword") String keyword,
                                   @RequestParam("from") String from,
                                   @RequestParam("to") String to,
                                   @RequestParam("page") int page,
                                   @RequestParam("limit") int limit,
                                   @RequestParam(value = "_sort", defaultValue = "gia-thap") String _sort) {
        ModelAndView mav = new ModelAndView("/web/tour/tim-kiem");
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
        model.setListResult(tripService.searchByNameAndDepartureTime(keyword, from, to, pageable));
        model.setTotalItem((int) tripService.getTotalItemByName(keyword, from, to));
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        mav.addObject("model", model);
        mav.addObject("totalResult", model.getTotalItem());
        mav.addObject("keyword", keyword);
        mav.addObject("from", from);
        mav.addObject("to", to);
        mav.addObject("sortCode",sortCode);
        return mav;
    }
}
