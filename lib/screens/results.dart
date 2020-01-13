import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tronald_dump_api/models/quotes.dart';
import 'package:tronald_dump_api/providers/quote_provider.dart';
import 'package:tronald_dump_api/widgets/loading.dart';

import 'package:tronald_dump_api/widgets/my_app_bar.dart';
import 'package:tronald_dump_api/widgets/quote_card.dart';

class Results extends StatelessWidget {
  static String routeName = '/results';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Hero(
          tag: 'trump-plop',
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatars.slack-edge.com/2016-11-19/107609641703_f0911765615212fcac12_512.png'),
          ),
        ),
        appBar: MyAppBar(
          title: 'Results',
        ),
        body: QuoteGrid());
  }
}

class QuoteGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<QuoteProvider>(context);
    var list = service.getResultsStream();

    return StreamBuilder<List<Quote>>(
        stream: list,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300),
                  children: snapshot.data
                      .map((f) => QuoteCard(quote: f, key: Key(f.quoteId)))
                      .toList());
              break;
            case ConnectionState.waiting:
              return Loading();
              break;
            default:
              return Loading();
          }
        });
  }
}
