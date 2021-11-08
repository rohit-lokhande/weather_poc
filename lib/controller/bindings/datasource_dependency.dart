import 'package:get/get.dart';
import 'package:weather_poc/network/network.dart';


void bindingCovidDataSource() =>
    Get.lazyPut<WeatherDataSource>(() => WeatherDataSource());
