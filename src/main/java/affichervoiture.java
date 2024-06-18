

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import location.Voiture;

/**
 * Servlet implementation class affichervoiturenondispo
 */
public class affichervoiture extends HttpServlet {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public affichervoiture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  EntityManager entityManager = emf.createEntityManager();

	        // Récupérer la marque à partir du formulaire
	        String marque = request.getParameter("marque");

	        // Utiliser l'EntityManager pour exécuter la requête
	        TypedQuery<Voiture> query = entityManager.createQuery(
	                "SELECT v FROM Voiture v ", Voiture.class);

	       

	        // Récupérer les résultats de la requête
	        List<Voiture> voitures = query.getResultList();

	        // Mettre les résultats dans la requête pour les utiliser dans la JSP
	        request.setAttribute("voitures", voitures);
	        request.getRequestDispatcher("Rechercher.jsp").forward(request, response);
	}

	
}
