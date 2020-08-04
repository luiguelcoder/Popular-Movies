import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:popular_movies/localizations.dart';
import 'features/movies/presentation/pages/movies_overview/movies_overview_page.dart';
import 'injection.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      title: "Popular Movies",
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("en"), Locale("es")],
      debugShowCheckedModeBanner: false,
      home: MoviesOverviewPage(),
    );
  }
}
