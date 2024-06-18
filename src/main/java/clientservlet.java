import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import location.client;
import location.personnel;

public class clientservlet extends HttpServlet {
    public clientservlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
                EntityManager em = emf.createEntityManager()) {

               // Recherchez un personnel avec l'e-mail donné
               Query query = em.createQuery("SELECT c FROM client c WHERE c.email = :email and c.password = :password");
               query.setParameter("email", email);
               query.setParameter("password", password);

               // Obtenez la liste des résultats
               List<client> resultList = query.getResultList();

               if (!resultList.isEmpty()) {
                   // L'utilisateur est authentifié avec succès, redirigez-le vers une page de succès
                   response.sendRedirect("choixclient.jsp");
               } else {
                   // Mot de passe incorrect, redirigez vers une page d'échec
                   response.sendRedirect("index.jsp");
               }
           } catch (Exception e) {
               e.printStackTrace(); // Gérer les exceptions de manière appropriée dans un environnement de production
               response.sendRedirect("error.jsp"); // Redirigez vers une page d'erreur en cas d'exception
           }
    }
}
