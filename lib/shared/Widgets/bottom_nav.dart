import 'package:flutter/material.dart';
import 'package:video_streaming_ui/router/main.dart';
import 'package:video_streaming_ui/router/navigation_service.dart';

class BottomNav extends StatefulWidget {
  final int currentIndex;
  const BottomNav({super.key, required this.currentIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  late NavigationService navigationService;

  @override
  void initState() {
    super.initState();
    navigationService = NavigationService(context);
    currentIndex = widget.currentIndex;
  }

  void routeToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        navigationService.push(CustomRouter.dashboard);
        break;
      case 1:
        navigationService.push(CustomRouter.explore);
        break;
      case 2:
        navigationService.push(CustomRouter.library);
        break;
      case 3:
        navigationService.push(CustomRouter.account);
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
