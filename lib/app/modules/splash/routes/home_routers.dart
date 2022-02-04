import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_page.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(
    name: '/home',
    binding: HomeBindings(),
    page: () => const HomePage(),
    ),
  ];
}
