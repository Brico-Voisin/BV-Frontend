import 'package:flutter/material.dart';
import 'package:brico_voisin/screen/listing_product.dart'; // Importez les pages ici
// Pages suivantes

class PageManager {
  static List<Widget> getPages() {
    return [
      const MyListingProductContent(),
      // Remplacer par les pages :
      const Center(child: Text("Favoris")),
      const Center(child: Text("Locations")),
      const Center(child: Text("Messages")),
      const Center(child: Text("Profil")),
    ];
  }
}
