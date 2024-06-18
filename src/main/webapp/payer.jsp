<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulaire de Transaction</title>
    <!-- Inclure ici vos liens vers les styles CSS ou autres ressources -->
</head>
<body>
    <h1>Formulaire de Transaction</h1>
    <form action="paymentservlet" method="get">
        <label for="reservationId">ID de la Réservation :</label>
        <input type="text" name="reservationId" required>

        <label for="dateTransaction">Date de Transaction :</label>
        <input type="text" name="dateTransaction" required>

        <label for="montant">Montant :</label>
        <input type="text" name="montant" required>

        <button type="submit">Enregistrer la Transaction</button>
    </form>
    <!-- Inclure ici d'autres éléments HTML ou scripts nécessaires -->
</body>
</html>
