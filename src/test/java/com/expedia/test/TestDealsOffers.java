package com.expedia.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.expedia.test.configuration.AppConfiguration;
import com.expedia.test.constants.AppConstants;
import com.expedia.test.model.HotelDeals;
import com.expedia.test.service.IHotelService;

/**
 *
 * @author Ihab
 */


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {AppConfiguration.class})
@WebAppConfiguration

public class TestDealsOffers {

	 @Autowired
	    private WebApplicationContext wac;

	    private MockMvc mockMvc;
	    
	    @Autowired
	    private IHotelService hotelService;
	    	    
	    
	    @Before
	    public void setup() {
	        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	    }
	    
	    @Test
	    public void getHotelOffers() throws Exception {
	    	HotelDeals hotelDeals = hotelService.getHotelDeals(AppConstants.URL);
	    	System.out.println("userId " + hotelDeals.getUserInfo().getUserId());
	    }	    
}
