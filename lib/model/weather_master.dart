import 'package:json_annotation/json_annotation.dart';
import 'package:weather_poc/model/model.dart';
import 'package:weather_poc/util/util.dart';

part 'weather_master.g.dart';

@JsonSerializable()
class WeatherMaster {
  List<Weather>? weather;
  @JsonKey(name: "main")
  Temperature? temperature;
  String? name;
  @JsonKey(fromJson: DateUtils.toDate)
  DateTime? dt;

  WeatherMaster({this.weather, this.temperature, this.name, this.dt});

  factory WeatherMaster.fromJson(Map<String, dynamic> data) =>
      _$WeatherMasterFromJson(data);
}
