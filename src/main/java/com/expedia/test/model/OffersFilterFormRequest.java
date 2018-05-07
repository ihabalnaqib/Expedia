package com.expedia.test.model;

import java.io.Serializable;

public class OffersFilterFormRequest implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String destinationName;
	private String minTripStartDate;
	private String maxTripStartDate;
	private String lengthOfStay;
	private String minStarRating;
	private String maxStarRating;
	private String minTotalRate;
	private String maxTotalRate;
	private String minGuestRating;
	private String maxGuestRating;

	public String getDestinationName() {
		return destinationName;
	}

	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
	}

	public String getMinTripStartDate() {
		return minTripStartDate;
	}

	public void setMinTripStartDate(String minTripStartDate) {
		this.minTripStartDate = minTripStartDate;
	}

	public String getMaxTripStartDate() {
		return maxTripStartDate;
	}

	public void setMaxTripStartDate(String maxTripStartDate) {
		this.maxTripStartDate = maxTripStartDate;
	}

	public String getLengthOfStay() {
		return lengthOfStay;
	}

	public void setLengthOfStay(String lengthOfStay) {
		this.lengthOfStay = lengthOfStay;
	}

	public String getMinStarRating() {
		return minStarRating;
	}

	public void setMinStarRating(String minStarRating) {
		this.minStarRating = minStarRating;
	}

	public String getMaxStarRating() {
		return maxStarRating;
	}

	public void setMaxStarRating(String maxStarRating) {
		this.maxStarRating = maxStarRating;
	}

	public String getMinTotalRate() {
		return minTotalRate;
	}

	public void setMinTotalRate(String minTotalRate) {
		this.minTotalRate = minTotalRate;
	}

	public String getMaxTotalRate() {
		return maxTotalRate;
	}

	public void setMaxTotalRate(String maxTotalRate) {
		this.maxTotalRate = maxTotalRate;
	}

	public String getMinGuestRating() {
		return minGuestRating;
	}

	public void setMinGuestRating(String minGuestRating) {
		this.minGuestRating = minGuestRating;
	}

	public String getMaxGuestRating() {
		return maxGuestRating;
	}

	public void setMaxGuestRating(String maxGuestRating) {
		this.maxGuestRating = maxGuestRating;
	}

	@Override
	public String toString() {
		
		StringBuilder params = new StringBuilder();

        if (! destinationName.equals("")) {
            params.append("&destinationName=");
            params.append(destinationName);
        }
        if (! minTripStartDate.equals("")) {
            params.append("&minTripStartDate=");
            params.append(minTripStartDate);
        }
        if (! maxTripStartDate.equals("")) {
            params.append("&maxTripStartDate=");
            params.append(maxTripStartDate);
        }
        if (! lengthOfStay.equals("")) {
            params.append("&lengthOfStay=");
            params.append(lengthOfStay);
        }
        if (! minStarRating.equals("0")) {
            params.append("&minStarRating=");
            params.append(minStarRating);
        }
        if (! maxStarRating.equals("0")) {
            params.append("&maxStarRating=");
            params.append(maxStarRating);
        }
        if (! minTotalRate.equals("0")) {
            params.append("&minTotalRate=");
            params.append(minTotalRate);
        }
        if (! maxTotalRate.equals("0")) {
            params.append("&maxTotalRate=");
            params.append(maxTotalRate);
        }
        if (! minGuestRating.equals("0")) {
            params.append("&minGuestRating=");
            params.append(minGuestRating);
        }
        if (! maxGuestRating.equals("0")) {
            params.append("&maxGuestRating=");
            params.append(maxGuestRating);
        }
        
        return params.toString();
    }
	
}