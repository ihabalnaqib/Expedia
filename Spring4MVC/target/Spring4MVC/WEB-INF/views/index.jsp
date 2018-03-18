<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel deals</title>
        <style>
            html, body {
                height: 100%;
                margin: 0px;
            }
            .input_text{
                background-color: rgba(214, 227, 43, 0.80);
                border: 1px solid;
                border-color: silver;
                color: blue;
                border-radius: 4px;
                width: 150px;
                padding-left: 10px;
            }
            .input_select{
                background-color: rgba(214, 227, 43, 0.80);
                border: 1px solid;
                border-color: silver;
                color: blue;
                border-radius: 4px;
                width: 160px;
                padding-left: 10px;
            }            
            .black_overlay {
                display: none;
                position: fixed;
                top: 0%;
                left: 0%;
                width: 100%;
                height: 100%;
                background-color: black;
                z-index: 1001;
                -moz-opacity: 0.8;
                opacity: .80;
                filter: alpha(opacity=80);
            }
            .white_content {
                display: none;
                position: fixed  !important;
                top: 25%;
                left: 25%;
                width: 50%;
                height: 50%;
                padding: 16px;
                border: 10px solid gold;
                background-color: white;
                z-index: 1002;
                overflow: auto;
            }

            .tooltip  {
                position: relative;
                display: inline-block;
                border-bottom: 1px dotted black;
            }

            .nontooltip  {
                position: relative;
                display: inline-block;
                border-bottom: 1px dotted black;
            }            

            .tooltip  .tooltiptext {
                visibility: hidden;
                width: 250px;
                height: 250px;
                white-space: pre-line;
                background-color: #d97e1c;
                color: #fff;
                text-align: left;
                border-radius: 6px;
                padding: 10px 10px 10px 10px;

                /* Position the tooltip */
                position: absolute;
                z-index: 1;
            }

            .tooltip:hover .tooltiptext {
                visibility: visible;
            }            
        </style>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#maxTripStartDate").datepicker({
                    dateFormat: "yy-mm-dd"
                });
            });
            $(function () {
                $("#minTripStartDate").datepicker({
                    dateFormat: "yy-mm-dd"
                });
            });
            function initMap(lat1, lng1) {
                if (lat1 && lng1) {
                    document.getElementById('map').style.display = 'block';
                    document.getElementById('fade').style.display = 'block';
                    var uluru = {lat: lat1, lng: lng1};
                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 4,
                        center: uluru
                    });
                    var marker = new google.maps.Marker({
                        position: uluru,
                        map: map
                    });
                }
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjz_rtT9GfR-l-f5oe1qgHn_Nw-aku4-s">
        </script>
    </head>
    <body style="background-color: antiquewhite">
        <div id="map" class="white_content">
        </div>

        <div id="fade" class="black_overlay">
            <a href="javascript:void(0)" onclick="document.getElementById('map').style.display = 'none';document.getElementById('fade').style.display = 'none';">Close</a>
        </div>          
        <div style="width: 100%; height: 200px; margin-bottom: 10px; background-image: url(http://www.finchbayhotel.com/wp-content/uploads/2015/12/Our_Hotel_Header.jpg);">
            &nbsp;
        </div>      
        <div style="height: 100%;background-color: antiquewhite">
            <div style="position: absolute;width: 15%;height: 100%;background-color: antiquewhite;left: 1%;">
                <form action="sa/getHotelOffers" method="GET" style="padding-left: 10px;padding-top: 10px">
                    <table style="width:100%">
                        <tr style="padding-bottom: 10px;">
                            <td>
                                <h3>Filter</h3>
                            </td>
                        </tr>                        
                        <tr style="padding-bottom: 10px;">
                            <td>
                                Destination Name
                                <br>
                                <input type="text" id="destinationName" name="destinationName" class="input_text"/>
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px;">
                            <td>
                                Min Trip Start Date
                                <br>
                                <input type="text" id="minTripStartDate" name="minTripStartDate" class="input_text"/>
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px;">                        
                            <td>
                                Max Trip Start Date
                                <br>
                                <input type="text" id="maxTripStartDate" name="maxTripStartDate" class="input_text"/>
                            </td>                            
                        </tr>
                        <tr style="padding-bottom: 10px;">
                            <td>
                                Length Of Stay
                                <br>
                                <input type="text" id="lengthOfStay" name="lengthOfStay" class="input_text"/>
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px;">
                            <td>
                                Min Star Rating
                                <br>
                                <select id="minStarRating" name="minStarRating" class="input_select">
                                    <option value="0">Select..</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px;">
                            <td>
                                Max Star Rating
                                <br>
                                <select id="maxStarRating" name="maxStarRating" class="input_select">
                                    <option value="0">Select..</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px;">
                            <td>
                                Min Total Rate
                                <br>
                                <select id="minTotalRate" name="minTotalRate" class="input_select">
                                    <option value="0">Select..</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px;">
                            <td>
                                Max Total Rate
                                <br>
                                <select id="maxTotalRate" name="maxTotalRate" class="input_select">
                                    <option value="0">Select..</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px;">
                            <td>
                                Min Guest Rating
                                <br>
                                <select id="minGuestRating" name="minGuestRating" class="input_select">
                                    <option value="0">Select..</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>                                
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px;">
                            <td>
                                Max Guest Rating
                                <br>
                                <select id="maxGuestRating" name="maxGuestRating" class="input_select">
                                    <option value="0">Select..</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px;    height: 100px;;">
                            <td style="text-align: left">
                                <input type="submit" value="search" style="width: 150px;text-align: center;"/>
                            </td>
                        </tr>                       
                    </table>
                </form>
            </div>
            <div style=" position: absolute;width: 80%;left: 16%; overflow: hidden;background-color: white">
                <table style="width: 100%;">
                    <tr style="background-color: yellowgreen">
                        <td style="width: 15%; text-align: center">
                            Travel offer Date Range
                        </td>
                        <td style="width: 85%; text-align: center">
                            Hotel Deals
                        </td>
                    </tr>                    
                    <c:if test="${not empty hotelOffersList}">
                        
                        <c:forEach var="listValue" items="${hotelOffersList}">
                            <tr>
                                <td style="width: 15%"> ${listValue.hotelInfo.travelStartDate} - ${listValue.hotelInfo.travelEndDate} (${listValue.offerDateRange.lengthOfStay} Days)</td>
                                <td style="width: 85%; padding-left: 20px; padding-bottom: 10px; padding-top: 10px;"> 
                                    <table style="border: 0px">
                                        <tr>
                                            <td style="vertical-align: top;">
                                                <a href="${listValue.hotelUrls.hotelInfositeUrl}" ><img src="${listValue.hotelInfo.hotelImageUrl}" style="width: 150px; height: 150px"/></a>
                                            </td>
                                            <td style="vertical-align: top; padding-left: 10px;">
                                                <a href="${listValue.hotelUrls.hotelSearchResultUrl}" >
                                                    <span style="font-size: large; font-family: 'Helvetica Neue',Arial,'Lucida Grande',sans-serif; font-weight: 600; color: forestgreen;">${listValue.hotelInfo.hotelName} (${listValue.hotelInfo.hotelStarRating})</span>
                                                </a>
                                                <input type="hidden" value="${listValue.hotelInfo.hotelId}"/>
                                                <p>
                                                    <label style="font-size: medium; color: orangered;">Destination:</label>
                                                    <span style="font-size: medium; color: orangered;">${listValue.destination.longName} <br> ${listValue.destination.country} <br> ${listValue.destination.city} <br> ${listValue.destination.province}</span>
                                                </p>
                                                <p style="font-size: medium; color: #b09114;">${listValue.hotelInfo.description}</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <a class="tooltip">
                                                    <img src="images/wallet_icon.jpg" style="width:50px;height:50px" alter="Price" title="Price"/>
                                                    <div class="tooltiptext">
                                                        <table>
                                                            <tr>
                                                                <td> <label>Total Base Rate: </label>${listValue.hotelPricingInfo.hotelTotalBaseRate}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Total Price Value: </label>${listValue.hotelPricingInfo.totalPriceValue}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Average Price Value: </label>${listValue.hotelPricingInfo.averagePriceValue}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Total Mandatory Taxes and Fees: </label>${listValue.hotelPricingInfo.hotelTotalMandatoryTaxesAndFees}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Total Taxes and Fees: </label>${listValue.hotelPricingInfo.hotelTotalTaxesAndFees}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Original Price Per Night:</label>${listValue.hotelPricingInfo.originalPricePerNight}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Drr:</label>${listValue.hotelPricingInfo.drr}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Percent Savings:</label>${listValue.hotelPricingInfo.percentSavings}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2"> <label>currency:</label>${listValue.hotelPricingInfo.currency}</td> 
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </a>
                                                <span style="margin: 5px">|</span>
                                                <a class="tooltip">
                                                    <img src="images/promotion.png" style="width:50px;height:50px" alter="Promotion" title="Promotion"/>
                                                    <div class="tooltiptext">
                                                        <table>
                                                            <tr> 
                                                                <td> <label>Promotion Tag: </label>${listValue.hotelInfo.promotionTag}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Promotion Amount: </label>${listValue.hotelInfo.promotionAmount}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Description: </label>${listValue.hotelInfo.promotionDescription}</td> 
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </a>
                                                <span style="margin: 5px">|</span>
                                                <a class="tooltip" onclick="initMap(${listValue.hotelInfo.hotelLatitude},${listValue.hotelInfo.hotelLongitude})">
                                                    <img src="images/maps.png" style="width:50px;height:50px" alter="Map Marker" title="Click me to show map"/>
                                                    <div id="showAddressDetail" class="tooltiptext">${listValue.hotelInfo.hotelLongDestination},&nbsp;${listValue.hotelInfo.hotelProvince},&nbsp;${listValue.hotelInfo.hotelCity},&nbsp;${listValue.hotelInfo.hotelStreetAddress}</div>
                                                </a>
                                                <span style="margin: 5px">|</span>
                                                <a href="#" class="nontooltip">
                                                    <img src="images/user_rating_icon.png" style="width:50px; height:50px" alter="Hotel Guest Review Rating" title="Hotel Guest Review Rating:  ${listValue.hotelInfo.hotelGuestReviewRating}"/>
                                                </a>
                                                <span style="margin: 5px">|</span>
                                                <a href="#" class="tooltip">
                                                    <img src="images/urgent_icon.png" style="width:50px; height:50px" alter="Urgent Info" title="Urgent Info"/>
                                                    <div class="tooltiptext">
                                                        <table>
                                                            <tr>
                                                                <td> <label>Last Booked Time: </label>${listValue.hotelUrgencyInfo.lastBookedTime}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Air Attach Enabled: </label>${listValue.hotelUrgencyInfo.airAttachEnabled}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Number Of People Booked: </label>${listValue.hotelUrgencyInfo.numberOfPeopleBooked}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Almost Sold Status: </label>${listValue.hotelUrgencyInfo.almostSoldStatus}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Number Of Rooms Left: </label>${listValue.hotelUrgencyInfo.numberOfRoomsLeft}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Original Price Per Night:</label><a href="${listValue.hotelUrgencyInfo.link}" >info</a></td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Almost Sold Out Room Type Info Collection</label>
                                                                    <c:forEach var="data" items="${listValue.hotelUrgencyInfo.almostSoldOutRoomTypeInfoCollection}" >
                                                                        ${data}
                                                                    </c:forEach>
                                                                </td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Number Of People Viewing:</label> ${listValue.hotelUrgencyInfo.numberOfPeopleViewing}</td> 
                                                            </tr>
                                                            <tr>
                                                                <td> <label>Air Attach Remaining Time:</label> ${listValue.hotelUrgencyInfo.airAttachRemainingTime}</td> 
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </a>
                                                <span style="margin: 5px">|</span>
                                                <a href="#" class="nontooltip" >
                                                    <img src="images/language_icon.png" style="width:50px; height:50px" alter="Language" title="Language: ${listValue.hotelInfo.language}"/>
                                                </a>                                                            
                                            </td>                                            
                                        </tr>
                                    </table>
                                </td>
<!--                                <td> ${listValue.hotelInfo.carPackage}</td>
                                <td> ${listValue.hotelInfo.allInclusive}</td> 
                                <td> ${listValue.hotelInfo.statusCode}</td> 
                                <td> ${listValue.hotelInfo.movingAverageScore}</td>
                                
                                <td> ${listValue.hotelInfo.relevanceScore}</td> 
                                <td> ${listValue.hotelInfo.rawAppealScore}</td> 
                                <td> ${listValue.hotelInfo.distanceFromUser}</td> 
                                <td> ${listValue.hotelInfo.statusDescription}</td>
                                <td> ${listValue.hotelInfo.hotelCountryCode}</td> 
                                <td> ${listValue.hotelInfo.carPackageScore}</td> -->

                            </tr>
                            <tr>
                                <td colspan="2" style="height: 3px;background-color: yellowgreen; margin-top: 5px;margin-bottom: 5px">
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </table>
            </div>
            <br style="clear:both;"/>
        </div>
    </body>
</html>
