import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tronald_dump_api/providers/quote_provider.dart';
import 'package:tronald_dump_api/widgets/my_app_bar.dart';
import '../providers/quote_provider.dart';

class Search extends StatelessWidget {
  static String routeName = '/topics';

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<QuoteProvider>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //
          },
          child: Icon(FontAwesomeIcons.poo),
        ),
        appBar: MyAppBar(
          title: 'He said what?',
        ),
        body: Center(
          child: Form(
            child: Container(
              width: 600,
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome to the TrumpMachine',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  SizedBox(height: 64),
                  TextField(
                      toolbarOptions: ToolbarOptions(
                          copy: true, paste: true, cut: true, selectAll: true),
                      autocorrect: true,
                      enableSuggestions: true,
                      onChanged: (val) {
                        service.searchState(val);
                      },
                      decoration: InputDecoration(
                          hintText: 'What did he say about....')),
                  SizedBox(height: 32),
                  FlatButton.icon(
                    color: Theme.of(context).primaryColor,
                    label: Text('Search TrumpMachine'),
                    icon: Icon(FontAwesomeIcons.poo),
                    padding: EdgeInsets.all(24),
                    onPressed: () {
                      service.quoteSearch(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
