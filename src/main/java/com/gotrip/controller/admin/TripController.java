package com.gotrip.controller.admin;

import com.gotrip.model.TripModel;
import com.gotrip.service.IPlaceService;
import com.gotrip.service.ITourService;
import com.gotrip.service.ITripService;
import com.gotrip.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller(value = "tripControllerOfAdmin")
public class TripController {
    @Autowired
    private ITripService tripService;

    @Autowired
    private ITourService tourService;

    @Autowired
    private IPlaceService placeService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "/quan-tri/trip/danh-sach", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam("page") int page,
                                 @RequestParam("limit") int limit, HttpServletRequest request) {
        TripModel model = new TripModel();
        model.setPage(page);
        model.setLimit(limit);
        ModelAndView mav = new ModelAndView("admin/trip/list");
        Pageable pageable = new PageRequest(page - 1, limit);
        model.setListResult(tripService.findAll(pageable));
        model.setTotalItem(tripService.getTotalItem());
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("model", model);
        return mav;
    }

    @RequestMapping(value = "/quan-tri/trip/chinh-sua", method = RequestMethod.GET)
    public ModelAndView editNew(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/trip/edit");
        TripModel model = new TripModel();
        if (id != null) {
            model = tripService.findById(id);
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("tours", tourService.findAll());
        mav.addObject("place", placeService.findAll());
        mav.addObject("model", model);
        return mav;
    }
}
