import 'package:json_annotation/json_annotation.dart'; //importing the json_annotation package (annotations used to automatically generate code to serialize and deserialize JSON data)

part 'weather.g.dart';
//temperature and weather code 
@JsonSerializable()
class Weather {
  const Weather ({
    required this.temperature,
    required this.weatherCode
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
    _$WeatherFromJson(json);

  final double temperature;
  @JsonKey(name: 'weathercode')
  final double weatherCode;
}