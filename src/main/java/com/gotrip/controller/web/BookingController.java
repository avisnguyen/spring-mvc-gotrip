package com.gotrip.controller.web;

import com.gotrip.converter.BillConverter;
import com.gotrip.converter.ContactInfoConverter;
import com.gotrip.converter.TicketConverter;
import com.gotrip.model.*;
import com.gotrip.service.*;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookingController {
    @Autowired
    private ITripService tripService;

    @Autowired
    private IPlaceService placeService;

    @Autowired
    private IBillService billService;

    @Autowired
    private ITicketService ticketService;

    @Autowired
    private IContactInfoService contactInfoService;

    @Autowired
    private BillConverter billConverter;

    @Autowired
    private TicketConverter ticketConverter;

    @Autowired
    private ContactInfoConverter contactInfoConverter;

    ModelMapper mapper = new ModelMapper();


    @RequestMapping(value = "/tour/dat-tour", method = RequestMethod.GET)
    public ModelAndView bookingPage(@RequestParam(value = "trip_id", required = false) Long tripId) {
        ModelAndView mav = new ModelAndView("/web/tour/booking");
        TripModel tripModel = new TripModel();
        BookingModel bookingModel = new BookingModel();
        if (tripId != null) {
            tripModel = tripService.findById(tripId);
        }
        mav.addObject("model", tripModel);
        mav.addObject("bookingModel", bookingModel);
        mav.addObject("MB", placeService.findAllMB());
        mav.addObject("MT", placeService.findAllMT());
        mav.addObject("MN", placeService.findAllMN());
        return mav;
    }

    @RequestMapping(value = "/tour/dat-tour", method = RequestMethod.POST)
    public ModelAndView processBooking(@ModelAttribute("bookingModel") BookingModel bookingModel, BindingResult resultBill, ModelMap modelBill) {
        BillModel billModel = billConverter.toModel(bookingModel);
        TicketModel ticketModel = ticketConverter.toModel(bookingModel);
        ContactInfoModel contactInfoModel = contactInfoConverter.toModel(bookingModel);
        BillModel newBill = billService.save(billModel);
        ticketModel.setBillId(newBill.getId());
        TicketModel newTicket = ticketService.save(ticketModel);
        contactInfoModel.setTicketId(newTicket.getId());
        contactInfoService.save(contactInfoModel);
        return new ModelAndView("redirect:/tour/dat-tour/thanh-cong");
    }

    @RequestMapping(value = "/tour/dat-tour/thanh-cong", method = RequestMethod.GET)
    public ModelAndView bookingSuccessPage() {
        ModelAndView mav = new ModelAndView("web/tour/booking-thanh-cong");
        mav.addObject("MB", placeService.findAllMB());
        mav.addObject("MT", placeService.findAllMT());
        mav.addObject("MN", placeService.findAllMN());
        return mav;
    }
}
