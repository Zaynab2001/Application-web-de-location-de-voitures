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
import location.personnel;

public class personnelservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public personnelservlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
             EntityManager em = emf.createEntityManager()) {

            // Recherchez un personnel avec l'e-mail donné
            TypedQuery<personnel> query = em.createQuery("SELECT p FROM personnel p WHERE p.email = :email and p.password = :password",personnel.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            // Obtenez la liste des résultats
            List<personnel> resultList = query.getResultList();

            if (!resultList.isEmpty()) {
                // L'utilisateur est authentifié avec succès, redirigez-le vers une page de succès
                response.sendRedirect("choixpersonnel.jsp");
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
