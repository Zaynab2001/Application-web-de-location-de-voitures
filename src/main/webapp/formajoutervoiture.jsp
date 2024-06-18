<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulaire d'Ajout de Voiture</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }

        h1 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Ajout de Voiture</h1>
    <form action="AjoutVoitureServlet" method="post">
        <label for="marque">Marque :</label>
        <input type="text" id="marque" name="marque" required>

        <label for="modele">Modèle :</label>
        <input type="text" id="modele" name="modele" required>

        <label for="annee">Année :</label>
        <input type="text" id="annee" name="annee" required>

        <label for="disponibilite">Disponibilité :</label>
        <select id="disponibilite" name="disponibilite" required>
            <option value="disponible">Disponible</option>
            <option value="non-disponible">Non Disponible</option>
        </select>

        <label for="tarif">Tarif :</label>
        <input type="text" id="tarif" name="tarif" required>

        <input type="submit" value="Ajouter">
    </form>
</body>
</html>