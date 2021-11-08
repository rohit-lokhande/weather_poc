import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_poc/model/model.dart';
import 'package:weather_poc/network/network.dart';


class GlobalController extends GetxController {
  WeatherDataSource weatherDataSource;

  GlobalController({required this.weatherDataSource});

  var weatherMaster = WeatherMaster().obs;
  var weather = Weather().obs;
  bool isLoading = false;

  @override
  void onInit() {
    _fetchCurrentWeatherData();
    super.onInit();
  }

  void _fetchCurrentWeatherData() async {
    try {
      isLoading = true;
      var data = await weatherDataSource.loadGlobalData();
      weatherMaster.value = WeatherMaster.fromJson(data);
      weather.value = weatherMaster.value.weather!.first;
    } catch (_) {
      debugPrint("Failed to fetch current weather data");
    } finally {
      isLoading = false;
      update();
    }
  }
}
