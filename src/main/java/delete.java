

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
 * Servlet implementation class delete
 */
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
	        EntityManager em = emf.createEntityManager();

	        
	            em.getTransaction().begin();

	            // Récupérer les paramètres de la requête
	            

	            
	                // Si l'action est "delete", récupérer les paramètres de la voiture à supprimer
	                String marque = request.getParameter("marque");
	                String modele = request.getParameter("modele");

	                // Utiliser JPQL pour supprimer l'entité Voiture de la base de données
	                Query query = em.createQuery("DELETE FROM Voiture v WHERE v.marque = :marque and modele=:modele");
	                query.setParameter("marque", marque);
	                query.setParameter("modele",modele);

	                // Exécuter la requête de suppression
	                query.executeUpdate();
	            
	              

	            em.getTransaction().commit();
	        
	            em.close();
	            emf.close();
	        

	        // Rediriger l'utilisateur vers la page de résultats
	        response.sendRedirect("traitementvoitures.jsp");
	
	
	}

}
