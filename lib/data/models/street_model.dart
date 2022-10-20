import 'dart:convert';

StreetModel streetModelFromJson(String str) =>
    StreetModel.fromJson(json.decode(str));

String listStreetModeToJson(StreetModel data) => json.encode(data.toJson());

class StreetModel {
  String status;
  int totalResults;
  List<Articles> articles;

  StreetModel(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory StreetModel.fromJson(Map<String, dynamic> json) => StreetModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: json["articles"]);

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((e) => e.toJson())),
      };
}

class Articles {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Articles(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        // source: json['source'] != null ? Source.fromJson(json['source']) : null,
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // ignore: unnecessary_null_comparison
    if (source != null) {
      data['source'] = source.toJson();
    }
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["content"] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}
