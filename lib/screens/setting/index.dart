import 'package:flutter/material.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Content')),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}