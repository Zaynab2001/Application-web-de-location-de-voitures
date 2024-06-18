document.addEventListener('DOMContentLoaded', function() {
    const registrationForm = document.getElementById('registrationForm');
    registrationForm.addEventListener('submit', function(event) {
        event.preventDefault();
        alert('Formulaire soumis ! Vous pouvez ajouter ici la logique pour envoyer les données au serveur.');
    });
});
