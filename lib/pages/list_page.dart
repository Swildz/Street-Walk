import 'package:application_street_walk/data/api/api_service.dart';
import 'package:application_street_walk/data/models/street_model.dart';
import 'package:application_street_walk/provider/street_provider.dart';
import 'package:application_street_walk/widget/card_street.dart';
import 'package:application_street_walk/widget/platform_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:application_street_walk/utils/result_state.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/listPage';

  final Articles articles;

  const ListPage({super.key, required this.articles});
  // static TextEditingController controller =
  //     TextEditingController(text: "Search");

  Widget _buildList(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListStreetProvider(apiService: ApiService()),
      child: Consumer<ListStreetProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.streetModel.articles.length,
              itemBuilder: (context, index) {
                var streetModel = state.streetModel.articles[index];
                return CardStreet(articles: streetModel);
              },
            );
          } else if (state.state == ResultState.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.Error) {
            return Scaffold(
              body: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 350,
                        width: 350,
                        child: Lottie.asset("assets/networkerror.json"),
                      )
                    ],
                  )),
            );
          } else {
            return const Center(
              child: Text('No Such DAta'),
            );
          }
        },
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
          Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Image.asset(
                  "assets/profile.png",
                  width: 55,
                  height: 55,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Text(
                    'Hai, User!',
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Sudah Baca Berta Hari ini?",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50, 5, 5, 5),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.menu,
                        color: Color.fromARGB(255, 0, 129, 210),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
        // flexibleSpace: Container(
        //   margin: EdgeInsets.fromLTRB(25, 180, 25, 20),
        //   child: Row(
        //     children: [
        //       Expanded(
        //           child: TextFormField(
        //               decoration: InputDecoration(
        //                   filled: true,
        //                   fillColor: Colors.white,
        //                   enabledBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(35),
        //                     borderSide: const BorderSide(
        //                         width: 5,
        //                         color: Color.fromARGB(31, 255, 255, 255)),
        //                   ),
        //                   focusedBorder: const OutlineInputBorder(
        //                     borderSide:
        //                         BorderSide(width: 3, color: Colors.black12),
        //                   ),
        //                   errorBorder: const OutlineInputBorder(
        //                     borderSide:
        //                         BorderSide(width: 1, color: Colors.black12),
        //                   ),
        //                   labelText: 'Search',
        //                   labelStyle: const TextStyle(
        //                     fontFamily: 'poppins',
        //                     color: Colors.black,
        //                   ),
        //                   suffixIcon: Icon(Icons.search))))
        //     ],
        //   ),
        // ),
        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        backgroundColor: Color.fromARGB(255, 0, 129, 210),
        toolbarHeight: 175,
      ),
      // _buildList(context),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 0, 70, 113)),
                          child: Column(
                            children: [
                              Text(
                                'WSL $i',
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  height: 2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Image.network(
                                "https://images.wsj.net/im-675671/social",
                                width: 140,
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 150,
                    aspectRatio: 4 / 3,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            Container(
                height: 327,
                margin: const EdgeInsets.all(3),
                child: _buildList(context))
          ],
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Street Walk'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(android: _buildAndroid, ios: _buildIos);
  }
}
