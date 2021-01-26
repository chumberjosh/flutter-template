import 'package:appTemplate/auth/login.dart';
import 'package:appTemplate/main-views/main.dart';
import 'package:appTemplate/navigation/routing_constraints.dart';
import 'package:appTemplate/navigation/undefined_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case SignupViewRoute:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case MainViewRoute:
      return MaterialPageRoute(builder: (_) => MainView());

    default:
      return MaterialPageRoute(builder: (_) => UndefinedView());
  }
}
