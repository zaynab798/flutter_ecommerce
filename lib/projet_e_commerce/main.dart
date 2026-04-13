import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/barre_navigation.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/favoris.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/home_page.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/page_user.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/panier.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/produit_detail.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/produit_list.dart';
import 'package:flutter_ecommerce/projet_e_commerce/provider/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => PanierProvider()),
    ], child: const EcommerceApp()),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BarreNavigationScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        'home_page': (context) => HomePage(),
        'page_user': (context) => UserInfoPage(),
        'list_produits': (context) => ProduitListPage(),
        'panier': (context) => PanierScreen(),
        'favoris': (context) => FavorisPage(),
        'detail_produit': (context) => ProduitDetailScreen(),
      },
    );
  }
}
