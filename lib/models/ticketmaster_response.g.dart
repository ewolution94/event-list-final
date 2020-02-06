// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketmaster_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketmasterResponse _$TicketmasterResponseFromJson(Map<String, dynamic> json) {
  return TicketmasterResponse(
    (json['events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TicketmasterResponseToJson(
        TicketmasterResponse instance) =>
    <String, dynamic>{
      'events': instance.events,
    };
