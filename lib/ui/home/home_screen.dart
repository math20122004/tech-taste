import 'package:flutter/material.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:myapp/ui/home/widget/category_widget.dart';
import 'package:myapp/ui/home/widget/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);

    return Scaffold(
      // Menu hamburguer
      drawer: Drawer(),
      appBar: getAppBar(context: context),
      //AppBar(
      // O actions é uma lista de widgets (geralmente botões)
      // que aparece no canto direito da AppBar.
      // actions: [
      //   IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
      // ],
      //),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("./assets/logo.png", width: 147)),
              Text("Boas-Vindas!"),
              TextFormField(),
              Text("Escolha por categoria"),
              // Deixa a rolagem na horizontal, geralmente tem um filho
              // Row ou Column
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  // Gera um lista
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) => CategoryWidget(
                      category: CategoriesData.listCategories[index],
                    ),
                  ),
                ),
              ),
              Image.asset("./assets/banners/banner_promo.png"),
              Text("Bem avaliados"),
              Column(
                spacing: 10,
                children: List.generate(restaurantData.listRestaurants.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.listRestaurants[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
