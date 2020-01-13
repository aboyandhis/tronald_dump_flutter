import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';
import 'package:provider/provider.dart';
import 'package:tronald_dump_api/providers/quote_provider.dart';
import 'package:tronald_dump_api/screens/faves.dart';
import 'package:tronald_dump_api/screens/home.dart';
import 'package:intl/intl.dart';
import 'package:tronald_dump_api/screens/results.dart';
import 'package:tronald_dump_api/screens/search_topics.dart';
import 'package:tronald_dump_api/screens/tags.dart';

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
              primaryColor: Colors.indigo[100],
              accentColor: Colors.orange[200]),
          home: Search(),
          routes: {
            Search.routeName: (BuildContext context) => Search(),
            Results.routeName: (BuildContext context) => Results(),
            Faves.routeName: (BuildContext context) => Faves(),
            Tags.routeName: (BuildContext context) => Tags(),
          },
        ),
      ),
    );
  }
}
