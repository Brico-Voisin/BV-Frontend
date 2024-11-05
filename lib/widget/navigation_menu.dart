import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: const Color(0xFFFFB020),
      body: Stack(
        children: [
          widget.pages[_selectedIndex], // Utiliser les pages passées
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0, left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFECDA),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0,
                      offset: const Offset(12, 12), // Ombre
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
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
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String assetPath, String label, int index) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          assetPath,
          color: _selectedIndex == index ? Colors.white : Colors.black,
          height: 24, // Ajustez la hauteur selon vos besoins
        ),
      ),
    );
  }
}
