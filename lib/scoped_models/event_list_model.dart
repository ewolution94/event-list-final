import 'package:basic_scrolllist/scoped_models/base_model.dart';
import 'package:basic_scrolllist/services/api_service.dart';
import 'package:basic_scrolllist/service_locator.dart';
import 'package:basic_scrolllist/models/event.dart';

class EventListModel extends BaseModel {
  ApiService apiService = locator<ApiService>();

  List<Event> originalEvents = [];

  List<Event> wishlist = [];

  int currentPage = 0;

  Future initEventsForGermany() async {
    setState(ViewState.Busy);

    var ticketmasterResponse = await apiService.getEvents('DE', page: currentPage);
    originalEvents = ticketmasterResponse.events;

    setState(ViewState.Retrieved);
  }

  Future addMoreEventsForGermany() async {
    setState(ViewState.Busy);

    currentPage++;
    var ticketmasterResponse = await apiService.getEvents('DE', page: currentPage);
    originalEvents.addAll(ticketmasterResponse.events);

    setState(ViewState.Retrieved);
  }

  void addToWishlist(Event event) {
    wishlist.add(event);
  }

  void removeFromWishlist(Event event) {
    wishlist.remove(event);
  }

  bool isWishlisted(Event event) {
    return wishlist.indexOf(event) != -1;
  }

  void emptyWishlist() {
    wishlist = [];
  }
}