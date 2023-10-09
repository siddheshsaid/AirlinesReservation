<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>


 <link rel="stylesheet" href="resources/manage.css">

<script>
        // Function to hide/show the return date input
        function toggleReturnDate() {

          //ONE WAY
            var oneWayRadio = document.getElementById("oneway");
            var labelOneway = document.getElementById("OnewayLabelinput");

            //TWO WAY
            var twoWayRadio = document.getElementById("twoway");
            var labelTwoway = document.getElementById("TwowayLabelinput");

            //INPUTS FOR RETURNDATE
            var returnDateInput = document.getElementById("returnDateInput");
            var labelReturnDate = document.getElementById("returnDateLabel");

            //INPUTS FOR DEPARTUREDATE
            var labelDepartureDate = document.getElementById("departureDateLabel");
               var departureDateInput = document.getElementById( "departureDateInput");



            if (oneWayRadio.checked) {

                           returnDateInput.style.display = "none"; // Hide the input
                           labelReturnDate.style.display = "none"; // Hide the input
                           twoWayRadio.style.display="none";
                           labelTwoway.style.display="none";


                       } else  if (twoWayRadio.checked) {



                                              oneWayRadio.style.display="none";
                                              labelOneway.style.display="none";


                                          }
                      else{
                returnDateInput.style.display = "block"; // Show the input
                departureDateInput.style.display = "block";
                }

        }
    </script>




    </head>
<body>
     <marquee><h1 class="Heading">BOOK YOUR RESERVATION<h1></marquee>

<div class="mainform">
    <div class="sub-form">
        <form:form action="createUserDetails" method="post" modelAttribute="FlightReservation">

                <label class="form-control" id="OnewayLabelinput">
                    <form:radiobutton path="journeytypeOneWay" id="oneway" value="oneway"  onclick="toggleReturnDate()"/>
                    One Way
                </label>
                 <label class="form-control" id="TwowayLabelinput">
                 <form:radiobutton path="journeytypeTwoWay" id="twoway" value="twoway"  onclick="toggleReturnDate()"/>
                    Two Way
                                </label>


            <br><br>

            <label for="source">From</label>
            <form:input path="source" id="from" />

            <label for="destination">To</label>
            <form:input path="destination" id="to" />

            <br><br>

              <form:label path="departureDateTime" id="departureDateLabel" >DepartureDateTime</form:label>
            <form:input type="datetime-local" path="departureDateTime"  id="departureDateInput"  pattern="yyyy-MM-dd'T'HH:mm"  class="custom-input-field"/>

             <form:label path="returnDateTime" id="returnDateLabel">ReturnDateTime</form:label>
             <form:input type="datetime-local" path="returnDateTime" id="returnDateInput"  pattern="yyyy-MM-dd'T'HH:mm"  class="custom-input-field"/>

            <br><br>Passengers:
            <br><br>
            <label for="adults">Adults</label>
            <form:input path="adults" id="adults" type="number" min="1" value="1" />
            &nbsp;&nbsp;
            <label for="children">Children</label>
            <form:input path="children" id="children" type="number" min="0" value="0" />
            &nbsp;&nbsp;
            <label for="infants">Infants</label>
            <form:input path="infants" id="infants" type="number" min="0" value="0" />
            &nbsp;&nbsp;
            <br><br>

            <div class="subbtn">
                <input type="submit" value="Search Flight">
            </div>
        </form:form>
    </div>
</div>


    </body>
    </html>