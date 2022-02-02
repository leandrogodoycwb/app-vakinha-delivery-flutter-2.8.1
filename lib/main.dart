import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/routes/splash_routers.dart';

import 'app/modules/splash/core/ui/vakinha_ui.dart';
import 'app/modules/splash/routes/auth_routers.dart';

void main() {
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      theme: VakinhaUI.theme,
      getPages: [
        ...SplashRouters.routers, 
        ...AuthRouters.routers,
      ],

    );
  }
}