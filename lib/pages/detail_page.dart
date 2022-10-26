import 'package:application_street_walk/data/models/street_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/';

  final Articles articles;

  const DetailPage({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Street Walk'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Hero(
            tag: articles.urlToImage!,
            child: Image.network(articles.urlToImage!),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articles.description ?? "",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Text(
                  articles.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Text(
                  'Date : ${articles.publishedAt}',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Author : ${articles.author}',
                  style: Theme.of(context).textTheme.caption,
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Text(
                  articles.content ?? "",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                ElevatedButton(
                  child: const Text("Read More"),
                  onPressed: () {
                    // Navigator.pushNamed(context, )
                    // argument : ar
                  },
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
