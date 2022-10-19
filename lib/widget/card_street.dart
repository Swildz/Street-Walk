import 'package:application_street_walk/data/models/street_model.dart';
import 'package:application_street_walk/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardStreet extends StatelessWidget {
  final Articles articles;
  const CardStreet({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: articles.source);
        debugPrint(articles.source.id);
      },
      leading: Hero(
        tag: articles.source,
        child: Image.network(
          articles.urlToImage,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        articles.author,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200,
          fontSize: 18,
        ),
      ),
    );
  }
}
