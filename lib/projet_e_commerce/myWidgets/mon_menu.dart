import 'package:flutter/material.dart';

class MonMenu extends StatefulWidget {
  const MonMenu({super.key});

  @override
  State<MonMenu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MonMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Zaynab Khribi"),
            accountEmail: Text("zaynab.khribi@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://png.pngtree.com/recommend-works/png-clipart/20240716/ourmid/pngtree-hijab-woman-avatar-cartoon-png-image_13079536.png",
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Accueil"),
            onTap: () {
              Navigator.pushNamed(context, 'home_page');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, 'page_user');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Liste des produits"),
            onTap: () {
              Navigator.pushNamed(context, 'list_produits');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Panier"),
            onTap: () {
              Navigator.pushNamed(context, 'panier');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Mes Favoris"),
            onTap: () {
              Navigator.pushNamed(context, 'favoris');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Quitter"),
            onTap: () {
              Navigator.pushNamed(context, 'login_page');
            },
          ),
        ],
      ),
    );
  }
}
