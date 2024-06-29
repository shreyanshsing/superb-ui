import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  BottomNav({
    super.key,
    required this.currentIndex,
  });

  int currentIndex = 0;

  void routeToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/dashboard');
        break;
      case 1:
        Navigator.pushNamed(context, '/explore');
        break;
      case 2:
        Navigator.pushNamed(context, '/library');
        break;
      case 3:
        Navigator.pushNamed(context, '/account');
        break;
    }
  }

  void onTabTapped(BuildContext context, int index) {
    currentIndex = index;
    routeToPage(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => onTabTapped(context, index),
      currentIndex: currentIndex,
      elevation: 10,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      selectedFontSize: 12,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_outlined,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.video_library_outlined,
          ),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
          ),
          label: 'Account',
        ),
      ],
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white70,
    );
  }
}
