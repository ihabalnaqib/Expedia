package com.expedia.test.model;

import java.io.Serializable;

import com.google.gson.annotations.SerializedName;

public class OfferInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@SerializedName("siteID")
	private String siteId;
	private String language;
	private String currency;
	private String userSelectedCurrency;

	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getUserSelectedCurrency() {
		return userSelectedCurrency;
	}

	public void setUserSelectedCurrency(String userSelectedCurrency) {
		this.userSelectedCurrency = userSelectedCurrency;
	}

}
