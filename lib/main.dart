import 'package:appTemplate/themes/themes.dart';
import 'package:flutter/material.dart';
import 'navigation/router.dart' as router;
import 'navigation/routing_constraints.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: router.generateRoute,
      initialRoute: LoginViewRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
