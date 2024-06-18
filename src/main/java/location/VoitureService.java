package location;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.Date;
import java.util.List;

public class VoitureService {

    @PersistenceContext
    private static EntityManager entityManager;

    public static List<Voiture> trouverVoituresDisponibles(String marque, Date dateDebut, Date dateFin) {
        TypedQuery<Voiture> query = entityManager.createQuery(
                "SELECT v FROM Voiture v " +
                        "WHERE v.marque = :marque " +
                        "AND v.disponibilite = true " +
                        "AND NOT EXISTS (" +
                        "   SELECT r FROM Reservation r " +
                        "   WHERE r.voiture = v " +
                        "   AND (:dateDebut BETWEEN r.dateDebut AND r.dateFin " +
                        "       OR :dateFin BETWEEN r.dateDebut AND r.dateFin " +
                        "       OR :dateDebut <= r.dateDebut AND :dateFin >= r.dateFin)" +
                        ")", Voiture.class);

        query.setParameter("marque", marque);
        query.setParameter("dateDebut", dateDebut);
        query.setParameter("dateFin", dateFin);

        return query.getResultList();
    }
}

