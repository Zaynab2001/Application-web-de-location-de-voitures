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
    <script>
        function updateDisponibilite(marque, tarif, modele, disponibilite) {
            $.ajax({
                type: "POST",
                url: "UpdateDisponibiliteServlet", // Mettez le bon chemin vers votre servlet ici
                data: {
                    marque: marque,
                    tarif: tarif,
                    modele: modele,
                    disponibilite: disponibilite
                },
                success: function () {
                    // Aucun besoin de recharger la page, les modifications sont reflétées automatiquement
                    console.log("Disponibilité mise à jour avec succès.");
                },
                error: function () {
                    console.log("Erreur lors de la mise à jour de la disponibilité.");
                }
            });
        }
    </script>
</head>
<body>
<br>
<br>

    <div class="container mt-5">
    <br>
<br>
<br>
        <h1 class="text-center bg-black text-white p-3">Gestion des Voitures</h1>


        <h3 class="font-family: 'Your-Desired-Font', sans-serif; text-white">Ajouter une nouvelle voiture</h3>

    <form class="row g-3" action="AjoutVoitureServlet" method="post">
    <div class="col-md-6">
        <label for="marque" class="form-label text-white">Marque :</label>
        <input type="text" class="form-control" id="marque" name="marque" required>
    </div>

    <div class="col-md-6">
        <label for="modele" class="form-label text-white">Modèle :</label>
        <input type="text" class="form-control" id="modele" name="modele" required>
    </div>

    <div class="col-md-6">
        <label for="annee" class="form-label text-white">Année :</label>
        <input type="text" class="form-control" id="annee" name="annee" required>
    </div>

    <div class="col-md-6">
    <br>
    
        <label for="disponibilite" class="form-label text-white">Disponibilité :</label>
       
        <select class="form-select text-black" id="disponibilite" name="disponibilite" required>
            <option value="disponible ">Disponible</option>
            <option value="non-disponible">Non Disponible</option>
        </select>
    </div>

    <div class="col-md-6">
        <label for="tarif" class="form-label text-white">Tarif :</label>
        <input type="text" class="form-control" id="tarif" name="tarif" required>
    </div>
<br>
    <div class="col-12 text-left">
    <br>
    <button type="submit" class="btn btn-primary ml-3">Ajouter</button>
</div>
</form>

        <form action="traitementservlet" method="get" class="mt-4">
    <div class="col-10 text-left">
    <button type="submit" class="btn btn-primary ml-0">Afficher</button>
</div>


        </form>
        <hr class="mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3 text-white">
            <h2>Résultat de la recherche</h2>
           
        </div>
        <table class="table table-bordered custom-table">
            <thead class="thead-dark">
                <tr>
                    <th>Marque</th>
                    <th>Modèle</th>
                    <th>Année</th>
                    <th>Disponibilité</th>
                    <th>Tarif</th>
                    <th>Action</th>
                </tr>
            </thead>
            <% 
                List<Voiture> voitures = (List<Voiture>) request.getAttribute("voitures");
                if (voitures != null && !voitures.isEmpty()) {
                    for (Voiture voiture : voitures) { 
            %>
                <tr>
                    <td><%= voiture.getMarque() %></td>
                    <td><%= voiture.getModele() %></td>
                    <td><%= voiture.getAnnee() %></td>
                    <td><%= voiture.getDisponibilite() %></td>
                    <td><%= voiture.getTarif() %></td>
                    <td>
                        <form action="delete" method="post">
                            <input type="hidden" name="marque" value="<%= voiture.getMarque() %>">
                            <input type="hidden" name="tarif" value="<%= voiture.getTarif() %>">
                            <input type="hidden" name="modele" value="<%= voiture.getModele() %>">
                            <button type="submit" class="btn btn-success">Supprimer</button>
                        </form>
                        
                         <!-- Ajouter une liste déroulante pour la disponibilité avec un événement onchange -->
        <label for="disponibilite">Disponibilité :</label>
        <select name="disponibilite" id="disponibilite" onchange="updateDisponibilite('<%= voiture.getMarque() %>', '<%= voiture.getTarif() %>', '<%= voiture.getModele() %>', this.value)">
                <option value="select">select</option>
            <option value="disponible">Disponible</option>
            <option value="non_disponible">Non disponible</option>
        </select>
                    </td>
                </tr>
            <%
                    }
                } else { 
            %>
                <tr>
                    <td colspan="6">Aucun résultat trouvé.</td>
                </tr>
            <%
                }
            %>
        </table>
        
       
    </div>
</body>
</html>
