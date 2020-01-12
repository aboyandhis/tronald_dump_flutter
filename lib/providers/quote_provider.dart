import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:tronald_dump_api/models/quotes.dart';

class QuoteProvider extends ChangeNotifier {
  List<Quote> list = [];
  QuotesList quotes;
  Stream<Quote> quoteStream() => Stream.fromIterable(list);

  set faveQuotes(Quote quotes) {
    notifyListeners();
  }

  //Calls TronaldDump.io and returns a random Quotes
  Future<Quote> randomQuotes() async {
    try {
      var response = await get('https://www.tronalddump.io/random/quote',
          headers: {"accept": "application/hal+json"});
      if (response.statusCode == 200)
        return Quote.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  //Calls TronaldDump.io with given value and adds result into the stream.
  Future<List<Quote>> quoteSearch(String topic) async {
    try {
      var response = await get(
        'https://www.tronalddump.io/search/quote?query=war',
        headers: {
          "accept": "application/hal+json",
        },
      );
      if (response.statusCode == 200 && response.body != null) {
        var items = jsonDecode(response.body);
        var qlist = QuotesList.fromJson(items);
        return qlist.eEmbedded.quotes;
      }
      notifyListeners();
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }
}
