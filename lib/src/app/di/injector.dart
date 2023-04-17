// coverage:ignore-file
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/app/di/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
