import 'dart:convert';

// StreetModel streetModelFromJson(String str) =>
//     StreetModel.fromJson(json.decode(str));

// String listStreetModeToJson(StreetModel data) => json.encode(data.toJson());

class StreetModel {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  StreetModel(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory StreetModel.fromJson(Map<String, dynamic> json) => StreetModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Articles>.from((json["articles"] as List)
            .map((x) => Articles.fromJson(x))
            .where((article) =>
                article.author != null &&
                article.description != null &&
                article.urlToImage != null &&
                article.publishedAt != null &&
                article.content != null)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((e) => e.toJson())),
      };
}

class Articles {
  Source? source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

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
        source: Source.fromJson(json["source"] ?? "-"),
        author: json["author"] ?? "-",
        title: json["title"] ?? "-",
        description: json["description"] ?? "-",
        url: json["url"] ?? "-",
        urlToImage: json["urlToImage"] ?? "-",
        publishedAt: DateTime.parse(json["publishedAt"] ?? "-"),
        content: json["content"] ?? "-",
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "-";
    name = json["name"] ?? "-";
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
