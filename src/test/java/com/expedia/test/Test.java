package com.expedia.test;

import com.expedia.test.constants.AppConstants;
import com.expedia.test.model.HotelDeals;
import com.expedia.test.service.imp.HotelServiceImp;

/**
 *
 * @author Test
 */
public class Test {

    public static void main(String[] args) {
        HotelServiceImp hotelService = new HotelServiceImp();
        HotelDeals hotelDeals = hotelService.getHotelDeals(AppConstants.URL);
        System.out.println(hotelDeals);
    }
}
