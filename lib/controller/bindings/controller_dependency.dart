import 'package:get/get.dart';
import 'package:weather_poc/controller/controller.dart';
import 'package:weather_poc/network/network.dart';

void bindingGlobalController() => Get.lazyPut<GlobalController>(
    () => GlobalController(weatherDataSource: Get.find<WeatherDataSource>()));
