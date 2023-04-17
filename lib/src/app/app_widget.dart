import 'package:flutter/material.dart';

import 'routes/routes.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "MovieApp",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      onGenerateRoute: RoutesGenerator.generate,
    );
  }
}
