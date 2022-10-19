import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  final WidgetBuilder android;
  final WidgetBuilder ios;
  const PlatformWidget({super.key, required this.android, required this.ios});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android(context);
      case TargetPlatform.iOS:
        return ios(context);
      default:
        return android(context);
    }
  }
}
