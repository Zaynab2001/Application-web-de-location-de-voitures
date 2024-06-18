<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
    <script>
    function displaySuccess() {
        // Afficher une alerte de réussite
        $('#successAlert').fadeIn();

        // Rediriger vers la page facture.jsp après un court délai (par exemple, 2 secondes)
        setTimeout(function() {
            window.location.href = "paymentform.jsp";
        }, 2000);
    }</script>
</head>
<body class="bg-light">
<br>
<br>
<br>
<br>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Payer Votre Facture</h2>
<br>
<h3 class="text-center" style="font-style: italic; font-size: 14px;">
    Merci de finaliser votre réservation en procédant au paiement. Nous sommes ravis de vous accompagner dans votre voyage et de vous fournir la voiture parfaite pour rendre votre expérience inoubliable. Bonne route et à bientôt sur les routes.
</h3>
<br>
<br>

<br>

                        <form action="PaymentServlett" method="get">
                            <div class="form-group row">
                                <label for="amount" class="col-sm-4 col-form-label">Amount:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="amount" name="amount" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="cardNumber" class="col-sm-4 col-form-label">Card Number:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="cardNumber" name="cardNumber" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="expirationDate" class="col-sm-4 col-form-label">Expiration Date (MM/YYYY):</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="expirationDate" name="expirationDate" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="cvv" class="col-sm-4 col-form-label">CVV:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="cvv" name="cvv" required>
                                </div>
                            </div>

                           <div class="form-group row">
    <div class="col-sm-8 offset-sm-4">
        <input type="submit" class="btn btn-success w-100 mx-auto" value="Payer">
 
                                  <br>
                                  <br>
                                  <br>
                                  <br>
                                  <br>
                                  <br>
                                </div>
                            </div>
                        </form>
                         <div id="successAlert" class="alert alert-success mt-3" style="display:none;">
                            Payement effectuée avec succès!
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
