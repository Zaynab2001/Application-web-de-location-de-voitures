<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulaire d'Inscription Client</title>
    <link rel="stylesheet" type="text/css" href="register.css">
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
   <h1 style="color: white;">Inscription Client</h1>
    <form action="InscriptionServlet" method="get">
        
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required><br>
        
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom" required><br>
        
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br>
        
        <label for="password">Mot de passe:</label>
        <input type="password" id="password" name="password" required><br>
        
        <input type="submit" value="S'inscrire">
    </form>
    <script src="script.js"></script>
</body>
</html>