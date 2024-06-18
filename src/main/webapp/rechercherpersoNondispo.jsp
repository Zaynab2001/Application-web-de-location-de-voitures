<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="location.Voiture" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Recherche de Voitures</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <style>
        body {
            background-image: url('voit.jpg'); /* Remplacez par le chemin de votre image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white; /* Assurez-vous que le texte est lisible sur l'image */
        }
         table.table th, table.table td {
            color: white;
        }
    </style>
</head>
<body>
<br>
<br>
<br>
<br>
    <div class="container mt-5">
        <h1 class="text-center">Recherche de Voitures Non-Disponibles</h1>
        <form action="RechercherPersoReserve" method="get" class="mt-4">

            <div class="form-group">
                <label for="marque">Rechercher :</label>
                <input type="text" name="marque" id="marque" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">Rechercher</button>
        </form>
        <form action="affichervoiturenondispo">
             <button type="submit" class="btn btn-success">Afficherles voitures Non disponibles</button></form>
        </form>
        <hr class="mt-4">
        <h2>Résultat de la recherche</h2>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Marque</th>
                    <th>Modèle</th>
                    <th>Année</th>
                    <th>Disponibilité</th>
                    <th>Tarif</th>
                    
                </tr>
            </thead>
            <%
                Object attribute = request.getAttribute("voitures");

                if (attribute instanceof List) {
                    List<Voiture> voitures = (List<Voiture>) attribute;

                    if (!voitures.isEmpty()) {
                        for (Voiture voiture : voitures) { %>
                            <tr>
                                <td><%= voiture.getMarque() %></td>
                                <td><%= voiture.getModele() %></td>
                                <td><%= voiture.getAnnee() %></td>
                                <td><%= voiture.getDisponibilite() %></td>
                                <td><%= voiture.getTarif() %></td>
                                
                            </tr>
                        <%
                        }
                    }
                }
            %>
        </table>
    </div>
</body>
</html>
