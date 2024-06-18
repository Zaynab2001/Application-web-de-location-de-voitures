package location;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "personnel")
public class personnel {
	public personnel() {
	}
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		 	private int ID_PERSONNEL;
			private String email;
			private String password;
			private String nom;
			private String prenom;
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

		@Column(name="ID_PERSONNEL")
		    public int getpersonalId() {
			return ID_PERSONNEL;
		}

		public void setpersonalId(int ID_PERSONNEL) {
			this.ID_PERSONNEL =ID_PERSONNEL;
		}

		    @Column(name="email")
		    public String getEmail() {
		        return email;
		    }

		    public void setEmail(String email) {
		        this.email = email;
		    }
		    @Column(name="password")
		    public String getPassword() {
		        return password;
		    }

			public void setPassword(String password) {
				this.password = password;
			}

}
