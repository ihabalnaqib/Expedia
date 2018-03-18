package com.expedia.test.model;

import java.io.Serializable;

public class HotelDeals implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private OfferInfo offerInfo;
	private UserInfo userInfo;
	private Offers offers;

	public OfferInfo getOfferInfo() {
		return offerInfo;
	}

	public void setOfferInfo(OfferInfo offerInfo) {
		this.offerInfo = offerInfo;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public Offers getOffers() {
		return offers;
	}

	public void setOffers(Offers offers) {
		this.offers = offers;
	}

}
