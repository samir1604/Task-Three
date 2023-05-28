import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_three/data/data_provider.dart';
import 'package:task_three/data/repository/shared_repository.dart';
import 'package:task_three/features/auth/repository/auth_repository.dart';

final injector = GetIt.instance;

Future<void> setupInjector() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  injector
      .registerLazySingleton<DataProvider>(() => DataProvider(injector.get()));
  injector.registerLazySingleton<AuthRepository>(
      () => SharedRepository(injector.get<DataProvider>()));
}
