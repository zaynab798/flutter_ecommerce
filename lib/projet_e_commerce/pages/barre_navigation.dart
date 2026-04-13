import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/favoris.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/home_page.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/page_user.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/panier.dart';
import 'package:flutter_ecommerce/projet_e_commerce/pages/produit_list.dart';

class BarreNavigationScreen extends StatefulWidget {
  const BarreNavigationScreen({super.key});

  @override
  State<BarreNavigationScreen> createState() => _BarreNavigationScreenState();
}

class _BarreNavigationScreenState extends State<BarreNavigationScreen> {
  int selctedIndex = 0;
  List<Widget> myPages = [
    HomePage(),
    ProduitListPage(),
    PanierScreen(),
    FavorisPage(),
    UserInfoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selctedIndex = index;
          });
        },
        currentIndex: selctedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Product List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: myPages[selctedIndex],
    );
  }
}
