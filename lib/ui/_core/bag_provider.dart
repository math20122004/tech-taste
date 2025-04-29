import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';

// O ChangeNotifier permite que toda a aplicação acesse únicamente uma
// instância de BagProvider
class BagProvider extends ChangeNotifier {
  List<Dish> listOnBag = [];

  addAllDisher(List<Dish> dishes) {
    listOnBag.addAll(dishes);
    // Fala para todo mundo que estiver ouvindo esse provider,
    // e todo mundo atualiza sua inteface.
    notifyListeners();
  }

  removeDish(Dish dish) {
    listOnBag.remove(dish);
    notifyListeners();
  }

  clearBag() {
    listOnBag.clear();
    notifyListeners();
  }

  Map<Dish, int> getMapByAmount() {
    Map<Dish, int> mapResult = {};

    for (Dish dish in listOnBag) {
      if (mapResult[dish] == null) {
        mapResult[dish] = 1;
      } else {
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }

    return mapResult;
  }
}
