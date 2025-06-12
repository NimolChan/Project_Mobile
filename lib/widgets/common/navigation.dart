import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  int _getCurrentIndex(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    switch (route) {
      case '/home': return 0;
      case '/collection': return 1;
      case '/visualize': return 2;
      case '/personal': return 3;
      case '/settings': return 4;
      default: return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(context),
      onTap: (index) {
        switch (index) {
          case 0: Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          case 1: Navigator.pushNamedAndRemoveUntil(context, '/collection', (_) => false);
          case 2: Navigator.pushNamedAndRemoveUntil(context, '/visualize', (_) => false);
          case 3: Navigator.pushNamedAndRemoveUntil(context, '/personal', (_) => false);
          case 4: Navigator.pushNamedAndRemoveUntil(context, '/settings', (_) => false);
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'Collection'),
        BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Visualize'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Personal'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
      ],
    );
  }
}