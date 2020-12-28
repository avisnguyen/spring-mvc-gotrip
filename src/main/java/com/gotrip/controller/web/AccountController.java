package com.gotrip.controller.web;

import com.gotrip.entity.UserEntity;
import com.gotrip.model.UserModel;
import com.gotrip.repository.UserRepository;
import com.gotrip.service.IPlaceService;
import com.gotrip.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AccountController {
    @Autowired
    private IUserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private IPlaceService placeService;

    @RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
    public ModelAndView loginPage(){
        ModelAndView mav = new ModelAndView("web/dang-nhap");
        mav.addObject("MB",placeService.findAllMB());
        mav.addObject("MT",placeService.findAllMT());
        mav.addObject("MN",placeService.findAllMN());
        return mav;
    }

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public ModelAndView accessDenied() {
        return new ModelAndView("redirect:/dang-nhap?accessDenied");
    }

    @RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
    public ModelAndView registerPage() {
        ModelAndView mav = new ModelAndView("web/dang-ky");
        UserModel model = new UserModel();
        mav.addObject("user", model);
        mav.addObject("MB",placeService.findAllMB());
        mav.addObject("MT",placeService.findAllMT());
        mav.addObject("MN",placeService.findAllMN());
        return mav;
    }
    @RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
    public ModelAndView registerProcessPage(@ModelAttribute("user") UserModel userModel, BindingResult result, Model model){
        UserEntity user = userRepository.findByEmail(userModel.getEmail());
        ModelAndView mav = new ModelAndView("web/dang-ky");
        mav.addObject("MB",placeService.findAllMB());
        mav.addObject("MT",placeService.findAllMT());
        mav.addObject("MN",placeService.findAllMN());
        if(user != null){

            mav.addObject("message","Email đã tồn tại trong hệ thống!");
            mav.addObject("alert","danger");
            return mav;
        }
        else {
            mav = new ModelAndView("web/dang-nhap");
            mav.addObject("message","Đăng ký thành công");
            mav.addObject("alert","success");
            userService.saveWeb(userModel);
            return mav;
        }
    }

}
