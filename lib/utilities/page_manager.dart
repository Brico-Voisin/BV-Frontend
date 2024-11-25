import 'package:flutter/material.dart';
import 'package:brico_voisin/screen/home.dart';
import 'package:brico_voisin/screen/favoris_page.dart';
import 'package:brico_voisin/screen/locations_page.dart';
import 'package:brico_voisin/screen/messages_page.dart';
import 'package:brico_voisin/screen/profil_page.dart';

class PageManager {
  static List<Widget> getPages() {
    return [
      const Home(),
      const FavorisPage(),
      const LocationsPage(),
      const MessagesPage(),
      const ProfilPage(),
    ];
  }
}
