import 'package:flutter/material.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';

class PersonalizationScreen extends StatelessWidget {
  const PersonalizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personalization')),
      body: const Center(child: Text('Personalization Content')),
      bottomNavigationBar: const CustomBottomNav(currentRoute: '/personal'),
    );
  }
}