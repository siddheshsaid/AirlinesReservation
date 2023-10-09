<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <title>Flight Operations</title>
  <style>
   .form-container {
                                                                                       max-width: 400px;
                                                                                       margin: 0 auto;
                                                                                       padding: 20px;
                                                                                       background-color: #f2f2f2;
                                                                                       border-radius: 5px;
                                                                                   }

                                                                                   /* Style labels and inputs */
                                                                                   label {
                                                                                       display: block;
                                                                                       margin-bottom: 5px;
                                                                                   }

                                                                                   input[type="text"] {
                                                                                       width: 100%;
                                                                                       padding: 10px;
                                                                                       margin-bottom: 10px;
                                                                                       border: 1px solid #ccc;
                                                                                       border-radius: 3px;
                                                                                   }

                                                                                   /* Style the submit button */
                                                                                   input[type="submit"] {
                                                                                       background-color: #007bff;
                                                                                       color: #fff;
                                                                                       padding: 10px 20px;
                                                                                       border: none;
                                                                                       border-radius: 3px;
                                                                                       cursor: pointer;
                                                                                   }

                                                                                   input[type="submit"]:hover {
                                                                                       background-color: #0056b3;
                                                                                   }

                                                                                   .header {
                                                                                               text-align: center;
                                                                                               padding: 20px;
                                                                                           }

                                                                                           /* Style the h1 heading */
                                                                                           .header h1 {
                                                                                               font-size: 36px;
                                                                                               color: #007bff;
                                                                                           }
  </style>

   </head>
   <body>
    <h1>AIR AIRAIBI Flight Modify Operation</h1>
           <br>
           <form:form method="POST" action="/AirlineReservation/updateFlight/${Flight.flightCode}/${Flight.flightNumber}" modelAttribute="Flight">

               <form:hidden path="rowId" />

               <form:label path="destinationName">Destination</form:label>
               <form:input path="destinationName" />
               <form:label path="flightCode">Flight Code</form:label>
               <form:input path="flightCode" />

               <form:label path="flightNumber">Flight Number</form:label>
               <form:input path="flightNumber" />

               <form:label path="departureDateTime">DepartureDateTime</form:label>
               <form:input type="datetime-local" path="departureDateTime"  pattern="yyyy-MM-dd'T'HH:mm"  class="custom-input-field"/>
               <form:label path="arrivalDateTime">ArrivalDateTime</form:label>
               <form:input type="datetime-local" path="arrivalDateTime" pattern="yyyy-MM-dd'T'HH:mm" class="custom-input-field"/>


               <form:label path="terminalNo">Terminal</form:label>
               <form:input path="terminalNo" />






               <input type="submit" value="Update" />
           </form:form>
   </body>
   </html>