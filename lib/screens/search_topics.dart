import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tronald_dump_api/models/quotes.dart';
import 'package:tronald_dump_api/providers/quote_provider.dart';
import 'package:tronald_dump_api/widgets/my_app_bar.dart';
import 'package:tronald_dump_api/widgets/quote_card.dart';

class Topic extends StatelessWidget {
  static String routeName = '/topics';
  Widget loading = Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    String topic = 'love';
    var quoteProivder = Provider.of<QuoteProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          FontAwesomeIcons.poop,
          color: Colors.brown,
        ),
        onPressed: () {},
      ),
      appBar: MyAppBar(title: 'he said what?'),
      body: FutureBuilder(
          future: quoteProivder.quoteSearch(topic),
          builder: (context, AsyncSnapshot<List<Quote>> snapshot) {
            print(snapshot);
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return QuoteCard(
                      quote: snapshot.data[index],
                    );
                  },
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
