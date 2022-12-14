import 'package:application_street_walk/data/models/street_model.dart';
import 'package:application_street_walk/pages/detail_page.dart';
import 'package:application_street_walk/shared/style_color.dart';
import 'package:flutter/material.dart';

class CardStreet extends StatelessWidget {
  final Articles articles;
  const CardStreet({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: articles.urlToImage!,
          child: Image.network(
            articles.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(articles.title),
        subtitle: Text(articles.author ?? ""),
        //    onTap: () => Navigation.intentWithData(DetailPage.routeName, articles),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(articles: articles),
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final Articles articles;
  const Carousel({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.amber),
          child:
              // Image.network(articles.urlToImage!),
              Text(
            articles.author ?? "",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        // Hero(
        //   tag: articles.urlToImage!,
        //   child: Image.network(
        //     articles.urlToImage!,
        //     width: 10,
        //   ),
        // ),
      ],
    );
  }
}
