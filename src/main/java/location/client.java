package location;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "client")
public class client {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int ID;
	    private String email;
	    private String nom;
	    private String prenom;
	    private String password;
	@Column(name="nom")
	    public String getNom() {
			return nom;
		}

		public void setNom(String nom) {
			this.nom = nom;
		}
@Column(name="prenom")
		public String getPrenom() {
			return prenom;
		}

		public void setPrenom(String prenom) {
			this.prenom = prenom;
		}
@Column(name="ID")
		public int getId() {
			return ID;
		}

		public void setId(int ID) {
			this.ID = ID;
		}

		
@Column(name="email")
	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }
@Column(name="Password")
	    public String getPassword() {
	        return password;
	    }

		public void setPassword(String password) {
			this.password = password;
		}

}
