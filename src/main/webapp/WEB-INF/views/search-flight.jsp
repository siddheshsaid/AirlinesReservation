<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>

        .Heading{
        text-align: center;
        }
        /* Styling for the "Filter Flights" form */
        form {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f5f5f5;
            border-radius: 5px;
            max-width: 500px;
            margin: 0 auto;
            text-align: center;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }

        input[type="datetime-local"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        button[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Styling for the "Filtered Flights" table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }


        </style>
    </head>
    <body>


        <h1 class="Heading">Filter Flights</h1>

            <form method="post" action="filter-flightssearch">
                    <label for="criteria">Enter criteria </label>


                   <form action="process-form" method="post">
                       <label for="departurestartDateTime">Start Date and Time:</label>
                       <input type="datetime-local" id="startDate" name="departurestartDateTime" pattern="yyyy-MM-dd'T'HH:mm" required>
                       <span class="form-error"></span> <!-- You can style this span for error messages if needed -->

                       <label for="departureendDateTime">End Date and Time:</label>
                       <input type="datetime-local" id="endDate" name="departureendDateTime" pattern="yyyy-MM-dd'T'HH:mm" required>
                       <span class="form-error"></span>
                    <button type="submit">Filter Flights</button>

                </form>



 <h1 class="Heading">Filtered Flights </h1>

            <table>
                <tr>
                     <th>ID</th>
                            <th>Destination</th>
                            <th>Flight Code</th>
                            <th>Flight Number</th>

                            <th>Departure date</th>
                            <th>Arrival date </th>

                            <th>Terminal</th>


                </tr>
                <c:forEach items="${flights}" var="flight">
                    <tr>
                       <td>Airaibi@<c:out value="${flight.rowId}"/></td>
                               <td><c:out value="${flight.destinationName}"/></td>
                               <td><c:out value="${flight.flightCode}"/></td>
                               <td><c:out value="${flight.flightNumber}"/></td>

                               <td><c:out value="${flight.departureDateTime}"/></td>
                               <td><c:out value="${flight.arrivalDateTime}"/></td>

                                 <td><c:out value="${flight.terminalNo}"/></td>
                    </tr>
                </c:forEach>
            </table>






    </body>
</html>
