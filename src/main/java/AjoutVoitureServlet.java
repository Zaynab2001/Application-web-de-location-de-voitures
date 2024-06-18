import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import location.Voiture;

public class AjoutVoitureServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("location");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (EntityManager entityManager = emf.createEntityManager()) {
            EntityTransaction transaction = entityManager.getTransaction();

            try {
                // Récupérer les paramètres du formulaire
                String marque = request.getParameter("marque");
                String modele = request.getParameter("modele");
                int annee = Integer.parseInt(request.getParameter("annee"));
                String disponibilite = request.getParameter("disponibilite");
                float tarif = Float.parseFloat(request.getParameter("tarif"));

                // Créer une nouvelle instance de Voiture
                Voiture nouvelleVoiture = new Voiture();
                nouvelleVoiture.setMarque(marque);
                nouvelleVoiture.setModele(modele);
                nouvelleVoiture.setAnnee(annee);
                nouvelleVoiture.setDisponibilite(disponibilite);
                nouvelleVoiture.setTarif(tarif);

                // Démarrer la transaction
                transaction.begin();

                // Persister la nouvelle voiture
                entityManager.persist(nouvelleVoiture);

                // Valider la transaction
                transaction.commit();

                response.sendRedirect("traitementvoitures.jsp"); // Rediriger vers une page de confirmation

            } catch (Exception e) {
                if (transaction != null && transaction.isActive()) {
                    transaction.rollback();
                }
                e.printStackTrace();
                response.sendRedirect("index.jsp"); // Rediriger vers une page d'erreur
            }
        }
    }

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
