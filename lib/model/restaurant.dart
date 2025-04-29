// Modelo é um tipo de classe com a idade do conceito especial.
// Uma representação do mundo real, que trafega dados e tals...

import 'package:myapp/model/dish.dart';

class Restaurant {
  String id;
  String imagePath;
  String name;
  String description;
  double stars;
  int distance;
  List<String> categories;
  List<Dish> dishes;

  Restaurant({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.stars,
    required this.distance,
    required this.categories,
    required this.dishes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'stars': stars,
      'distance': distance,
      'categories': categories,
      // Para cada elemento de dishes, ele chama o método toMap()
      // para dish ele vai retornar um map de dish e depois transforma em uma lista
      'dishes': dishes.map((dish) => dish.toMap()).toList(),
    };
  }

  // factory é quando queremos usar um construtor que usa outro construtor.
  // Ex: Pegamos o construtor Restaurant, e criamos outro que recebe um Map(json).
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      description: map['description'],
      stars: map['stars'],
      distance: map['distance'],
      categories: List<String>.from(map['categories']),
      // Ele pega cada map(dish) do json e transforma em Dish e adiciona dentro
      // de uma lista interna dentro de restaurant
      dishes: List<Dish>.from(map['dishes'].map((dish) => Dish.fromMap(dish))),
    );
  }

  @override
  String toString() {
    return 'Restaurant{id: $id, imagePath: $imagePath, name: $name, description: $description, stars: $stars, distance: $distance, categories: $categories}';
  }
}
