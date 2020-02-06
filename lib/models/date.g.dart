// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Date _$DateFromJson(Map<String, dynamic> json) {
  return Date(
    json['start'] == null
        ? null
        : DateStart.fromJson(json['start'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'start': instance.start,
    };
