

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import location.Reservation;


/**
 * Servlet implementation class ReservationServlet
 */
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 EntityManagerFactory emf = Persistence.createEntityManagerFactory("location");
	        EntityManager em = emf.createEntityManager();

	        try {
	            // Retrieve data from the request
	        	String nom = request.getParameter("nom");
	            String prenom = request.getParameter("prenom");
	            String dateDebutStr = request.getParameter("DateDebut");
	            String dateFinStr = request.getParameter("DateFin");
	            String montantTotalStr = request.getParameter("montantTotal");
	            

	            // Convert date strings to Date objects
	            Date DateDebut = new SimpleDateFormat("yyyy-MM-dd").parse(dateDebutStr);
	            Date DateFin = new SimpleDateFormat("yyyy-MM-dd").parse(dateFinStr);
	            float montantTotal = Float.parseFloat(montantTotalStr);

	            // Create a Reservation object
	            Reservation reservation = new Reservation();
	            reservation.setDateDebut(DateDebut);
	            reservation.setDateFin(DateFin);
	            reservation.setMontantTotal(montantTotal);
	           

	            // Start a transaction and persist the reservation
	            em.getTransaction().begin();
	            em.persist(reservation);
	            em.getTransaction().commit();
	            
	            HttpSession session = request.getSession();
	            session.setAttribute("nom", nom);
	            session.setAttribute("prenom", prenom);
	            session.setAttribute("DateDebut", dateDebutStr);
	            session.setAttribute("DateFin", dateFinStr);
	            session.setAttribute("montantTotal", montantTotalStr);
	            response.sendRedirect("facture.jsp?nom=" + nom + "&prenom=" + prenom + "&DateDebut=" + dateDebutStr + "&DateFin=" + dateFinStr + "&montantTotal=" + montantTotalStr);

	            // Close the EntityManager
	            em.close();
	            
	            // Redirect to a success page or handle the response as needed
	            
	        } catch (ParseException e) {
	            e.printStackTrace();
	          
	        } 
	}


}
