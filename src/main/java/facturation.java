

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class facturation
 */
public class facturation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public facturation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Récupérer les valeurs depuis les paramètres de requête
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String dateDebut = request.getParameter("DateDebut");
        String dateFin = request.getParameter("DateFin");
        String montantTotal = request.getParameter("montantTotal");

        // Générer la facture
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("/facture.jsp").include(request, response);

        // Utiliser les valeurs récupérées pour personnaliser la facture
        response.getWriter().println("<p><strong>Nom :</strong> " + nom + "</p>");
        response.getWriter().println("<p><strong>Prénom :</strong> " + prenom + "</p>");
        response.getWriter().println("<p><strong>Date de Réservation :</strong> "
                + new SimpleDateFormat("yyyy-MM-dd").format(new Date()) + "</p>");
        response.getWriter().println("<p><strong>Date début :</strong> " + dateDebut + "</p>");
        response.getWriter().println("<p><strong>Date Fin :</strong> " + dateFin + "</p>");
        response.getWriter().println("<p><strong>Montant Total :</strong> " + montantTotal + " DH</p>");

		
	}

	

}
