import 'package:flutter/material.dart';
import 'package:stylishcloset/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish Closet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC064F1)),
      ),
      // initialRoute: '/auth',
      initialRoute: '/visualize',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
