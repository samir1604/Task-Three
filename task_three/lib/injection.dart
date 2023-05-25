import 'package:get_it/get_it.dart';
import 'package:task_three/data/persistence_provider.dart';

final injector = GetIt.instance;

void setup() {
  injector.registerLazySingleton<PersistenceProvider>(
      () => PersistenceProvider.instance);
}
