package com.expedia.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.expedia.test.constants.AppConstants;
import com.expedia.test.model.HotelDeals;
import com.expedia.test.model.OffersFilterFormRequest;
import com.expedia.test.service.IHotelService;

@Controller
public class HotelController {

    @Autowired
    private IHotelService hotelService;

    
    @RequestMapping(value = {"/", "/offers"}, method = RequestMethod.GET)
    public ModelAndView getHotelOffers() {

    	HotelDeals hotelOffer = hotelService.getHotelDeals(AppConstants.URL);
        ModelAndView model = new ModelAndView("index");
        model.addObject("offers", hotelOffer.getOffers().getHotel());

        return model;
    }
    
    @RequestMapping(value = "/offers/filter", method = RequestMethod.GET)
    public ModelAndView getHotelOffers(@ModelAttribute("offersFilterForm") OffersFilterFormRequest offersFilterFormRequest) {
 
        HotelDeals hotelDeals = hotelService.getHotelDeals(AppConstants.URL + offersFilterFormRequest.toString());
        ModelAndView model = new ModelAndView("index");
        model.addObject("offers", hotelDeals.getOffers().getHotel());
        model.addObject("offerFilterRequset", offersFilterFormRequest);
        return model;
    }
    
}
