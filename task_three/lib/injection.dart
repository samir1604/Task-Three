import 'package:get_it/get_it.dart';
import 'package:task_three/data/data_provider.dart';
import 'package:task_three/data/repository/shared_repository.dart';
import 'package:task_three/features/auth/repository/auth_repository.dart';

final injector = GetIt.instance;

void setup() {
  injector.registerLazySingleton<DataProvider>(() => DataProvider.instance);
  injector.registerLazySingleton<AuthRepository>(
      () => SharedRepository(injector.get<DataProvider>()));
}
