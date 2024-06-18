package location;

import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "transaction")
public class transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_TRANSACTION")
    private int idTransaction;

    @ManyToOne
    @JoinColumn(name = "ID_RESERVATION")
    private Reservation reservation;

    @Column(name = "DateTransaction")
    private String dateTransaction;

    @Column(name = "Montant")
    private String montant;

    @Column(name = "NumeroCarte")
    private String numeroCarte;

    @Column(name = "DateExpiration")
    private String dateExpiration;

    @Column(name = "CVV")
    private String cvv;

	public int getIdTransaction() {
		return idTransaction;
	}

	public void setIdTransaction(int idTransaction) {
		this.idTransaction = idTransaction;
	}

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	public String getDateTransaction() {
		return dateTransaction;
	}

	public void setDateTransaction(String dateTransaction) {
		this.dateTransaction = dateTransaction;
	}

	public String getMontant() {
		return montant;
	}

	public void setMontant(String montant) {
		this.montant = montant;
	}

	public String getNumeroCarte() {
		return numeroCarte;
	}

	public void setNumeroCarte(String numeroCarte) {
		this.numeroCarte = numeroCarte;
	}

	public String getDateExpiration() {
		return dateExpiration;
	}

	public void setDateExpiration(String dateExpiration) {
		this.dateExpiration = dateExpiration;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

  
}
