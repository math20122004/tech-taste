import 'package:flutter/material.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/ui/_core/app_theme.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  // Roda a função e alimenta restaurantData
  await restaurantData.getRestaurants();
  runApp(
    // Cria um provedor baseado em restaurantData e diz que toda
    // aplicação vai conseguir acessar esse restaurantData que já carregou
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => restaurantData),
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      child: MyApp(),
    ),
  );
}

// Quando a tela não vai mudar
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
