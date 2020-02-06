// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    json['name'] as String,
    (json['images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['dates'] == null
        ? null
        : Date.fromJson(json['dates'] as Map<String, dynamic>),
    json['_embedded'] == null
        ? null
        : Embedded.fromJson(json['_embedded'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'name': instance.name,
      'images': instance.images,
      'dates': instance.dates,
      'embedded': instance.embedded,
    };
