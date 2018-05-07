package com.expedia.test.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class Offers {

    @SerializedName("Hotel")
    private List<Hotel> hotel;

	public List<Hotel> getHotel() {
		return hotel;
	}

	public void setHotel(List<Hotel> hotel) {
		this.hotel = hotel;
	}
}
