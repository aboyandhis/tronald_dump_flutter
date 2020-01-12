class QuotesList {
  int count;
  int total;
  Embedded eEmbedded;
  Links lLinks;

  QuotesList({this.count, this.total, this.eEmbedded, this.lLinks});

  QuotesList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    eEmbedded = json['_embedded'] != null
        ? new Embedded.fromJson(json['_embedded'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['total'] = this.total;
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Embedded {
  List<Quote> quotes;

  Embedded({this.quotes});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = new List<Quote>();
      json['quotes'].forEach((v) {
        quotes.add(new Quote.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quote {
  String appearedAt;
  String createdAt;
  String quoteId;
  List<String> tags;
  String updatedAt;
  String value;
  Embedded eEmbedded;
  Links lLinks;

  Quote(
      {this.appearedAt,
      this.createdAt,
      this.quoteId,
      this.tags,
      this.updatedAt,
      this.value,
      this.eEmbedded,
      this.lLinks});

  Quote.fromJson(Map<String, dynamic> json) {
    appearedAt = json['appeared_at'];
    createdAt = json['created_at'];
    quoteId = json['quote_id'];
    tags = json['tags'].cast<String>();
    updatedAt = json['updated_at'];
    value = json['value'];
    eEmbedded = json['_embedded'] != null
        ? new Embedded.fromJson(json['_embedded'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appeared_at'] = this.appearedAt;
    data['created_at'] = this.createdAt;
    data['quote_id'] = this.quoteId;
    data['tags'] = this.tags;
    data['updated_at'] = this.updatedAt;
    data['value'] = this.value;
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Author {
  String authorId;
  Null bio;
  String createdAt;
  String name;
  String slug;
  String updatedAt;
  Links lLinks;

  Author(
      {this.authorId,
      this.bio,
      this.createdAt,
      this.name,
      this.slug,
      this.updatedAt,
      this.lLinks});

  Author.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'];
    bio = json['bio'];
    createdAt = json['created_at'];
    name = json['name'];
    slug = json['slug'];
    updatedAt = json['updated_at'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_id'] = this.authorId;
    data['bio'] = this.bio;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['updated_at'] = this.updatedAt;
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

class Source {
  String createdAt;
  Null filename;
  String quoteSourceId;
  Null remarks;
  String updatedAt;
  String url;
  Links lLinks;

  Source(
      {this.createdAt,
      this.filename,
      this.quoteSourceId,
      this.remarks,
      this.updatedAt,
      this.url,
      this.lLinks});

  Source.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    filename = json['filename'];
    quoteSourceId = json['quote_source_id'];
    remarks = json['remarks'];
    updatedAt = json['updated_at'];
    url = json['url'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['filename'] = this.filename;
    data['quote_source_id'] = this.quoteSourceId;
    data['remarks'] = this.remarks;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}
