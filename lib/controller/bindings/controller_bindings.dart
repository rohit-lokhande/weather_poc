import 'package:get/get.dart';

import 'bindings.dart';


class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    bindingWeatherDataSource();
    bindingGlobalController();
  }
}
