

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

/**
 * Servlet implementation class UpdateDisponibiliteServlet
 */
public class UpdateDisponibiliteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDisponibiliteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
	        EntityManager em = emf.createEntityManager();

	        try {
	            em.getTransaction().begin();

	            // Récupérer les paramètres de la requête
	            String marque = request.getParameter("marque");
	            String tarif = request.getParameter("tarif");
	            String modele = request.getParameter("modele");
	            String disponibilite = request.getParameter("disponibilite");

	            // Utiliser JPQL pour mettre à jour la disponibilité de la voiture
	            Query query = em.createQuery("UPDATE Voiture v SET v.disponibilite = :disponibilite WHERE v.marque = :marque AND v.tarif = :tarif AND v.modele = :modele");
	            query.setParameter("disponibilite", disponibilite);
	            query.setParameter("marque", marque);
	            query.setParameter("tarif", tarif);
	            query.setParameter("modele", modele);

	            // Exécuter la requête de mise à jour
	            query.executeUpdate();

	            em.getTransaction().commit();
	        } finally {
	            em.close();
	            emf.close();
	        }
	    }
	

}
