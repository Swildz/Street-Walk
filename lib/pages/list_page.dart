import 'package:application_street_walk/data/api/api_service.dart';
import 'package:application_street_walk/provider/street_provider.dart';
import 'package:application_street_walk/widget/card_street.dart';
import 'package:application_street_walk/widget/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:application_street_walk/utils/result_state.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/';
  const ListPage({super.key});

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
        title: const Text(
          'Street Walk',
          textAlign: TextAlign.center,
        ),
      ),
      body: _buildList(context),
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
