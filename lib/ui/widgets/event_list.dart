import 'package:basic_scrolllist/models/event.dart';
import 'package:basic_scrolllist/scoped_models/event_list_model.dart';
import 'package:basic_scrolllist/ui/widgets/event_entry_dest.dart';
import 'package:basic_scrolllist/ui/widgets/event_entry_source.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  final EventListModel model;

  const EventList({@required this.model});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    // set up listener here
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        widget.model.addMoreEventsForGermany();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Ticketmaster Events'),
        centerTitle: false,
        elevation: 20.0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () => _scaffoldKey.currentState.openEndDrawer(),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Container(
                      width: 5.0,
                    ),
                    Text(
                      widget.model.wishlist.length.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
        ],
      ),
      body: ListView.separated(
        controller: _controller,
        itemCount: widget.model.originalEvents.length,
        itemBuilder: (context, index) {
          final displayedItem = widget.model.originalEvents[index];
          return ListTile(
            title: GestureDetector(
              child: Text(displayedItem.name +
                  ' (' +
                  displayedItem.dates?.start?.localDate +
                  ')'),
              onTap: () => _goToDetailPage(context, displayedItem),
            ),
            leading: GestureDetector(
              child: EventEntrySource(event: displayedItem),
              onTap: () => _goToDetailPage(context, displayedItem),
            ),
            trailing: IconButton(
                icon: Icon(Icons.favorite,
                    color: _getColorBasedOnWishlistStatus(displayedItem)),
                onPressed: () => _toggleFavorite(displayedItem)),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
      endDrawer: Drawer(
        child: ListView.builder(
            itemCount: widget.model.wishlist.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Current wishlist',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(120, 120, 120, 0.9),
                            fontSize: 26.0),
                      ),
                    ],
                  ),
                ));
              }

              if (index == (widget.model.wishlist.length + 1)) {
                return Opacity(
                  opacity: widget.model.wishlist.length > 0 ? 0.8 : 0.0,
                  child: RaisedButton.icon(
                    onPressed: () => _clearWishlist(),
                    label: Text('Remove all'),
                    icon: Icon(Icons.delete_forever),
                    textColor: Colors.white,
                  ),
                );
              }

              // "reset" index to grab the first event from the list
              index--;

              final displayedItem = widget.model.wishlist[index];
              return ListTile(
                title: Text(displayedItem.name +
                    ' (' +
                    displayedItem.dates?.start?.localDate +
                    ')'),
                leading: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () => _removeFromWishlist(displayedItem),
                ),
              );
            }),
      ),
    );
  }

  void _clearWishlist() {
    setState(() {
      widget.model.emptyWishlist();
    });
  }

  Future _goToDetailPage(BuildContext context, Event displayedItem) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EventEntryDest(model: widget.model, event: displayedItem)));
  }

  Color _getColorBasedOnWishlistStatus(Event event) {
    return widget.model.isWishlisted(event) ? Colors.red : Colors.grey;
  }

  void _toggleFavorite(Event event) {
    setState(() {
      if (widget.model.isWishlisted(event)) {
        widget.model.removeFromWishlist(event);
      } else {
        widget.model.addToWishlist(event);
      }
    });
  }

  void _removeFromWishlist(Event event) {
    setState(() {
      widget.model.removeFromWishlist(event);
    });
  }
}
