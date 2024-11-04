import 'package:flutter/material.dart';

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
                  color: const Color(0xFFFCEAD6),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
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
                    _buildBottomNavigationBarItem(Icons.explore, "Explorer", 0),
                    _buildBottomNavigationBarItem(Icons.favorite, "Favoris", 1),
                    _buildBottomNavigationBarItem(
                        Icons.add_box, "Locations", 2),
                    _buildBottomNavigationBarItem(Icons.message, "Messages", 3),
                    _buildBottomNavigationBarItem(Icons.person, "Profil", 4),
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
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: _selectedIndex == index ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
