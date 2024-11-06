import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messagerie"),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/arrow-left.svg',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(child: Text("Contenu des Messages")),
    );
  }
}
