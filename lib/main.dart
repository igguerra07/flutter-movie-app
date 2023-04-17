import 'package:flutter/material.dart';

import 'package:movie_app/src/app/di/di.dart';
import 'package:movie_app/src/app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MovieApp());
}
