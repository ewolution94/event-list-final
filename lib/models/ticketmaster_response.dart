import 'package:basic_scrolllist/models/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticketmaster_response.g.dart';

@JsonSerializable()
class TicketmasterResponse {
  final List<Event> events;

  const TicketmasterResponse(this.events);

  factory TicketmasterResponse.fromJson(Map<String, dynamic> json) => _$TicketmasterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TicketmasterResponseToJson(this);
}