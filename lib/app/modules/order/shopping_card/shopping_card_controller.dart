import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/core/services/shopping_card_service.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;

  final _address = ''.obs;
  final _cpf = ''.obs;

  ShoppingCardController({
    required AuthService authService,
    required ShoppingCardService shoppingCardService,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService;

  List<ShoppingCardModel> get products => _shoppingCardService.products;

  double get totalValue => _shoppingCardService.totalValue;
}
