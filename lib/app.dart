import 'package:flutter/material.dart';
import 'package:techved_assignment/routes_keys.dart';
import 'package:techved_assignment/screens/home.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesKey.home: (context) {
          return Home();
        }
      },
    );
  }
}
