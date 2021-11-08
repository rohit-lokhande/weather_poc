import 'package:get/get.dart';
import 'package:weather_poc/network/network.dart';


void bindingWeatherDataSource() =>
    Get.lazyPut<WeatherDataSource>(() => WeatherDataSource());
