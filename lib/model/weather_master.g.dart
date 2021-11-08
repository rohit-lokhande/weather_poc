// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherMaster _$WeatherMasterFromJson(Map<String, dynamic> json) =>
    WeatherMaster(
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: json['main'] == null
          ? null
          : Temperature.fromJson(json['main'] as Map<String, dynamic>),
      name: json['name'] as String?,
      dt: DateUtils.toDate(json['dt'] as int),
    );

Map<String, dynamic> _$WeatherMasterToJson(WeatherMaster instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.temperature,
      'name': instance.name,
      'dt': instance.dt?.toIso8601String(),
    };
