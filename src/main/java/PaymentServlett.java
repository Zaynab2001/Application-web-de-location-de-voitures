import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import location.transaction;

public class PaymentServlett extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
       
       String amount = request.getParameter("amount");
        String cardNumber = request.getParameter("cardNumber");
        String expirationDate = request.getParameter("expirationDate");
        String cvv = request.getParameter("cvv");

        // Create EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
        EntityManager em = emf.createEntityManager();

        try {
            // Begin transaction
           em.getTransaction().begin();
        

            // Create a new transaction
            transaction transactionEntity = new transaction();
          
             // Assuming current date
            transactionEntity.setMontant(amount);
            transactionEntity.setNumeroCarte(cardNumber);
            transactionEntity.setDateExpiration(expirationDate);
            transactionEntity.setCvv(cvv);

            // Persist the transaction
            em.persist(transactionEntity);

            // Commit transaction
            em.getTransaction().commit();

          response.sendRedirect("paymentform.jsp"); 

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            // Close EntityManager
            em.close();
            emf.close();
        }
    }
}
