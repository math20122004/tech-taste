import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';

// Definindo um tema
abstract class AppTheme {
  static ThemeData appTheme = ThemeData.dark().copyWith(
    // Definindo um theme para o botão
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // Cor do texto do botão
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        // Fundo do botão
        backgroundColor: WidgetStateColor.resolveWith((state) {
          // If para quando o botão não estiver pressionado
          if (state.contains(WidgetState.disabled)) {
            return Colors.grey;
          } else if (state.contains(WidgetState.pressed)) {
            //If para quando o botão for pressionado
            return const Color.fromARGB(143, 255, 164, 89);
          }
          return AppColors.mainColor;
        }),
      ),
    ),
  );
}
