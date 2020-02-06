import 'package:json_annotation/json_annotation.dart';

part 'date_start.g.dart';

@JsonSerializable()
class DateStart {
  final String localDate;

  const DateStart(this.localDate);

  factory DateStart.fromJson(Map<String, dynamic> json) => _$DateStartFromJson(json);
  Map<String, dynamic> toJson() => _$DateStartToJson(this);
}