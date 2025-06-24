import 'package:flutter/material.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Settings')),
//       body: const Center(child: Text('Settings Content')),
//       bottomNavigationBar: const CustomBottomNav(currentRoute: '/settings'),
//     );
//   }
// }

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: Alignment.center,
          children: [
            /// Centered title
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Merienda One',
                color: Colors.black,
              ),
            ),

            /// Left logo
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/logo.png',
                width: 60,
                height: 60,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Profile Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                // Profile Image
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color.fromARGB(255, 207, 207, 207), width: 4),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      // width: 100,
                      // height: 100,
                      fit: BoxFit.cover,
                      ),
                  ),
                ),
                const SizedBox(height: 16),
                // Name
                const Text(
                  'Sweet Ort ?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                // Email
                const Text(
                  'nezha@gmail.com',
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 135, 134, 134)),
                ),
              ],
            ),
          ),

          // Settings List
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildSettingItem(
                    icon: Icons.language,
                    title: 'Language',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notification',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: Icons.description_outlined,
                    title: 'Terms of Use',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: Icons.info_outline,
                    title: 'Privacy Policy',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: Icons.support_agent_outlined,
                    title: 'Chat support',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(currentRoute: '/settings'),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          // decoration: BoxDecoration(
          //   color: Colors.grey[100],
          //   borderRadius: BorderRadius.circular(8),
          // ),
          child: Icon(icon, color: Colors.grey[600], size: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontFamily: 'Poppins',
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 24),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.white,
      ),
    );
  }
}
