import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:tronald_dump_api/models/quotes.dart';
import 'package:tronald_dump_api/screens/results.dart';
import 'package:tronald_dump_api/widgets/quote_card.dart';

import '../models/quotes.dart';

class QuoteProvider extends ChangeNotifier {
  List<Quote> _faves = [];
  List<Quote> _searchResults = [];

  String _keyword;

  searchState(String value) {
    _keyword = value;
    notifyListeners();
  }

  searchQuotes(String keyword) {
    _keyword = keyword;
    notifyListeners();
  }

  updateFaves(Quote qoute) {
    _faves.add(qoute);
    notifyListeners();
  }

  removeFromFaves(Quote qoute) {
    _faves.remove(qoute);
    notifyListeners();
  }

  List<Quote> get faves => _faves;

  removeFromSearchResults(Quote qoute) {
    _searchResults.remove(qoute);
    notifyListeners();
  }

  updateTopics(List<Quote> list) {
    _searchResults.clear();
    _searchResults = list;
    notifyListeners();
  }

  Stream<List<Quote>> getFaveStream() => Stream.value(_faves);
  Stream<List<Quote>> getResultsStream() => Stream.value(_searchResults);

  //Calls TronaldDump.io and returns a random Quotes
  Future<Quote> randomQuotes() async {
    var json;
    Response res = await get('https://www.tronalddump.io/random/quote',
        headers: {"accept": "application/hal+json"});
    if (res.statusCode == 200) {
      json = jsonDecode(res.body);
    }
    return Quote.fromJson(json);
  }

  Future tags() async {
    var json;
    Response res = await get('https://www.tronalddump.io/tag',
        headers: {"accept": "application/hal+json"});
    if (res.statusCode == 200) {
      json = jsonDecode(res.body);
    }
    print(json);
    return json;
  }

  //Calls TronaldDump.io with given value and adds result into the stream.
  quoteSearch(context) async {
    _searchResults.clear();
    Response response = await get(
        'https://www.tronalddump.io/search/quote?query=$_keyword',
        headers: {"accept": "application/hal+json"});
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var list = QuotesList.fromJson(decode);
      if (list.count > 0) {
        _searchResults = list.eEmbedded.quotes;
      } else {
        var no = Quote.fromJson(
            {"value": "Looks like he hasn\'t said anything about this yet."});
        _searchResults.add(no);
      }
      notifyListeners();
      print(_searchResults.length);
      Navigator.pushNamed(context, Results.routeName);
    } else {
      print('There was a problem searching qoutes');
      print(response.statusCode);
    }
  }
}
