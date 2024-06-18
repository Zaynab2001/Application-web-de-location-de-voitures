import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import location.client;

public class InscriptionServlet extends HttpServlet {
    public InscriptionServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            // Vérifiez si l'utilisateur avec cet e-mail existe déjà
            TypedQuery<client> query = em.createQuery("SELECT c FROM client c WHERE c.email = :email", client.class);
            query.setParameter("email", email);

            client existingClient = null;
            try {
                existingClient = query.getSingleResult();
            } catch (NoResultException e) {
                // Aucun utilisateur avec cet e-mail trouvé
            }
            if (existingClient == null) {
                // Créez un nouvel objet client et enregistrez-le dans la base de données
                client newClient = new client();
            
                newClient.setNom(nom);
                newClient.setPrenom(prenom);
                newClient.setEmail(email);
                newClient.setPassword(password);

                em.persist(newClient);
                et.commit();
                
                // Redirigez l'utilisateur vers une page de succès après l'inscription
                response.sendRedirect("register.jsp");
            } else {
                // L'utilisateur avec cet e-mail existe déjà, redirigez vers une page d'échec
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            // Une erreur s'est produite, redirigez vers une page d'échec
            System.out.println("ERROR");
            et.rollback();
            e.printStackTrace();
        } finally {
            em.close();
            emf.close();
        }
    }
}
