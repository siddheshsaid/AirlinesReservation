<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <style>
        body {
            display: block;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            background-color: #fff;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            padding: 20px;
            border-radius: 8px;
        }
        .form {
            text-align: center;
        }
        .input-field {
            margin: 10px;
            padding: 10px;
        }
        .submit-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

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

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        th {
            background-color: #007bff;
            color: white;
        }

    </style>
</head>
<body>
 <table>
        <th>List of available cities</th>
         <c:forEach var="city" items="${cityNames}">

             <tr>
                 <td><c:out value="${city}" /></td>
             </tr>
         </c:forEach>
         <!-- Add more cities as needed -->
     </table>
    <div class="card">
        <h2>City Information</h2>
        <form action="getCost" method="post" class="form">

              <input type="text" class="input-field" placeholder="Destination" name="city2">
            <br>
            <button type="submit" class="submit-button">Calculate cost</button>
        </form>


    </div>
   <table>
       <thead>
           <tr>
               <th>City Name</th>
               <th>Cost of Travel</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td>${cityName}</td>
               <td>${totalCost}</td>
           </tr>
           <!-- Add more rows for additional cities if needed -->
       </tbody>
   </table>


</body>
</html>

