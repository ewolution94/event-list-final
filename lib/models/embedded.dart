import 'package:basic_scrolllist/models/venue.dart';
import 'package:json_annotation/json_annotation.dart';

part 'embedded.g.dart';

@JsonSerializable()
class Embedded {
  final List<Venue> venues;

  const Embedded(this.venues);

  factory Embedded.fromJson(Map<String, dynamic> json) => _$EmbeddedFromJson(json);
  Map<String, dynamic> toJson() => _$EmbeddedToJson(this);
}