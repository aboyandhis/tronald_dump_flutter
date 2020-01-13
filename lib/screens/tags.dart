import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tronald_dump_api/providers/quote_provider.dart';
import 'package:tronald_dump_api/widgets/loading.dart';

import 'package:tronald_dump_api/widgets/my_app_bar.dart';

class Tags extends StatelessWidget {
  static String routeName = '/Tags';
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
          title: 'Tags',
        ),
        body: QuoteGrid());
  }
}

class QuoteGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<QuoteProvider>(context);
    var list = service.tags();

    return StreamBuilder(
        stream: list.asStream(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300),
                  children: snapshot.data
                      .map((f) => TagsList.fromJson(f)
                          .eEmbedded
                          .tag
                          .map((f) => Text(f.value)))
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

class TagsList {
  int count;
  int total;
  Embedded eEmbedded;

  TagsList({this.count, this.total, this.eEmbedded});

  TagsList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    eEmbedded = json['_embedded'] != null
        ? new Embedded.fromJson(json['_embedded'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['total'] = this.total;
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded.toJson();
    }
    return data;
  }
}

class Embedded {
  List<Tag> tag;

  Embedded({this.tag});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['tag'] != null) {
      tag = new List<Tag>();
      json['tag'].forEach((v) {
        tag.add(new Tag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tag != null) {
      data['tag'] = this.tag.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tag {
  String createdAt;
  String updatedAt;
  String value;
  Links lLinks;

  Tag({this.createdAt, this.updatedAt, this.value, this.lLinks});

  Tag.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    value = json['value'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['value'] = this.value;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Links {
  Self self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.toJson();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
