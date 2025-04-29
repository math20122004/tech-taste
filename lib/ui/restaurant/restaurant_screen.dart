import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("./assets/${restaurant.imagePath}", width: 128),
            Text(
              "Mais pedidos",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
                return ListTile(
                  leading: Image.asset("./assets/dishes/default.png"),
                  title: Text(dish.name),
                  subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    onPressed: () {
                      // Ele faz alteração no Provider. Não necessariamente
                      // precisa ficar ouvindo.
                      // Pega o BagProvider uma vez e chama o addAllDisher
                      // que dentro dela tinhao notifyListeners que comunica
                      // a mudança.
                      context.read<BagProvider>().addAllDisher([dish]);
                    },
                    icon: Icon(Icons.add),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
