import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/restaurant.dart';

// ChangeNotifier = RestaurantData avisa sobre suas mudanças de estado
// para quem se importa com ela.
class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurants = [];

  Future<void> getRestaurants() async {
    // rootBundle lê o que tem no arquivo e trasnforma em string
    String jsonString = await rootBundle.loadString("./assets/data.json");
    // decode tem a inteligência de pega uma string(json) e transformar em um map
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantsJson = data['restaurants'];

    for (var restaurantData in restaurantsJson) {
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      listRestaurants.add(restaurant);
    }
  }
}
