// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embedded.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Embedded _$EmbeddedFromJson(Map<String, dynamic> json) {
  return Embedded(
    (json['venues'] as List)
        ?.map(
            (e) => e == null ? null : Venue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EmbeddedToJson(Embedded instance) => <String, dynamic>{
      'venues': instance.venues,
    };
