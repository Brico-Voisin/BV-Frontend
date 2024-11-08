import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brico_voisin/theme/theme_style.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(180), // Ajuste la hauteur selon le besoin
        child: Stack(
          children: [
            Container(
              color: Color(0xFFFFECDA), // Couleur de fond
              child: SvgPicture.asset(
                'assets/images/top.svg',
                fit: BoxFit.cover,
                color: Color(0xFFFFDDBD), // Couleur de l'image SVG
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "Favoris",
                style: AppThemeStyles.appBarTextStyle,
              ),
              leading: Transform.translate(
                offset: const Offset(20, 0),
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/arrow-left.svg',
                    width: 32,
                    height: 32,
                    color: AppThemeStyles.appBarIconColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: AppThemeStyles.commonBackgroundDecoration,
        child: Center(
          child: Text(
            "Contenu des Favoris",
            style: AppThemeStyles.generalTextStyle,
          ),
        ),
      ),
    );
  }
}
