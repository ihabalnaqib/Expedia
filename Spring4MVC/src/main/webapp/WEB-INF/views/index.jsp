<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expedia | Hotels </title>
        
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
         <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
     
        
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
          
        </script>
       
    </head>
    <body >
    
    <div class="generic-container" >
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Hotles Filter</span></div>
              <div class="formcontainer">
              <form:form action="${pageContext.request.contextPath}/offers/filter" method="GET" modelAttribute="offersFilterForm">
                   
                     <div class="row">
                          <div class="form-group col-md-12">
                              <div class="col-md-4">
                                  <input type="text" placeholder="Enter Destination" id="destinationName" name="destinationName" class="form-control input-sm""/>                                                                    
                              </div>
                              <div class="col-md-4">
                                 <input type="text" placeholder="Select Min Trip Start Date" id="minTripStartDate" name="minTripStartDate" class="form-control input-sm"/>                                 
                              </div>
                              <div class="col-md-4">
                                 <input type="text" placeholder="Select Max Trip Start Date" id="maxTripStartDate" name="maxTripStartDate" class="form-control input-sm"/>                                 
                              </div>
                          </div>
                      </div>
                      
                     <div class="row">
                          <div class="form-group col-md-12">
                              <div class="col-md-4">
                                <input type="text" placeholder="Enter Length Of Stay" id="lengthOfStay" name="lengthOfStay" class="form-control input-sm"/>
                              </div>
                              <div class="col-md-4">
                                 <select id="minStarRating" name="minStarRating" class="form-control input-sm">
                                    <option value="0">Select Min Star Rating</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>                                 
                              </div>
                              <div class="col-md-4">
                                 <select id="maxStarRating" name="maxStarRating" class="form-control input-sm">
                                    <option value="0">Select Max Star Rating</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>                                 
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <div class="col-md-3">
                                 <select id="minTotalRate" name="minTotalRate" class="form-control input-sm">
                                    <option value="0">Select Min Total Rate</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                              </div>
                              <div class="col-md-3">
                                 <select id="maxTotalRate" name="maxTotalRate" class="form-control input-sm">
                                    <option value="0">Select Max Total Rate</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>                           
                              </div>
                              <div class="col-md-3">
                               <select id="minGuestRating" name="minGuestRating" class="form-control input-sm">
                                    <option value="0">Select Min Guest Rating</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>                              
                              </div>
                              <div class="col-md-3">                               
                                 <select id="maxGuestRating" name="maxGuestRating" class="form-control input-sm">
                                    <option value="0">Select Max Guest Rating</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                          </div>
                      </div>
                       <div class="row">
                          <div class="form-group col-md-12">
                              <div class="col-md-4">
                      			<input type="submit" value="search" class="form-control input-sm"/>
                      		</div>
                      	</div>
                      </div>
                </form:form>
     
              </div>
          </div>
          
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">Hotels </span></div>
              
          
              <c:if test="${not empty offers}">
                        
                        <c:forEach var="list" items="${offers}">
                         <main>
                        
            <div class="container"> 
                <div class="row">
                    <!-- blog-contents -->
                    <section class="col-md-8">
                <article class="blog-item">
                   
                    <div class="row">
                        <div class="col-md-3">
                         <img src="${list.hotelInfo.hotelImageUrl}"/>

                        </div>
                        <div class="col-md-6">
                            <h2 style=" font-size: 20px;">
							<span>${list.hotelInfo.hotelName}</span>
                            </h2>
                            <div class="fff"></div>
                            <p style="color:gray ">
                                ${list.destination.city} /  ${list.destination.province} / ${list.destination.country}
                               
                            </p>
 							<p style="color:gray ">
                                ${list.hotelInfo.hotelStarRating} Rating
                               
                            </p>
                            <p style="color:gray ">
                                $ ${list.hotelPricingInfo.originalPricePerNight} Rate Per Night
                               
                            </p>
                        </div>
                        

                    
                    </div>
                </article> <!-- /.blog-item -->


                    </section>
                    <!-- end of blog-contents -->
                    
                </div>
            </div> <!-- end of /.container -->
             </main>
            </c:forEach>
            </c:if>
       
              
             
                     
                  
                 
          </div>
      </div>        
   
   </body>
</html>
