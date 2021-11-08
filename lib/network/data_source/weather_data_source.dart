import 'package:location/location.dart';

import '../base_network.dart';

class WeatherDataSource {
  static WeatherDataSource instance = WeatherDataSource();

  Future<Map<String, dynamic>> loadGlobalData(
      LocationData? location, String unit) {
    late String url;
    if (location != null) {
      url =
          'weather?lat=${location.latitude}&lon=${location.longitude}&appid=9f4f1c4a0ee260344120c3ebf10c45d7&units=$unit';
    } else {
      url =
          'weather?q=Mumbai&appid=9f4f1c4a0ee260344120c3ebf10c45d7&units=$unit';
    }

    return BaseNetwork.get(url);
  }
}
