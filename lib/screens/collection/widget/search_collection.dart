import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final String currentRoute;

  const CustomBottomNav({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.home_outlined, 'label': 'Home', 'route': '/home'},
      {'icon': Icons.dashboard_outlined, 'label': 'Sets', 'route': '/set'},
      {'icon': Icons.stars_outlined, 'label': 'Visualize', 'route': '/visualize'},
      {'icon': Icons.person_outline, 'label': 'Personal', 'route': '/personal'},
      {'icon': Icons.settings_outlined, 'label': 'Setting', 'route': '/setting'},
    ];

    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          final isSelected = currentRoute == item['route'];
          return GestureDetector(
            onTap: () {
              // Navigate to the respective route
              Navigator.pushNamed(context, item['route'] as String);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item['icon'] as IconData,
                  color: isSelected ? const Color(0xFF6B73FF) : Colors.grey,
                  size: 24,
                ),
                const SizedBox(height: 2),
                Text(
                  item['label'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? const Color(0xFF6B73FF) : Colors.grey,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}