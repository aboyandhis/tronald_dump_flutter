import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tronald_dump_api/models/quotes.dart';

import 'package:tronald_dump_api/providers/quote_provider.dart';
import 'package:tronald_dump_api/widgets/my_app_bar.dart';
import 'package:tronald_dump_api/widgets/quote_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Quote quote;
  Widget loading = Center(child: CircularProgressIndicator());
  @override
  Widget build(BuildContext context) {
    var quoteProvider = Provider.of<QuoteProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          FontAwesomeIcons.poop,
          color: Colors.brown,
        ),
      ),
      appBar: MyAppBar(
        title: 'TrumpMachine',
      ),
      body: FutureBuilder<Quote>(
          future: quoteProvider.randomQuotes(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ListView(
                  children: <Widget>[
                    QuoteCard(quote: snapshot.data),
                  ],
                );
                break;
              case ConnectionState.waiting:
                return loading;
                break;
              default:
                return null;
            }
          }),
    );
  }
}
