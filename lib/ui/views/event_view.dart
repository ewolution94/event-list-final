import 'package:basic_scrolllist/enums/view_states.dart';
import 'package:basic_scrolllist/scoped_models/event_list_model.dart';
import 'package:basic_scrolllist/ui/views/base_view.dart';
import 'package:basic_scrolllist/ui/widgets/busy_overlay.dart';
import 'package:basic_scrolllist/ui/widgets/event_list.dart';
import 'package:flutter/material.dart';

class EventView extends StatefulWidget {
  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EventListModel>(
        onModelReady: (model) => model.initEventsForGermany(),
        builder: (context, child, model) => BusyOverlay(
            show: model.state == ViewState.Busy,
            child: EventList(model: model)));
  }
}
