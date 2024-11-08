import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brico_voisin/theme/theme_style.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeStyles.appBarBackgroundColor,
        title: Text(
          "Profil",
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
      body: Container(
        decoration: AppThemeStyles.commonBackgroundDecoration,
        child: Center(
          child: Text(
            "Contenu du Profil",
            style: AppThemeStyles.generalTextStyle,
          ),
        ),
      ),
    );
  }
}
