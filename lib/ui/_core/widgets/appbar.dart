import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/dish/checkout/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

AppBar getAppBar({required BuildContext context, String? title}) {
  // Estamos escutando o bagProvider da main, e temos que preparar
  // para receber as modicações que podem ocorrer.
  BagProvider bagProvider = Provider.of<BagProvider>(context);
  return AppBar(
    title: title != null ? Text(title) : null,
    centerTitle: true,
    actions: [
      badges.Badge(
        showBadge: bagProvider.listOnBag.isNotEmpty,
        position: badges.BadgePosition.bottomStart(bottom: 0, start: 0),
        badgeContent: Text(
          bagProvider.listOnBag.length.toString(),
          style: TextStyle(fontSize: 10),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen()),
            );
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ),
    ],
  );
}
