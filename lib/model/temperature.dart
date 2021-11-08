import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()
class Temperature {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;


  Temperature({this.temp, this.feelsLike, this.tempMin, this.tempMax,
      this.pressure, this.humidity});

  factory Temperature.fromJson(Map<String, dynamic> data) =>
      _$TemperatureFromJson(data);
}
