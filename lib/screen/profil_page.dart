import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
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
      body: const Center(child: Text("Contenu du Profil")),
    );
  }
}
