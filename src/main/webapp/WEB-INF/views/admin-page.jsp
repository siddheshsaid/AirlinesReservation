<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <!-- WE USE PROPERTY BORDER-COLLAPSE:COLLAPSE TO REMOVE UNWANTED TABLE BORDER SPACING!-->



<link rel="stylesheet" href="resources/admin-page.css">


    </head>
    <body>
        <div class="header">
                <img src="resources/image/airline2logo.png" alt="Logo">
                  <marquee><h1>AIRAIBI FLIGHT DETAILS</h1> </marquee>

            </div>
        <br>
        <form:form method="POST" action="createflight" modelAttribute="Flight">

        <form:label path="destinationName">Destination</form:label>
        <form:input path="destinationName"/>


        <form:label path="flightCode">Flight Code</form:label>
        <form:input path="flightCode"/>

        <form:label path="flightNumber">Flight Number</form:label>
        <form:input path="flightNumber"/>



        <form:label path="departureDateTime">DepartureDateTime</form:label>
          <form:input type="datetime-local" path="departureDateTime"  pattern="yyyy-MM-dd'T'HH:mm"  class="custom-input-field"/>

        <form:label path="arrivalDateTime">ArrivalDateTime</form:label>
        <form:input type="datetime-local" path="arrivalDateTime" pattern="yyyy-MM-dd'T'HH:mm" class="custom-input-field"/>





        <form:label path="terminalNo">Terminal</form:label>
        <form:input path="terminalNo"/>



        <input type="submit" value="Submit">
        </form:form>

        <table>
        <tr>
        <th>ID</th>
        <th>Destination</th>
        <th>Flight Code</th>
        <th>Flight Number</th>

        <th>Departure date</th>
        <th>Arrival date </th>

        <th>Terminal</th>
        <th>Operation 1</th>
        <th>Operation 2</th>
        </tr>


        <c:forEach items="${flightList}" var="flight">
        <tr>
        <td>Airaibi@<c:out value="${flight.rowId}"/></td>
        <td><c:out value="${flight.destinationName}"/></td>
        <td><c:out value="${flight.flightCode}"/></td>
        <td><c:out value="${flight.flightNumber}"/></td>

        <td><c:out value="${flight.departureDateTime}"/></td>
        <td><c:out value="${flight.arrivalDateTime}"/></td>

          <td><c:out value="${flight.terminalNo}"/></td>
        <td><a href="modifyflight/${flight.flightCode}/${flight.flightNumber}">Schedule Flight</a></td>
        <td><a href="deleteflight?flightCode=${flight.flightCode}&flightNumber=${flight.flightNumber}">Delete Flight</a></td>

        </tr>
        </c:forEach>
        </table>


    </body>
</html>
