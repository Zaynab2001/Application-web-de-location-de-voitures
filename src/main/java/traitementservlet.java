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

public class traitementservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        // Initialisez votre EntityManagerFactory avec le nom de votre unité de persistance
        emf = Persistence.createEntityManagerFactory("location");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager entityManager = emf.createEntityManager();

        try {
            // Définissez votre requête JPQL
            String jpql = "SELECT v FROM Voiture v ";

            // Créez la requête
            TypedQuery<Voiture> query = entityManager.createQuery(jpql, Voiture.class);

           

            // Exécutez la requête et obtenez les résultats
            List<Voiture> voitures = query.getResultList();

            // Transférez les résultats à la page JSP
            request.setAttribute("voitures", voitures);
            request.getRequestDispatcher("traitementvoitures.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erreur.jsp"); // Rediriger vers une page d'erreur
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void destroy() {
        emf.close();
    }
}
