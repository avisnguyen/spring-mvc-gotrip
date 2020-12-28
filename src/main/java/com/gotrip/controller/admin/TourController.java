package com.gotrip.controller.admin;

import com.gotrip.model.TourModel;
import com.gotrip.service.IPlaceService;
import com.gotrip.service.ITourService;
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

@Controller(value = "tourControllerOfAdmin")
public class TourController {
    @Autowired
    private ITourService tourService;

    @Autowired
    private IPlaceService placeService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "/quan-tri/tour/danh-sach", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam("page") int page,
                                 @RequestParam("limit") int limit, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/tour/list");
        TourModel tourModel = new TourModel();
        tourModel.setPage(page);
        tourModel.setLimit(limit);
        Pageable pageable = new PageRequest(page - 1, limit);
        tourModel.setListResult(tourService.findAll(pageable));
        tourModel.setTotalItem((int) tourService.getTotalItem());
        tourModel.setTotalPage((int) Math.ceil((double) tourModel.getTotalItem() / tourModel.getLimit()));


        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("model", tourModel);
        return mav;
    }

    @RequestMapping(value = "/quan-tri/tour/chinh-sua", method = RequestMethod.GET)
    public ModelAndView editTour(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/tour/edit");
        TourModel tourModel = new TourModel();
        if (id != null) {
            tourModel = tourService.findById(id);
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("place", placeService.findAll());
        mav.addObject("model", tourModel);
        return mav;
    }
}
