import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'features/movies/presentation/pages/movies_overview/movies_overview_page.dart';
import 'injection.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoviesOverviewPage(),
    );
  }
}
