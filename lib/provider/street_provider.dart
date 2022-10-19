import 'dart:io';

import 'package:application_street_walk/data/api/api_service.dart';
import 'package:application_street_walk/data/models/street_model.dart';
import 'package:flutter/cupertino.dart';

enum ResultState { loading, noData, hasData, error }

class ListStreetProvider extends ChangeNotifier {
  final ApiService apiService;

  ListStreetProvider({required this.apiService}) {
    fetchstreet();
  }

  StreetModel? _streetModel;
  Articles? _articles;

  // ignore: prefer_final_fields
  ResultState _resultState = ResultState.loading;
  String _msg = '';

  StreetModel get streetModel => _streetModel!;
  Articles get articles => _articles!;
  ResultState get resultState => _resultState;

  void fetchstreet() => _fetchstreet();

  Future<dynamic> _fetchstreet() async {
    try {
      _resultState;
      notifyListeners();
      final streetModel = await ApiService().fetchstreet();
      if (streetModel.articles!.isEmpty) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _msg = 'No Data';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _streetModel = streetModel;
      }
    } on SocketException {
      _resultState = ResultState.error;
      notifyListeners();
      return _msg = "No internet connection";
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _msg = "Opss Internet kamu tidak terhubung";
    }
  }
}
