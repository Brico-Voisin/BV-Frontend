// lib/screen/locations_page.dart
import 'package:flutter/material.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location")),
      body: const Center(child: Text("Contenu des Locations")),
    );
  }
}
