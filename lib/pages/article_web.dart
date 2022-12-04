import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/widgets.dart';
import '../widget/costom_scaffold.dart';

class ArticleWeb extends StatelessWidget {
  static const routeName = '/articlePage';

  final String url;

  const ArticleWeb({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
