import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brico_voisin/theme/colors.dart';

class NavigationMenu extends StatefulWidget {
  final List<Widget> pages;

  const NavigationMenu({super.key, required this.pages});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.backgroundColor,
      body: Stack(
        children: [
          widget.pages[_selectedIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 0, left: 20, right: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: MainColor.menuBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: Border(
                      top: BorderSide(
                          color: Colors.black, width: 4), // Bordure en haut
                      left: BorderSide(
                          color: Colors.black, width: 4), // Bordure à gauche
                      right: BorderSide(
                          color: Colors.black, width: 4), // Bordure à droite
                      // Pas de bordure inférieure
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: const Offset(12, 12), // Ombre
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.transparent,
                      selectedItemColor: MainColor
                          .selectedItemColor, // Couleur sélectionnée depuis MainColor
                      unselectedItemColor: Colors.black,
                      showSelectedLabels: false, // Cacher le label par défaut
                      showUnselectedLabels: false, // Cacher le label par défaut
                      currentIndex: _selectedIndex,
                      onTap: _onItemTapped,
                      type: BottomNavigationBarType.fixed,
                      elevation: 0,
                      items: [
                        _buildBottomNavigationBarItem(
                            'assets/images/home.svg', "Explorer", 0),
                        _buildBottomNavigationBarItem(
                            'assets/images/favourite.svg', "Favoris", 1),
                        _buildBottomNavigationBarItem(
                            'assets/images/add-rectangle.svg', "Locations", 2),
                        _buildBottomNavigationBarItem(
                            'assets/images/chat.svg', "Messages", 3),
                        _buildBottomNavigationBarItem(
                            'assets/images/profile.svg', "Profil", 4),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String assetPath, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      label: '',
      icon: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              assetPath,
              color: isSelected
                  ? MainColor.selectedItemColor
                  : Colors.black, // Couleur de l'icône sélectionnée
              height: 24,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? MainColor.selectedItemColor
                    : Colors.black, // Couleur du texte sélectionné
                fontSize: 11,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal, // Gras quand sélectionné
                fontFamily: 'Sora',
              ),
              overflow: TextOverflow.visible, // Désactive le tronquage
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
