import 'package:application_street_walk/common/navigation.dart';
import 'package:application_street_walk/data/models/street_model.dart';
import 'package:application_street_walk/pages/article_web.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detailPage';

  final Articles articles;

  const DetailPage({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        bottomOpacity: 1.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Hero(
            tag: articles.urlToImage!,
            child: Image.network(
              articles.urlToImage!,
              width: 400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: (() {}), child: const Icon(Icons.favorite)),
            ],
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
                  color: Color.fromARGB(255, 235, 235, 235),
                  thickness: 2,
                ),
                Text(
                  articles.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Divider(
                  color: Color.fromARGB(255, 235, 235, 235),
                  thickness: 2,
                ),
                Text(
                  'Date : ${articles.publishedAt}',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Author : ${articles.author}',
                  style: Theme.of(context).textTheme.caption,
                ),
                const Divider(
                  color: Color.fromARGB(255, 235, 235, 235),
                  thickness: 2,
                ),
                Text(
                  articles.content ?? "",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                ElevatedButton(
                  child: const Text("Read More"),
                  onPressed: () {
                    // Navigation.IntentWithData(routeName, articles.url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => ArticleWeb(url: articles.url)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
