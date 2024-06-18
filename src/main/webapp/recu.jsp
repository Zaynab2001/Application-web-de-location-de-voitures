<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reçu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            background-image: url('v.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0; /* Supprimer la marge par défaut du corps */
        }

        .container {
            display: flex;
            justify-content: space-between; /* Espace entre les éléments */
            align-items: center; /* Centrer verticalement */
            height: 100vh; /* 100% de la hauteur de la vue */
            padding: 0 20px; /* Ajouter de l'espace à droite et à gauche */
        }

        .left-column {
         flex:2;
            padding: 20px; /* Ajouter de l'espace intérieur */
        }

        .card {
            border: 3px solid #ccc;
            border-radius: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            flex: 2; /* Utiliser deux tiers de l'espace disponible */
        }

        .card-body {
            padding: 30px;
        }

        h1, strong {
            color: #000000;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-primary {
            background-color: #000000;
            border-color: #007bff;
        }

        .navbar {
            background-color: #f8f9fa;
            display: flex;
            justify-content: space-between;
            padding: 20px 0;
        }

        .navbar-brand img {
            max-width: 80px; /* Ajustez la taille du logo selon vos besoins */
            margin-right: 10px;
        }

        .navbar-nav .nav-item {
            margin-left: 10px;
        }

        .signature-container {
            text-align: right;
            border-top: 1px solid #ccc;
            padding-top: 50px;
        }
        .left-column{
         	position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            background-color: #f8f9fa;
            width: 100%;
            padding: 20px;
        }
    </style>
</head>
<body>
<form action="facturation" method="get">
    <div class="container">
        <div class="left-column">
            <p style="font-size: 60px; font-style: italic; color: white;">Voici votre Facture </p>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-auto">
                        <img src="okk.png" alt="Logo" style="max-width: 90px; max-height: 100px; margin-right: 10px;">
                    </div>
                    <div class="col-auto">
                        <h1 class="mb-4">Facture</h1>
                    </div>
                </div>
                <p class="text-center" style="font-style: italic;">Merci d'avoir choisi nos services. Nous vous souhaitons une excellente journée!</p>
                <br>
                <p><strong>Nom :</strong> <%= request.getParameter("nom") %></p><br>
                <p><strong>Prénom :</strong> <%= request.getParameter("prenom") %></p><br>
                <p><strong>Date de Réservation :</strong> <%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></p><br>
                <p><strong>Date début :</strong> <%= request.getParameter("DateDebut") %> </p><br>
                <p><strong>Date Fin :</strong> <%= request.getParameter("DateFin") %> </p><br>
                <p><strong>Montant Total :</strong> <%= request.getParameter("montantTotal") %> DH</p>
                <br>
                <br>
                <div class="signature-container">
                    <p class="signature">Signature</p>
                </div>
                <div class="text-center mt-4">
                    <button type="button" class="btn btn-success" onclick="imprimerFacture()">Imprimer</button>
                  
                </div>
            </div>
        </div>
    </div>
</form>
    <script>
        function imprimerFacture() {
            // Appel à la fonction d'impression du navigateur
            window.print();
        }
    </script>
</body>
</html>
