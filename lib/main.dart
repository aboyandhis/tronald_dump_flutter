import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_http_request.dart';
import 'package:intl/intl_browser.dart';
import 'package:provider/provider.dart';
import 'package:tronald_dump_api/providers/quote_provider.dart';
import 'package:tronald_dump_api/screens/home.dart';
import 'package:intl/intl.dart';
import 'package:tronald_dump_api/screens/search_topics.dart';

void main() async {
  var local = await findSystemLocale();
  Intl.defaultLocale = local;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QuoteProvider>(
            create: (BuildContext context) => QuoteProvider())
      ],
      child: Consumer<QuoteProvider>(
        builder: (context, quoteProvider, widget) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tronald Dump',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: Home(),
          routes: {
            Topic.routeName: (BuildContext context) => Topic(),
          },
        ),
      ),
    );
  }
}
