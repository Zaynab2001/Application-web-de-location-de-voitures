

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import location.Reservation;
import location.Voiture;
import location.client;

/**
 * Servlet implementation class reservationclient
 */
public class reservationclient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reservationclient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Créer l'EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
        EntityManager em = emf.createEntityManager();

        try {
            // Récupérer les informations depuis Client, Voiture et Reservation
            String jpql = "SELECT c.nom, c.prenom, v.marque, v.modele, v.annee, r.DateDebut, r.DateFin " +
                          "FROM client c, Voiture v, Reservation r " +
                          "WHERE r.client = c AND r.voiture = v AND v.disponibilite = 'Non Disponible'";

            List<Object[]> results = em.createQuery(jpql, Object[].class).getResultList();

            // Mettre les résultats dans la requête pour les afficher dans la page JSP
            request.setAttribute("results", results);

            // Rediriger vers la page HTML
            request.getRequestDispatcher("reservationclient.jsp").forward(request, response);

        } finally {
            // Fermer l'EntityManager
            em.close();
            emf.close();
        }
    }
	}



