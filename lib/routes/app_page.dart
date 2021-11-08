import 'package:get/get.dart';
import 'package:weather_poc/controller/controller.dart';
import 'package:weather_poc/pages/pages.dart';

import 'app_routes.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeScreen(),
      binding: ControllerBindings(),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
    ),
  ];
}
