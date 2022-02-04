import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/core/services/auth_service.dart';

class SplashController {
  void checkLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
