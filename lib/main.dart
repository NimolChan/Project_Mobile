import 'package:flutter/material.dart';
import 'package:stylishcloset/routes/routes.dart'; // Import the routes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish Closet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC064F1)),
      ),
      // initialRoute: '/settings',
      initialRoute: '/auth', // This will now load the loginPage first
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
