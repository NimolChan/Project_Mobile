import 'package:flutter/material.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Collection')),
      body: const Center(child: Text('Collection Content')),
      bottomNavigationBar: const CustomBottomNav(currentRoute: '/collection'),
    );
  }
}