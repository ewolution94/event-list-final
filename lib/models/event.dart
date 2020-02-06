import 'package:basic_scrolllist/models/date.dart';
import 'package:basic_scrolllist/models/embedded.dart';
import 'package:basic_scrolllist/models/image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final String name;
  final List<Image> images;
  final Date dates;
  final Embedded embedded;

  const Event(this.name, this.images, this.dates, this.embedded);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}