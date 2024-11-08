import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0, // Aligne le titre avec la flèche
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Ajuste selon ton thème
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: SvgPicture.asset(
                'assets/images/arrow-left.svg', // Icône SVG
                width: 24,
                height: 24,
                color: Colors.black, // Ajuste selon ton thème
              ),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFECDA), // Couleur de fond pour uniformiser
        ),
      ),
    );
  }
}
