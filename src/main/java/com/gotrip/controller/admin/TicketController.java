package com.gotrip.controller.admin;

import com.gotrip.model.TicketModel;
import com.gotrip.service.ITicketService;
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
public class TicketController {

    @Autowired
    ITicketService ticketService;

    @RequestMapping(value = "/quan-tri/ve/danh-sach", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam("page") int page,
                                 @RequestParam("limit") int limit, HttpServletRequest request) {
        TicketModel model = new TicketModel();
        model.setPage(page);
        model.setLimit(limit);
        ModelAndView mav = new ModelAndView("admin/ticket/list");
        Pageable pageable = new PageRequest(page - 1, limit);
        model.setListResult(ticketService.findAll(pageable));
        if(model.getListResult().size()!=0) model.setTotalItem(model.getListResult().size());
        else model.setTotalItem(0);
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        mav.addObject("model", model);
        return mav;
    }
}
