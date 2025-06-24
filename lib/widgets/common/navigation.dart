// import 'package:flutter/material.dart';

// class CustomBottomNav extends StatelessWidget {
//   final int currentIndex;
//   const CustomBottomNav({Key? key, required this.currentIndex})
//     : super(key: key);

//   void _navigateTo(BuildContext context, int index) {
//     if (index == currentIndex) return; // Avoid unnecessary navigation
//     switch (index) {
//       case 0:
//         Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
//         break;
//       case 1:
//         Navigator.pushNamedAndRemoveUntil(context, '/collection', (_) => false);
//         break;
//       case 2:
//         Navigator.pushNamedAndRemoveUntil(context, '/visualize', (_) => false);
//         break;
//       case 3:
//         Navigator.pushNamedAndRemoveUntil(context, '/personal', (_) => false);
//         break;
//       case 4:
//         Navigator.pushNamedAndRemoveUntil(context, '/settings', (_) => false);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 5,
//             offset: Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildNavItem(context, 0, Icons.home, "Home"),
//           _buildNavItem(context, 1, Icons.widgets, "Sets"),
//           _buildNavItem(context, 2, Icons.insights, "Visualize"),
//           _buildNavItem(context, 3, Icons.person, "Personal"),
//           _buildNavItem(context, 4, Icons.settings, "Setting"),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(
//     BuildContext context,
//     int index,
//     IconData icon,
//     String label,
//   ) {
//     final isSelected = currentIndex == index;
//     return GestureDetector(
//       onTap: () => _navigateTo(context, index),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: isSelected ? Colors.purple : Colors.grey),
//           SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(
//               color: isSelected ? Colors.purple : Colors.grey,
//               fontSize: 12,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
  
// }

import 'package:flutter/material.dart';
import 'package:stylishcloset/utils/constant.dart';

class CustomBottomNav extends StatelessWidget {
  final String currentRoute;
  
  const CustomBottomNav({
    Key? key,
    required this.currentRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            label: 'Home',
            icon: Icons.home,
            isActive: currentRoute == '/home',
            onTap: () => _navigateTo(context, '/home'),
          ),
          _NavItem(
            label: 'Collection',
            icon: Icons.view_list_rounded,
            isActive: currentRoute == '/collection',
            onTap: () => _navigateTo(context, '/collection'),
          ),
          _NavItem(
            label: 'Visualize',
            icon: Icons.auto_awesome,
            isActive: currentRoute == '/visualize',
            onTap: () => _navigateTo(context, '/visualize'),
          ),
          _NavItem(
            label: 'Personal',
            icon: Icons.person,
            isActive: currentRoute == '/personal',
            onTap: () => _navigateTo(context, '/personal'),
          ),
          _NavItem(
            label: 'Settings',
            icon: Icons.settings,
            isActive: currentRoute == '/settings',
            onTap: () => _navigateTo(context, '/settings'),
          ),
        ],
      ),
      // (context, 0, Icons.home, "Home"),
    );
  }

  void _navigateTo(BuildContext context, String routeName) {
    if (currentRoute != routeName) {
      Navigator.pushNamed(context, routeName);
    }
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final IconData icon;

  const _NavItem({
    Key? key,
    required this.label,
    required this.isActive,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Measure text width using TextPainter
    final TextPainter textLength = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(
            icon,
            color: isActive ? AppColors.purple : Colors.grey,
          ),
          // Add a SizedBox for spacing between icon and text
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontFamily: "Poppins",
              color: isActive ? AppColors.purple : AppColors.grey,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              height: 2.0,
              width: textLength.width + 6, // Use the measured text width
              color: AppColors.purple,
            ),
        ],
      ),
    );
  }
}