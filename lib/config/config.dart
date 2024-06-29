import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_streaming_ui/pages/signup-page/controller/signup_bloc.dart';

import '../pages/signup-page/controller/repository.dart';

class AppConfig {
  static final serviceLocator = GetIt.instance;

  static Future<void> askForPermissions() async {
    // Ask for permissions here
    await Permission.camera.request();
    await Permission.storage.request();
    await Permission.notification.request();
  }

  static Future<void> registerRepository() async {
    // Register your repositories here
    serviceLocator.registerLazySingleton(
      () => SignupRepository(),
    );
  }

  static Future<void> registerBloc() async {
    // Register your blocs here
    serviceLocator.registerLazySingleton(
      () => SignupBloc(
        repository: serviceLocator<SignupRepository>(),
      ),
    );
  }
}
