import 'package:dhikr_reminder/core/store/objectbox.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  Future<ObjectBox> get objectBox => ObjectBox.create();
}
