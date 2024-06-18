<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login Personnel</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <style>
        body {
            background: url('voit.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Titillium Web', sans-serif;
            margin: 20;
        }

        .navbar {
            background-color: #3498db;
            padding: 20px; /* Adjust the padding to increase the height */
        }

        .navbar-brand img {
            max-width: 50px;
            max-height: 50px;
        }

        .navbar-nav {
            margin-left: auto;
        }

        .navbar-nav a {
            color: #fff;
            margin-right: 10px;
        }

        .container {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            height: 100vh;
        }

        .login-page {
            background: rgba(255, 255, 255, 0.8);
            padding: 80px;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            max-width: 800px;
            transform: translateX(50%);
            transition: transform 0.1s ease;
        }

        .form {
            text-align: center;
        }

        form input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form button {
            width: 100%;
            padding: 10px;
            background-color: #17a589;
            border: none;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #148f77;
        }

        .form .fas.fa-eye {
            cursor: pointer;
        }
        
          /* Style pour la zone de défilement */
        .scrolling-text-container {
            overflow: hidden;
            white-space: nowrap;
        }

        /* Style pour le texte défilant */
        .scrolling-text {
        	color:white;
            display: inline-block;
            animation: scrollText 10s linear infinite; /* Ajustez la durée selon vos préférences */
        }

        /* Animation pour faire défiler le texte */
        @keyframes scrollText {
            from {
                transform: translateX(100%); /* Commence à l'extrémité droite */
            }
            to {
                transform: translateX(-100%); /* Se termine à l'extrémité gauche */
            }
        }
        
         .left-text {
         color :white;
            position: absolute;
            top:150%;
            left: 10;
            transform: translateY(-200%);
            padding: 42px; /* Ajoutez de la marge autour du texte */
            background: rgba(0, 0, 0, 0.5); /* Fond semi-transparent pour améliorer la lisibilité du texte */
        }
    </style>
    
    
</head>
<body>
 
    <div class="left-text">
        <h1><b>BIENVENU(E)</b></h1>
        <br>
        <br>
        
        <p>
Bienvenue sur notre plateforme de location de voitures ! Nous sommes ravis de vous retrouver. Connectez-vous à votre compte pour accéder à une <br> expérience de location simple et rapide. <br>
Que vous planifiiez une escapade de week-end ou un voyage d'affaires,nous avons la voiture parfaite pour vous.
<br>
<br>
<br>
<b>Instructions de Connexion :</b><br>
Connectez-vous avec votre nom d'utilisateur et votre mot de passe pour explorer notre flotte diversifiée de véhicules. Chez nous, la location de voitures <br>devient une expérience sans tracas.
<br>
<br>
<br>
<b>Assistance et Inscription :</b>
Besoin d'aide pour vous connecter ou vous souhaitez créer un nouveau compte ? Cliquez ici pour vous inscrire ou ici si <br>   vous avez des problèmes de connexion.
<br>
<br>
<br>
<b>Bonne Route !</b>

        
    </div>
    <header class="container">
   
        <div class="login-page">
            <div class="form">
                <div class="icon-container">
                <div class="scrolling-text-container">
        <div class="scrolling-text">
            Bienvenue sur notre site Web!    
        </div>
    </div>
                    <img src="icone2.png" alt="Non disponible" class="img-fluid mb-3" />
                </div>
                <form method="get" action="personnelservlet">
                    <input name="email" type="text" placeholder="&#xf007; username" class="form-control"/>
                    <input name="password" type="password" id="password" placeholder="&#xf023; password" class="form-control"/>
                    <i class="fas fa-eye" onclick="show()"></i>
                    <input type="submit" value="Se connecter" class="btn btn-primary">
                    <br>
                </form>
            </div>
        </div>
    </header>


    <script>
        function show() {
            // Add your show/hide password logic here if needed
        }
    </script>

    <!-- Bootstrap JS and Popper.js CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
