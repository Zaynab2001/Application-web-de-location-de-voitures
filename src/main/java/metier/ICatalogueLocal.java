package metier;

import java.util.List;
@Local
public interface ICatalogueLocal {
	public void addProduit(Produit p);
	public List<Produit> getallProduits();
	public List<Produit> getProduitsParMotcle(String mc);
	public Produit getProduit(Long idP);
	public void removeProduit(Long idP);
	public void updateProduit(Produit p);

}
