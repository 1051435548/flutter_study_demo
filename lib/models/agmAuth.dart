import 'package:json_annotation/json_annotation.dart';

part 'agmAuth.g.dart';

@JsonSerializable()
class AgmAuth {
  AgmAuth();

  Map<String, dynamic> data;
  List included;

  factory AgmAuth.fromJson(Map<String, dynamic> json) =>
      _$AgmAuthFromJson(json);

  Map<String, dynamic> toJson() => _$AgmAuthToJson(this);
}
