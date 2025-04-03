import 'Produit.dart';
import 'Commande.dart';

void main() {
  Produit telephone = Produit("Smartphone", 12000.0, 10, "Électronique");
  Produit ordinateur = Produit("Ordinateur Portable", 15000.0, 5, "Informatique");
  Produit casque = Produit("Casque Audio", 800.0, 20, "Accessoires");
  Produit montre = Produit("Montre Connectée", 2500.0, 15, "Gadgets");

  Set<Produit> produitsGlobal = {telephone, ordinateur, casque, montre};

  // Affichage des produits coûtant plus de 5000 DH
  print("Produits coûteux (plus de 5000 DH) :");
  produitsGlobal.where((produit) => produit.prix > 5000).forEach((produit) {
    print("- ${produit.nom} : ${produit.prix} DH");
  });
  print("\n");

  // Trouver et afficher le produit le plus cher
  Produit produitCher = produitsGlobal.reduce((prev, actuel) => prev.prix < actuel.prix ? actuel : prev);
  print("Produit le plus cher : ${produitCher.nom} - ${produitCher.prix} DH\n");

  // Appliquer une remise de 10% et afficher les nouveaux prix
  print("Produits après application de la remise de 10% :");
  List<Produit> listeAvecRemise = appliquerRemise10("Électronique", produitsGlobal);
  listeAvecRemise.forEach((produit) {
    print("- ${produit.nom} : ${produit.prix} DH");
  });
  print("\n");

  // Transformation des prix avec une réduction de 5%
  transformerPrix(produitsGlobal, null, (prix) => prix * 0.95);

  // Gestion des commandes
  Commande commande1 = Commande();
  Commande commande2 = Commande();
  Commande commande3 = Commande();
  try {
    commande1.ajouterProduit(telephone, 1);
    commande1.ajouterProduit(casque, 2);
    commande2.ajouterProduit(ordinateur, 1);
    commande2.ajouterProduit(montre, 1);
    commande3.ajouterProduit(casque, 3);
    commande3.ajouterProduit(montre, 2);

    print("===== Commandes =====");

    print("Commande 1 :");
    commande1.calculerTotal();
    commande1.afficherCommande();
    print("\n");

    print("Commande 2 :");
    commande2.calculerTotal();
    commande2.afficherCommande();
    print("\n");

    print("Commande 3 :");
    commande3.calculerTotal();
    commande3.afficherCommande();
    print("\n");
  } catch (e) {
    print("Erreur lors du traitement des commandes : $e");
  }
}
