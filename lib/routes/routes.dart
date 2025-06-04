import 'package:flutter/material.dart';
import 'package:stylishcloset/screens/authentication/index.dart';
import 'package:stylishcloset/screens/collection/index.dart';
import 'package:stylishcloset/screens/home/index.dart';
import 'package:stylishcloset/screens/personalization/index.dart';
import 'package:stylishcloset/screens/setting/index.dart';
import 'package:stylishcloset/screens/visualization/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/auth':
        return MaterialPageRoute(builder: (_) => AuthenticationScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/collection':
        return MaterialPageRoute(builder: (_) => CollectionScreen());
      case '/visualize':
        return MaterialPageRoute(builder: (_) => VisualizationScreen());
      case '/personal':
        return MaterialPageRoute(builder: (_) => PersonalizationScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
