import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/projet_e_commerce/model/class_produit_panier.dart';
import 'package:flutter_ecommerce/projet_e_commerce/myWidgets/cart_empty.dart';
import 'package:flutter_ecommerce/projet_e_commerce/myWidgets/widget_produit_dans_panier.dart';
import 'package:flutter_ecommerce/projet_e_commerce/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class PanierScreen extends StatelessWidget {
  const PanierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //variable globale pour le panier
    final panierProvider = Provider.of<PanierProvider>(context);
    final contenuPanier = panierProvider.Panier;
    

    print("xxxTAILLE PANIER=" + contenuPanier.length.toString());

    return contenuPanier.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            //bottomSheet: chekcoutsection(cartProvider.totalAmount),
            appBar: AppBar(
              title: Text("Nombre Produits : ${contenuPanier.length}"),
              actions: [
                IconButton(onPressed: () {
                  //vider le panier
                  panierProvider.viderPanier();
                }, icon: const Icon(Icons.remove)),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: ListView.builder(
                itemCount: contenuPanier.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return WidgetProduitPanier(
                    produitPanier: contenuPanier[index],
                  );
                },
              ),
            ),
          );

    //CartEmpty(),
  }

  Widget chekcoutsection(double total) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.red),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 20),
            const Text("Total", style: TextStyle(color: Colors.black)),
            Text(
              total.toString(),
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
