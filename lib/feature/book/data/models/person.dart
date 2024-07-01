
// data/models/person.dart
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final int? birthYear;
  final int? deathYear;
  final String name;

  Person({this.birthYear, this.deathYear, required this.name});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}