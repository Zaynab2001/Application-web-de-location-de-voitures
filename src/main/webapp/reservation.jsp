<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Réservation de Voiture</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function calculerMontant() {
            var DateDebut = document.getElementById("DateDebut").value;
            var DateFin = document.getElementById("DateFin").value;
            var tarifParJour = parseFloat(document.getElementById("tarifparjour").value);

            // Calcul du nombre de jours entre les dates
            var joursDifference = Math.floor((new Date(DateFin) - new Date(DateDebut)) / (1000 * 60 * 60 * 24)) + 1;

            // Calcul du montant total
            var montantTotal = tarifParJour * joursDifference;

            // Affichage du montant total
            document.getElementById("montantTotal").value = montantTotal.toFixed(2);
        }

        function displaySuccess() {
            // Afficher une alerte de réussite
            $('#successAlert').fadeIn();

            // Rediriger vers la page facture.jsp après un court délai (par exemple, 2 secondes)
            setTimeout(function() {
                window.location.href = "facture.jsp";
            }, 2000);
        }

        function reserverVoiture() {
            // Mettez à jour l'action du formulaire
            document.forms[0].action = "ReservationServlet";

            // Soumettez le formulaire
            document.forms[0].submit();
        }

    </script>
    <style>
        body {
            background-image: url('voit.jpg');
            background-size: cover;
            background-repeat: no-repeat;
        }
        
        .navbar-brand img {
            max-width: 80px; /* Ajustez la taille du logo selon vos besoins */
            margin-right: 10px;
        }
        
        .custom-text {
            font-size: 20px;
            color: white;
            
            position: absolute;
            top:80%;
            left: -100;
            transform: translateY(-100%);
        }
        
    </style>
</head>
<body>
    <!-- Barre de navigation Bootstrap -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="okk.png" alt="Logo" />
                Rental car service
            </a>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">À propos</a>
                    </li>
                   <li class="nav-item">
                        <a class="nav-link" href="#">Contactez nous</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">deconnexion</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 mx-auto"> <!-- Ajout de la classe mx-auto -->
                <!-- Partie de réservation à droite -->
                <div class="card">
                    <div class="card-body">
                        <h1 class="text-center mb-4">Réservez maintenant !</h1>
                        <form action="ReservationServlet" method="get" onsubmit="displaySuccess();">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nom">Nom :</label>
                                    <input type="text" name="nom" id="nom" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="prenom">Prénom :</label>
                                    <input type="text" name="prenom" id="prenom" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nomVoiture">Marque de la voiture :</label>
                                    <input type="text" name="nomVoiture" id="nomVoiture" class="form-control" value="<%= request.getParameter("marque") %>" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="Tarifparjour">Tarif par jour :</label>
                                    <input type="text" name="Tarifparjour" id="tarifparjour" class="form-control" value="<%= request.getParameter("tarif") %>" readonly>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="DateDebut">Date de début :</label>
                                    <input type="date" name="DateDebut" id="DateDebut" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="DateFin">Date de fin :</label>
                                    <input type="date" name="DateFin" id="DateFin" class="form-control" required>
                                </div>
                            </div>
                            <button type="button" class="btn btn-success" onclick="calculerMontant()">Découvrez votre montant total</button>
                            <div class="form-group">
                                <br>
                                <input type="text" name="montantTotal" id="montantTotal" class="form-control" required readonly>
                            </div>
                            <!-- Utilisez un bouton de type bouton au lieu de submit -->
                            <button type="submit" class="btn btn-primary" onclick="reserverVoiture()">Réserver votre voiture</button>
                        </form>
                         <!-- Success alert -->
                        <div id="successAlert" class="alert alert-success mt-3" style="display:none;">
                            Réservation effectuée avec succès!
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>