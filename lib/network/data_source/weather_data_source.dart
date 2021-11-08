import '../base_network.dart';

class WeatherDataSource {
  static WeatherDataSource instance = WeatherDataSource();

  Future<Map<String, dynamic>> loadGlobalData() {
    String url =
        'weather?q=Pune&appid=9f4f1c4a0ee260344120c3ebf10c45d7&units=metric';
    return BaseNetwork.get(url);
  }
}
