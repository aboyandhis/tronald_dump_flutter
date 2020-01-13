import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tronald_dump_api/models/quotes.dart';
import 'package:tronald_dump_api/providers/quote_provider.dart';
import 'package:tronald_dump_api/widgets/loading.dart';

import 'package:tronald_dump_api/widgets/my_app_bar.dart';
import 'package:tronald_dump_api/widgets/quote_card.dart';

class Faves extends StatelessWidget {
  static String routeName = '/faves';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    var list = service.getFaveStream();

    return StreamBuilder<List<Quote>>(
        stream: list,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return snapshot.data != null
                  ? GridView.builder(
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300),
                      itemBuilder: (context, index) =>
                          QuoteCard(quote: snapshot.data[index]))
                  : Center(
                      child: Text('Looks like you don\'t have any faves yet.'));
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
