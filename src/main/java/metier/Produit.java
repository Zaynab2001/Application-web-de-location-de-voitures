package metier;
import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;  

@Entity
@Table(name="PRODUITS")
public class Produit implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idProduit;
	private String nomProduit;
	private double prix;
	public Produit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Produit(String nomProduit,double prix) {
		super();
		this.nomProduit=nomProduit;
		this.prix=prix;
	}
	public String getnomProduit() {
		return nomProduit;
		
	}
	public Long getIdProduit() {
		return idProduit;
	}
	public void setIdProduit(Long idProduit) {
		this.idProduit = idProduit;
	}
	public String getNomProduit() {
		return nomProduit;
	}
	public void setNomProduit(String nomProduit) {
		this.nomProduit = nomProduit;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
}
