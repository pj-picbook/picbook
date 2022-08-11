import 'package:get_it/get_it.dart';
import 'auth_repository.dart';

GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton(() => AuthRepository());
}
