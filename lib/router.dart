import 'package:flutter/material.dart';
import 'package:test_flutter/home.dart';
import 'package:test_flutter/setting.dart';

class AppRouter {
  static const String initialRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case 'setting':
        return MaterialPageRoute(builder: (_) => const Setting());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
