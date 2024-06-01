import 'package:effective_mobile/core/env/images_and_icons_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<String> _routeNames = [
    '/avia',
    '/hostel',
    '/map',
    '/subscription',
    '/profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.go(_routeNames[index]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(StaticPath.aviaticket),
              ),
              label: 'Авиабилеты',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(StaticPath.hostel),
              ),
              label: 'Отели',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(StaticPath.map),
              ),
              label: 'Короче',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(StaticPath.subscription),
              ),
              label: 'Подписки',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(StaticPath.profile),
              ),
              label: 'Профиль',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
