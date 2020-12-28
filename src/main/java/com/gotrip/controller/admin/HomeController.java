package com.gotrip.controller.admin;

import com.gotrip.service.IPostService;
import com.gotrip.service.ITourService;
import com.gotrip.service.ITripService;
import com.gotrip.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
    @Autowired
    ITourService tourService;

    @Autowired
    IPostService postService;

    @Autowired
    IUserService userService;

    @Autowired
    ITripService tripService;

    @RequestMapping(value = "/quan-tri/trang-chu", method = RequestMethod.GET)
    public ModelAndView homePage() {
        ModelAndView mav = new ModelAndView("admin/home");
        mav.addObject("totalTour", tourService.getTotalItem());
        mav.addObject("totalUser", userService.getTotalItems());
        mav.addObject("totalPost", postService.getTotalItem());
        mav.addObject("totalTrip", tripService.getTotalItem());

        return mav;
    }

}