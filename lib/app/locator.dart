
import 'package:auxilidok/services/credit_manager_service.dart';
import 'package:auxilidok/services/image_picker_service.dart';
import 'package:auxilidok/ui/start/profile/profile_view_model.dart';
import 'package:get_it/get_it.dart';

import '../services/authentication_service.dart';
import '../services/firestore_service.dart';
import '../services/navigation_service.dart';



GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => FutureProfileViewModel());
  locator.registerLazySingleton(() => ImagePickerService());
  locator.registerLazySingletonAsync(() async => await CreditManagerService().initStream());
}
