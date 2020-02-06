import 'package:basic_scrolllist/models/event.dart';
import 'package:basic_scrolllist/scoped_models/event_list_model.dart';
import 'package:flutter/material.dart';

class EventEntryDest extends StatefulWidget {
  final EventListModel model;
  final Event event;

  const EventEntryDest({@required this.model, @required this.event});

  @override
  _EventEntryDestState createState() => _EventEntryDestState();
}

class _EventEntryDestState extends State<EventEntryDest> {
  @override
  Widget build(BuildContext context) {
    String urlWithLargestWidth =
        widget.event.images.firstWhere((image) => image.width > 1500).url ?? '';

    String venueCities = '';

    if (widget.event.embedded?.venues != null) {
      for (var index = 0;
          index < widget.event.embedded.venues.length;
          index++) {
        venueCities += widget.event.embedded.venues[index].city.name;
        if (index < (widget.event.embedded.venues.length - 1)) {
          venueCities += ', ';
        }
      }
    } else {
      venueCities = 'no venues';
    }

    return Hero(
      transitionOnUserGestures: true,
      tag: widget.event,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.event.name),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Image.network(urlWithLargestWidth),
            ),
            Container(
              height: 20.0,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'EVENT DATE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(120, 120, 120, 0.7),
                                    fontSize: 20.0)),
                          ])),
                          Container(
                            width: 20.0,
                          ),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: widget.event.dates.start.localDate,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromRGBO(120, 120, 120, 0.7),
                                    fontSize: 16.0))
                          ])),
                        ],
                      ),
                    ),
                    Container(
                      height: 20.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'LOCATION',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(120, 120, 120, 0.7),
                                    fontSize: 20.0)),
                          ])),
                          Container(
                            width: 20.0,
                          ),
                          Flexible(
                            child: Container(
                              child: Text(
                                venueCities,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromRGBO(120, 120, 120, 0.7),
                                    fontSize: 16.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton.icon(
                  onPressed: () => _toggleFavorite(widget.event),
                  icon: _getIconBasedOnWishlistStatus(widget.event),
                  label: _getTextBasedOnWishlistStatus(widget.event),
                  color: _getColorBasedOnWishlistStatus(widget.event),
                  textColor: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
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

  Widget _getIconBasedOnWishlistStatus(Event event) {
    if (widget.model.isWishlisted(event)) {
      return Icon(Icons.delete);
    } else {
      return Icon(Icons.favorite);
    }
  }

  Widget _getTextBasedOnWishlistStatus(Event event) {
    if (widget.model.isWishlisted(event)) {
      return Text('Remove from wishlist');
    } else {
      return Text('Add to wishlist');
    }
  }

  Color _getColorBasedOnWishlistStatus(Event event) {
    return widget.model.isWishlisted(event) ? Colors.grey : Colors.red;
  }
}
