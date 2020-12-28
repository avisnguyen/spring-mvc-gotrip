package com.gotrip.controller.admin;

import com.gotrip.model.PlaceModel;
import com.gotrip.service.IParentPlaceService;
import com.gotrip.service.IPlaceService;
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

@Controller(value = "placeControllerOfAdmin")
public class PlaceController {
    @Autowired
    private IPlaceService placeService;

    @Autowired
    private IParentPlaceService parentPlaceService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "/quan-tri/dia-diem/danh-sach", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam("page") int page,
                                 @RequestParam("limit") int limit, HttpServletRequest request) {
        PlaceModel model = new PlaceModel();
        model.setPage(page);
        model.setLimit(limit);
        ModelAndView mav = new ModelAndView("admin/place/list");
        Pageable pageable = new PageRequest(page - 1, limit);
        model.setListResult(placeService.findAll(pageable));
        model.setTotalItem(placeService.getTotalItem());
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("model", model);
        return mav;
    }

    @RequestMapping(value = "/quan-tri/dia-diem/chinh-sua", method = RequestMethod.GET)
    public ModelAndView editNew(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/place/edit");
        PlaceModel model = new PlaceModel();
        if (id != null) {
            model = placeService.findById(id);
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("parentPlaces", parentPlaceService.findAll());
        mav.addObject("model", model);
        return mav;
    }
}
