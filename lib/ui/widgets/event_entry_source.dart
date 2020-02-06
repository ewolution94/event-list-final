import 'package:basic_scrolllist/models/event.dart';
import 'package:flutter/material.dart';

class EventEntrySource extends StatelessWidget {
  final Event event;

  const EventEntrySource({@required this.event});

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: event,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          clipBehavior: Clip.antiAlias,
          child: Image.network(event.images[0].url, fit: BoxFit.contain,)),
    );
  }
}
