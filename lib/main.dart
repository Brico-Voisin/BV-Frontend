import 'package:brico_voisin/screen/Home.dart';
import 'package:flutter/material.dart';
 
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Brico Voisin ",
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}
