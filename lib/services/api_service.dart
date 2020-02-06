import 'dart:convert';

import 'package:basic_scrolllist/models/ticketmaster_response.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiBase = 'https://app.ticketmaster.com/discovery/v2/';

  Future<TicketmasterResponse> getEvents(String countryCode,
      {int page = 0, int size = 20}) async {
    var apiLink = apiBase + 'events.json?';
    apiLink += 'countryCode=' + countryCode + '&';
    apiLink += 'page=' + page.toString() + '&';
    apiLink += 'size=' + size.toString() + '&';

    final asset = await _loadAsset('assets/token.json');
    final token = json.decode(asset)['token'];
    apiLink += 'apikey=' + token;

    final response = await http.get(apiLink);

    if (response.statusCode == 200) {
      return TicketmasterResponse.fromJson(
          json.decode(response.body)['_embedded']);
    } else {
      throw Exception('Failed to fetch response');
    }
  }

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }
}
