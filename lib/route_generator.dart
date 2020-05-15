import 'package:flutter/material.dart';
import 'package:turkey/pages/home.dart';
import 'package:turkey/pages/properties.dart';
import 'package:turkey/pages/single_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/properties':
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => PropertiesPage(
            searchValues: args,
          ),
        );
      case '/properties/single':
        return MaterialPageRoute(
          builder: (_) => SinglePage(
            propertyData: args,
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
