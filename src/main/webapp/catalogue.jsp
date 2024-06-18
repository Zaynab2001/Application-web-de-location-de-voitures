<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core">

<h:head>
    <title>Ajouter Produit</title>
</h:head>

<h:body>
    <h:form>
        <h:panelGrid columns="2">
            <h:outputLabel for="nomProduit">Nom du Produit:</h:outputLabel>
            <h:inputText id="nomProduit" value="#{produitBean.produit.nomProduit}" />
            
            <h:outputLabel for="prixProduit">Prix du Produit:</h:outputLabel>
            <h:inputText id="prixProduit" value="#{produitBean.produit.prix}" />

            <h:commandButton value="Ajouter Produit" action="#{produitBean.ajouterProduit}" />
        </h:panelGrid>
    </h:form>

    <h:dataTable value="#{produitBean.produits}" var="produit">
        <h:column>
            #{produit.idProduit}
        </h:column>
        <h:column>
            #{produit.nomProduit}
        </h:column>
        <h:column>
            #{produit.prix}
        </h:column>
    </h:dataTable>
</h:body>

</html>
