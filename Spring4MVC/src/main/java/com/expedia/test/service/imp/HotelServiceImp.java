package com.expedia.test.service.imp;

import java.net.URL;
import java.util.Scanner;

import org.springframework.stereotype.Service;

import com.expedia.test.model.HotelDeals;
import com.expedia.test.service.IHotelService;
import com.google.gson.Gson;

@Service("hotelServiceImp")
public class HotelServiceImp implements IHotelService {

    @Override
	public HotelDeals getHotelDeals(String hostUrl) {
		 try{
        	 URL url = new URL(hostUrl);
        	 String response = new Scanner( url.openStream()).useDelimiter("\\A").next();
             
         	Gson gson = new Gson();
         	HotelDeals hotelOffer = gson.fromJson(response, HotelDeals.class);
         	return hotelOffer;
         	
         }catch(Exception e){
        	 System.out.println("ex" + e);
         }
         return null;
	}
}
