package com.expedia.test.model;

public class HotelPricingInfo {

	private float averagePriceValue;
	private float totalPriceValue;
	private float crossOutPriceValue;
	private float originalPricePerNight;
	private String currency;
	private float percentSavings;
	private boolean drr;

	public float getAveragePriceValue() {
		return averagePriceValue;
	}

	public void setAveragePriceValue(float averagePriceValue) {
		this.averagePriceValue = averagePriceValue;
	}

	public float getTotalPriceValue() {
		return totalPriceValue;
	}

	public void setTotalPriceValue(float totalPriceValue) {
		this.totalPriceValue = totalPriceValue;
	}

	public float getCrossOutPriceValue() {
		return crossOutPriceValue;
	}

	public void setCrossOutPriceValue(float crossOutPriceValue) {
		this.crossOutPriceValue = crossOutPriceValue;
	}

	public float getOriginalPricePerNight() {
		return originalPricePerNight;
	}

	public void setOriginalPricePerNight(float originalPricePerNight) {
		this.originalPricePerNight = originalPricePerNight;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public float getPercentSavings() {
		return percentSavings;
	}

	public void setPercentSavings(float percentSavings) {
		this.percentSavings = percentSavings;
	}

	public boolean isDrr() {
		return drr;
	}

	public void setDrr(boolean drr) {
		this.drr = drr;
	}
}