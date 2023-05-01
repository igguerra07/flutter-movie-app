import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app/src/app/di/di.dart';
import 'package:movie_app/src/app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final environment = await _getEnvironmentByFlavor();
  await configureDependencies(environment);
  runApp(const MovieApp());
}

Future<String> _getEnvironmentByFlavor() async {
  const platform = MethodChannel('flavor');
  String? environment = await platform.invokeMethod<String>('getFlavor');
  return environment ?? Environment.prod;
}
