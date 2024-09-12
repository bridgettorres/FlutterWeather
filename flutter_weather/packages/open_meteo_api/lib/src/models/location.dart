//*This file should store data returned by the location API
import 'package:json_annotation/json_annotation.dart'; //importing the json_annotation package (annotations used to automatically generate code to serialize and deserialize JSON data)

//part keyword - makes it easy to split the file into different parts to better manage and navigate file as it gets big
part 'location.g.dart';
//id, name, latitutde, longitude
@JsonSerializable()
class Location {
  const Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });
//Include fromJson methods for deserialization
  factory Location.fromJson(Map<String, dynamic> json) =>
    _$LocationFromJson(json);
    
  final int id;
  final String name;
  final double latitude;
  final double longitude;
}