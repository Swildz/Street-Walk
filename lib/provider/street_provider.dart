import 'dart:io';

import 'package:application_street_walk/data/api/api_service.dart';
import 'package:application_street_walk/data/models/street_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:application_street_walk/utils/result_state.dart';
//enum ResultState { loading, noData, hasData, error }

class ListStreetProvider extends ChangeNotifier {
  final ApiService apiService;

  ListStreetProvider({required this.apiService}) {
    fetchstreet();
  }

  StreetModel? _streetModel;
  String _msg = '';
  ResultState? _state;

  String get message => _msg;

  StreetModel? get streetModel => _streetModel;

  ResultState? get state => _state;

  void fetchstreet() => _fetchstreet();

  Future<dynamic> _fetchstreet() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final streetModel = await apiService.fetchstreet();
      if (streetModel.articles.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _msg = 'No Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _streetModel = streetModel;
      }
    } on SocketException {
      _state = ResultState.Error;
      notifyListeners();
      return _msg = "No internet connection";
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _msg = "Opss Internet kamu tidak terhubung";
    }
  }
}
