<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styleacceuil.css">
    <title>Accueil</title>
    <style>
        body {
            background-image: url('v.jpg'); /* Ajoutez le chemin de votre image */
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
        }
 		.right-aligned {
            text-align: right;
              margin-left: 200px;
             transform: translate(350px, 20px);
        }
        .c {
            color: white; /* Couleur du texte pour assurer la lisibilité sur le fond sombre */
        }
.title{
  text-align: right;
              margin-left: 200px;
             transform: translate(250px, 20px);
}
       
    </style>
</head>

<body class="c">
    <header class="container">
        <h1>Car rental service</h1>
        <nav>
            <ul>
                <li><a href="login.jsp">Espace Client</a></li>
                <li><a href="loginpersonel.jsp">Espace Personnel</a></li>
            </ul>
        </nav>
    </header>
    
    <div id="about" class="container">
        <!-- Supprimez la balise <img> ici -->
        <div class="col" id="text">
            <h1 class="title">Who We Are ?</h1>
            <p class="right-aligned">Welcome to rental car service Car Rentals, your go-to destination for seamless and convenient car rentals. At rental car service Car Rentals, we believe in providing you with the freedom to explore at your own pace. Our diverse fleet of vehicles, ranging from compact cars to spacious SUVs, ensures that you'll find the perfect ride for any occasion, whether it's a business trip, family vacation, or a weekend adventure. We offer flexible rental options, allowing you to choose the duration that suits your needs – be it by the hour, day, or week.

Booking with us is a breeze, thanks to our user-friendly online reservation system. Our responsive and dedicated customer service team is always on hand to assist you, ensuring that your rental experience is stress-free. With competitive rates and special offers, we aim to make your journey more affordable. Plus, our additional driver options allow you to share the driving responsibilities with ease.</p>
        </div>
    </div>

    <footer>
        <p>Ensak &copy; 2023</p>
    </footer>
</body>

</html>
