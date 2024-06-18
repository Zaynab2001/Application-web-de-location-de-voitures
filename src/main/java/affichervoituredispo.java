import java.io.IOException; 
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import location.Voiture;
import location.VoitureService;
public class affichervoituredispo extends HttpServlet {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	  
    	  EntityManager entityManager = emf.createEntityManager();

    	        // Récupérer la marque à partir du formulaire
    	        String marque = request.getParameter("marque");

    	        // Utiliser l'EntityManager pour exécuter la requête
    	        TypedQuery<Voiture> query = entityManager.createQuery(
    	                "SELECT v FROM Voiture v WHERE v.disponibilite =:disponibilite", Voiture.class);

    	        query.setParameter("disponibilite", "disponible");

    	        // Récupérer les résultats de la requête
    	        List<Voiture> voitures = query.getResultList();

    	        // Mettre les résultats dans la requête pour les utiliser dans la JSP
    	        request.setAttribute("voitures", voitures);
    	        request.getRequestDispatcher("rechercherperso.jsp").forward(request, response);
    	       
    }
}
