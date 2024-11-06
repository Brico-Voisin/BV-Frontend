// lib/screen/messages_page.dart
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messagerie")),
      body: const Center(child: Text("Contenu des Messages")),
    );
  }
}
