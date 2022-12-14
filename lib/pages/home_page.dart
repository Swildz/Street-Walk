import 'dart:io';

import 'package:application_street_walk/data/api/api_service.dart';
import 'package:application_street_walk/data/models/street_model.dart';
import 'package:application_street_walk/pages/list_page.dart';
import 'package:application_street_walk/provider/street_provider.dart';
import 'package:application_street_walk/widget/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _buttonNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWidget(android: _android, ios: _ios),
    );
  }

  late final Articles articles;
  final List<Widget> _listWidget = [
    ChangeNotifierProvider(
      create: (_) => ListStreetProvider(apiService: ApiService()),
      child: ListPage(
        articles: Articles(
          source: Source(),
          author: '',
          content: '',
          description: '',
          publishedAt: null,
          title: '',
          url: '',
          urlToImage: '',
        ),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Coming soon'),
      ),
    ),
    const Scaffold(
      body: Scaffold(),
    ),
    const Scaffold(
      body: Center(
        child: Text('Coming soon'),
      ),
    )
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
        icon: Icon(
            Platform.isIOS ? CupertinoIcons.house_fill : Icons.home_filled),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS
            ? CupertinoIcons.line_horizontal_3_decrease
            : Icons.history),
        label: 'History'),
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS
            ? CupertinoIcons.square_favorites_alt
            : Icons.favorite_border_rounded),
        label: 'Favorite'),
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
        label: 'Setting'),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _buttonNavIndex = index;
    });
  }

  Widget _ios(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (i) {},
        items: _bottomNavBarItems,
      ),
      tabBuilder: ((context, index) {
        return SafeArea(child: _listWidget[_buttonNavIndex]);
      }),
    );
  }

  Widget _android(BuildContext context) {
    return Scaffold(
      body: _listWidget[_buttonNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        items: _bottomNavBarItems,
        fixedColor: Colors.blueGrey[300],
        currentIndex: _buttonNavIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
