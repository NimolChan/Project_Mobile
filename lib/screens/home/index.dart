import 'package:flutter/material.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Content')),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}