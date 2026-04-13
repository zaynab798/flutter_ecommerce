import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/projet_e_commerce/data/list_produits.dart';
import 'package:flutter_ecommerce/projet_e_commerce/myWidgets/un_produit.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/produit_detail.dart';

class ProduitListPage extends StatefulWidget {
  const ProduitListPage({super.key});

  @override
  State<ProduitListPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProduitListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page liste produits"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.4,
        children: List.generate(AllProductData.Produits.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'detail_produit', arguments: index);     
                      
            },
            child: WidgetProduit(produit: AllProductData.Produits[index]),
          );
        }),
      ),
    );
  }
}
