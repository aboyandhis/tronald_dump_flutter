import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tronald_dump_api/screens/search_topics.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          tooltip: 'Search Quotes',
          icon: Icon(FontAwesomeIcons.toiletPaper),
          onPressed: () {
            Navigator.pushNamed(context, Topic.routeName);
          },
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
