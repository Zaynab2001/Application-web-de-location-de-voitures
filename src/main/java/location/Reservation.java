package location;

import java.util.Date;

import com.mysql.cj.xdevapi.Client;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="reservation")
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID_RESERVATION;

    @ManyToOne
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JoinColumn(name = "ID")
   
    private client client;

    @ManyToOne
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JoinColumn(name = "ID_VOITURE")
   
    private Voiture voiture;

    private Date DateDebut;
    private Date DateFin;
    private float MontantTotal;
   
	
	public client getClient() {
		return client;
	}
	public int getID_RESERVATION() {
		return ID_RESERVATION;
	}
	public void setID_RESERVATION(int iD_RESERVATION) {
		ID_RESERVATION = iD_RESERVATION;
	}
	public Date getDateDebut() {
		return DateDebut;
	}
	public void setDateDebut(Date dateDebut) {
		DateDebut = dateDebut;
	}
	public Date getDateFin() {
		return DateFin;
	}
	public void setDateFin(Date dateFin) {
		DateFin = dateFin;
	}
	public float getMontantTotal() {
		return MontantTotal;
	}
	public void setMontantTotal(float montantTotal) {
		MontantTotal = montantTotal;
	}
	public void setclient(client client) {
		this.client = client;
	}
	public Voiture getVoiture() {
		return voiture;
	}
	
	public void setClient(client client) {
		this.client = client;
	}
	public void setVoiture(Voiture voiture) {
		this.voiture = voiture;
	}
	

}