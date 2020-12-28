package com.gotrip.controller.admin;

import com.gotrip.model.ParentPlaceModel;
import com.gotrip.service.IParentPlaceService;
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

@Controller
public class ParentPlaceController {
    @Autowired
    private IParentPlaceService parentPlaceService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "/quan-tri/khu-vuc/danh-sach", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam("page") int page,
                                 @RequestParam("limit") int limit, HttpServletRequest request) {
        ParentPlaceModel model = new ParentPlaceModel();
        model.setPage(page);
        model.setLimit(limit);
        ModelAndView mav = new ModelAndView("admin/parentPlace/list");
        Pageable pageable = new PageRequest(page - 1, limit);
        model.setListResult(parentPlaceService.findAll(pageable));
        model.setTotalItem(parentPlaceService.getTotalItem());
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("model", model);
        return mav;
    }

    @RequestMapping(value = "/quan-tri/khu-vuc/chinh-sua", method = RequestMethod.GET)
    public ModelAndView editNew(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/parentPlace/edit");
        ParentPlaceModel model = new ParentPlaceModel();
        if (id != null) {
            model = parentPlaceService.findById(id);
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("categories", parentPlaceService.findAll());
        mav.addObject("model", model);
        return mav;
    }
}
