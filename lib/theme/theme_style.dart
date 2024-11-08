import 'package:flutter/material.dart';
import 'package:brico_voisin/theme/colors.dart';

class AppThemeStyles {
  // Décoration commune pour les arrière-plans
  static BoxDecoration commonBackgroundDecoration = BoxDecoration(
    color: MainColor.menuBackgroundColor,
  );

  // Couleurs pour la barre d'application
  static Color appBarBackgroundColor = MainColor.menuBackgroundColor;
  static Color appBarIconColor = Colors.black;

  // Styles de texte
  static TextStyle appBarTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: 'AkiraExpanded',
    fontWeight: FontWeight.bold,
  );

  static TextStyle generalTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'AkiraExpanded',
    fontWeight: FontWeight.normal,
  );

  static TextStyle subTextStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontFamily: 'AkiraExpanded',
    fontWeight: FontWeight.normal,
  );

  static TextStyle priceTextStyle = const TextStyle(
    color: Colors.green,
    fontSize: 20,
    fontFamily: 'AkiraExpanded',
    fontWeight: FontWeight.bold,
  );

  static TextStyle errorTextStyle = const TextStyle(
    color: Colors.red,
    fontSize: 18,
    fontFamily: 'AkiraExpanded',
    fontWeight: FontWeight.normal,
  );

  static TextStyle emptyStateTextStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 18,
    fontFamily: 'AkiraExpanded',
    fontWeight: FontWeight.w500,
  );
}
