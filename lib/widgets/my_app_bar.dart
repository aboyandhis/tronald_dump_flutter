import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tronald_dump_api/screens/faves.dart';
import 'package:tronald_dump_api/screens/search_topics.dart';
import 'package:tronald_dump_api/screens/tags.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(title),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            HeaderIcon(
              text: 'Search',
              route: Search.routeName,
              icon: FontAwesomeIcons.pooStorm,
            ),
            SizedBox(width: 16),
            HeaderIcon(
              icon: FontAwesomeIcons.heart,
              text: 'Favorites',
              route: Faves.routeName,
            ),
            SizedBox(width: 16),
            HeaderIcon(
              icon: FontAwesomeIcons.tags,
              text: 'Tags',
              route: Tags.routeName,
            ),
          ],
        ),
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(50);
}

class HeaderIcon extends StatelessWidget {
  final String text;
  final String route;
  final IconData icon;
  const HeaderIcon({Key key, this.text, this.route, this.icon})
      : super(key: key);

  Widget build(BuildContext context) {
    var color = Theme.of(context).accentColor;
    return FlatButton.icon(
      hoverColor: color,
      label: Text(text),
      color: Colors.white,
      textColor: Colors.black54,
      icon: Icon(icon, size: 16),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
