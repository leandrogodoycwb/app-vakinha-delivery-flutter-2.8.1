import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/auth_repository.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/auth_repository_impl.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/register/register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut(() => RegisterController(authRepository: Get.find()),
    );
  }
}
