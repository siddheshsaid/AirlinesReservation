<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
 integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta charset="UTF-8">
    <title>City Search</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
    /* Apply styles to the form */
    form {
        margin: 20px;
    }

    /* Style the input field and submit button */
    input[type="text"] {
        width: 200px;
        padding: 5px;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        padding: 5px 10px;
        border: none;
        cursor: pointer;
    }

    /* Style the table */
    table {
        border-collapse: collapse;
        width: 100%;
    }

    /* Style table header */
    th {
        background-color: #007bff;
        color: #fff;
        padding: 10px;
        text-align: left;
    }

    /* Style table rows */
    tr {
        border-bottom: 1px solid #ccc;
    }

    /* Style table data cells */
    td {
        padding: 10px;
    }
.green-text {
    color: green;
    font-family: sans-serif;
}

    </style>

</head>
<body>

<form action="getFlightStatus"  method="post">
    <input type="text" id="flightCode" name="flightCode" placeholder="Search for flightCode">

       <input type="submit" value="Submit">
    </form>
<table>
    <thead>
        <tr>
             <th>Id</th>
             <th>Destination</th>
            <th>Flight Code</th>
            <th>Flight Number</th>
            <th>Departure Date</th>
            <th>Arrival Date</th>

            <th>Terminal Number</th>
            <th>Flight Status</th>


        </tr>
    </thead>
    <tbody>
          <c:forEach var="flight" items="${selectedFlightForStatus}">
              <tr>
                  <td>Airaibi@${flight.rowId}</td>
                  <td>${flight.destinationName}</td>

                  <td>${flight.flightCode}</td>
                  <td>${flight.flightNumber}</td>
                  <td>${flight.departureDateTime}</td>
                  <td>${flight.arrivalDateTime}</td>

                    <td>${flight.terminalNo}</td>
                <td class="green-text ">
                    <c:choose>
                        <c:when test="${flightStatus == 'Flight is in air'}">
                          <i class="fa-sharp fa-solid fa-plane" style="color: #207e2b;"></i>
                        </c:when>
                        <c:when test="${flightStatus == 'No flights are scheduled Today'}">
                           <i class="fa-sharp fa-solid fa-plane-slash" style="color: #e60a15;"></i>
                        </c:when>
                        <c:when test="${flightStatus == 'Flights is just taking off'}">
                            <i class="fa-solid fa-plane-departure" style="color: #31a829;"></i>
                        </c:when>
                            <c:when test="${flightStatus == 'Flights is just arrived'}">
                             <i class="fa-sharp fa-solid fa-plane-arrival" style="color: #36841a;"></i>
                           </c:when>
                        <c:otherwise>
                            <!-- Default icon or handling for other cases -->
                            <i class="fa-sharp fa-solid fa-default-icon" style="color: #000;"></i>
                        </c:otherwise>
                    </c:choose>
                    &nbsp;${flightStatus}
                </td>






                  <!-- Add more columns as needed -->
              </tr>
          </c:forEach>
      </tbody>
</table>








</body>
</html>