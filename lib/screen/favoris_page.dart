// lib/screen/favoris_page.dart
import 'package:flutter/material.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favoris")),
      body: const Center(child: Text("Contenu des Favoris")),
    );
  }
}
