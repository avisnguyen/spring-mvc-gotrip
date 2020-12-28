package com.gotrip.controller.web;

import com.gotrip.model.PlaceModel;
import com.gotrip.model.PostModel;
import com.gotrip.model.TripModel;
import com.gotrip.service.IPlaceService;
import com.gotrip.service.IPostService;
import com.gotrip.service.ITripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
    @Autowired
    private IPostService postService;

    @Autowired
    private ITripService tripService;

    @Autowired
    private IPlaceService placeService;

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView homePage(){
        ModelAndView mav = new ModelAndView("web/home");
        PostModel postModel = new PostModel();
        TripModel tripModel = new TripModel();
        postModel.setListResult(postService.findAllIdDesc());
        tripModel.setListResult(tripService.findAllIdDesc());
        mav.addObject("postModel", postModel);
        mav.addObject("tripModel",tripModel);
        /*mav.addObject("tripOfPlace", tripService.findAllByPlace(tripModel));*/

        mav.addObject("MB",placeService.findAllMB());
        mav.addObject("MT",placeService.findAllMT());
        mav.addObject("MN",placeService.findAllMN());
        return mav;
    }
    @RequestMapping(value = "/thoat", method = RequestMethod.GET)
    public ModelAndView logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return new ModelAndView("redirect:/dang-nhap");
    }
}
