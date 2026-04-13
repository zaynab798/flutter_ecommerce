import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/projet_e_commerce/model/class_produit_panier.dart';

class PanierProvider with ChangeNotifier {
  List<ProduitPanier> _panier = [];
  List<ProduitPanier> get Panier => _panier;
  int get nombreProduits => _panier.fold(0, (sum, item) => sum + item.quantite);

  double get totalAmount =>
      _panier.fold(0, (sum, item) => sum + item.price * item.quantite);

  void ajouterProduit(ProduitPanier newProduct) {
    final index = _panier.indexWhere((art) => art.id == newProduct.id);
    if (index >= 0) {
      _panier[index].quantite += 1;
    } else {
      _panier.add(
        ProduitPanier(
          id: newProduct.id,
          title: newProduct.title,
          description: newProduct.description,
          price: newProduct.price,
          imageUrl: newProduct.imageUrl,
          quantite: 1,
        ),
      );
    }
    notifyListeners();
  }

  void incrementer(String productId) {
    final index = _panier.indexWhere((art) => art.id == productId);
    if (index >= 0) {
      _panier[index].quantite++;
      notifyListeners();
    }
  }

  void decrementer(String id) {
    final index = _panier.indexWhere((art) => art.id == id);
    if (index >= 0) {
      if (_panier[index].quantite > 1) {
        _panier[index].quantite--;
      } else {
        _panier.removeAt(index); // supprime si quantité atteint 0
      }
      notifyListeners();
    }
  }

  void supprimerProduit(String id) {
    _panier.removeWhere((art) => art.id == id);
    notifyListeners();
  }

  void viderPanier() {
    _panier.clear();
    notifyListeners();
  }
}
