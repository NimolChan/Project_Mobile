import 'package:flutter/material.dart';
import 'package:stylishcloset/screens/authentication/index.dart';
// import 'package:stylishcloset/screens/authentication/index.dart';
import 'package:stylishcloset/screens/authentication/login_screen.dart';
import 'package:stylishcloset/screens/authentication/signup_screen.dart';
import 'package:stylishcloset/screens/collection/index.dart';
import 'package:stylishcloset/screens/home/index.dart';
import 'package:stylishcloset/screens/personalization/personalize_screen.dart';
import 'package:stylishcloset/screens/setting/index.dart';
import 'package:stylishcloset/screens/visualization/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case '/auth':
        page = AuthenticationScreen();
        break;

      case '/home':
        page = HomeScreen();
        break;
      case '/collection':
        page = CollectionScreen();
        break;
      case '/visualize':
        page = VisualizationScreen();
        break;
      case '/personal':
        page = PersonalizationScreen();
        break;
      case '/settings':
        page = SettingsScreen();
        break;
      default:
        page = Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        );
    }
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder:
          (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
