<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="location.Reservation" %>
<%@ page import="location.client" %>
<%@ page import="location.Voiture" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Gestion client</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-image: url('voit.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .custom-table {
            background-color: white;
        }
        .bg-beige {
            background-color: #f5f5dc; /* Code couleur pour le beige */
        }
    </style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
    <div class="container mt-5">
        <h1 class="text-center bg-black text-white p-3">La liste des clients ayant retourné leur voiture</h1>
        <form action="retourclient" method="get" class="mt-4">
            <div class="col-10 text-left">
                <button type="submit" class="btn btn-primary ml-0">Afficher</button>
            </div>
        </form>
        <hr class="mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3 text-white"></div>
        <table class="table table-bordered custom-table">
            <thead class="thead-dark">
                <tr>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Marque</th>
                    <th>Modèle</th>
                    <th>Année</th>
                    <th>Date début</th>
                    <th>Date Fin</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Object[]> results = (List<Object[]>) request.getAttribute("results");
                    if (results != null && !results.isEmpty()) {
                        for (Object[] result : results) {
                %>
                            <tr>
                                <td><%= result[0] %></td>
                                <td><%= result[1] %></td>
                                <td><%= result[2] %></td>
                                <td><%= result[3] %></td>
                                <td><%= result[4] %></td>
                                <td><%= result[5] %></td>
                                <td><%= result[6] %></td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="7"></td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
