package location;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Voiture {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID_VOITURE;
    private String marque;
    private String modele;
    private int annee;
    private String disponibilite;
    private float tarif;
    
	public int getID_VOITURE() {
		return ID_VOITURE;
	}
	public void setID_VOITURE(int ID_VOITURE) {
		this.ID_VOITURE =ID_VOITURE;
	}
	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	public String getModele() {
		return modele;
	}
	public void setModele(String modele) {
		this.modele = modele;
	}
	public int getAnnee() {
		return annee;
	}
	public void setAnnee(int annee) {
		this.annee = annee;
	}
	public String getDisponibilite() {
		return disponibilite;
	}
	public void setDisponibilite(String disponibilite) {
		this.disponibilite = disponibilite;
	}
	public void setTarif(float tarif) {
		this.tarif = tarif;
	}
	public float getTarif() {
		return tarif;
	}


}
