import 'dart:async';
import 'dart:io';

import 'package:application_street_walk/data/api/api_service.dart';
import 'package:application_street_walk/data/models/street_model.dart';
import 'package:application_street_walk/pages/detail_page.dart';
import 'package:application_street_walk/pages/history_page.dart';
import 'package:application_street_walk/pages/list_page.dart';
import 'package:application_street_walk/pages/login_page.dart';
import 'package:application_street_walk/provider/street_provider.dart';
import 'package:application_street_walk/widget/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  final List<Widget> _listWidget = [
    ChangeNotifierProvider(
      create: (_) => ListStreetProvider(apiService: ApiService()),
      child: const ListPage(),
    ),
    const Scaffold(
      body: Center(
        child: HistoryPage(),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Coming soon'),
      ),
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

  late final Articles articlesls;
  TextEditingController _search = TextEditingController();
  Widget _android(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/sry.png",
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 4,
              ),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: _search,
                    style: GoogleFonts.lato(fontSize: 16),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search ...',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                _search = TextEditingController();
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.baby_changing_station,
                            color: Colors.black,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.search)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Row(
                      children: [
                        Text(
                          'Hello, ',
                          style: GoogleFonts.poppins(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          "Siddiq",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      'Read your needed!',
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 130,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Row(
                            children: [
                              listCard(
                                  name: "Siddiq",
                                  imageUrl:
                                      'https://www.jmtech.id/blog/wp-content/uploads/2021/05/Jual-Laptop-Merk-MSI-di-Pekanbaru.jpg'),
                              listCard(
                                  name: "Siddiq",
                                  imageUrl:
                                      'https://www.jmtech.id/blog/wp-content/uploads/2021/05/Jual-Laptop-Merk-MSI-di-Pekanbaru.jpg'),
                              listCard(
                                  name: "Siddiq",
                                  imageUrl:
                                      'https://www.jmtech.id/blog/wp-content/uploads/2021/05/Jual-Laptop-Merk-MSI-di-Pekanbaru.jpg'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 330,
                    width: 450,
                    child: Scaffold(
                      body: _listWidget[_buttonNavIndex],
                      bottomNavigationBar: BottomNavigationBar(
                        unselectedIconTheme:
                            const IconThemeData(color: Colors.black),
                        items: _bottomNavBarItems,
                        fixedColor: Colors.blueGrey[300],
                        currentIndex: _buttonNavIndex,
                        onTap: _onBottomNavTapped,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listCard({String? name, String? imageUrl}) {
    return Container(
      width: 130,
      height: 130,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    name!,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
