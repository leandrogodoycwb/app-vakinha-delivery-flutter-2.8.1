import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/core/services/shopping_card_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    Get.lazyPut(() => ShoppingCardService());
  }
}
