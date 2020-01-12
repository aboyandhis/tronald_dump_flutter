import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tronald_dump_api/models/quotes.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  String formatDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  const QuoteCard({Key key, this.quote}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var right = DismissDirection.startToEnd;
    var left = DismissDirection.endToStart;

    return Dismissible(
      key: Key(quote.value),
      secondaryBackground: FavoriteBackground(),
      background: DeleteBackround(),
      onDismissed: (dir) {
        if (dir == left) {
          //delete
        } else if (dir == right) {
          //fave
        }
      },
      direction: DismissDirection.horizontal,
      child: Center(
        child: Container(
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
                          Text(
                            formatDate(
                              DateTime.parse(quote.appearedAt),
                            ),
                          ),
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
