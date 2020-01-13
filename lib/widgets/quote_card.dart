import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tronald_dump_api/models/quotes.dart';
import '../providers/quote_provider.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard({Key key, this.quote}) : super(key: key);

  String formatDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<QuoteProvider>(context);
    var rightAdd = DismissDirection.startToEnd;
    var leftDelete = DismissDirection.endToStart;
    var size = MediaQuery.of(context).size;

    return Dismissible(
      key: Key(quote.value),
      secondaryBackground: DeleteBackround(),
      background: service.faves.contains(quote) == false
          ? FavoriteBackground()
          : DeleteBackround(),
      onDismissed: (dir) {
        if (dir == leftDelete) {
          service.removeFromSearchResults(quote);
          service.removeFromFaves(quote);
        }
        if (dir == rightAdd && service.faves.contains(quote) == false) {
          service.updateFaves(quote);
          service.removeFromSearchResults(quote);
        } else if (dir == rightAdd && service.faves.contains(quote) == true) {
          service.removeFromFaves(quote);
        }
      },
      direction: DismissDirection.horizontal,
      child: Center(
        child: Container(
          width: size.width / 3,
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.quoteLeft,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(quote.value),
                          Text(formatDate(DateTime.parse(quote.appearedAt))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Favorite',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 36),
          Icon(
            FontAwesomeIcons.heart,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class DeleteBackround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[600],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Delete',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 36),
          Icon(
            FontAwesomeIcons.trash,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
