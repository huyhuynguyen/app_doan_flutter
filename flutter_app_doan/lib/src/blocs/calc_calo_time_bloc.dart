import 'dart:async';

import 'package:flutter_app_doan/src/resources/selectedTick/global_list.dart';

class CalcCaloTimeBloc {
  StreamController _caloController = new StreamController();
  StreamController _timeController = new StreamController();

  Stream get caloTimeStream => _caloController.stream;
  Stream get timeStream => _timeController.stream;

  void calcCaloFromTapLuyen(int timeIni, int time, double caloIni) {
    _caloController.sink.add(((caloIni*time)/timeIni).toStringAsFixed(0));
    print('Time Change: ${GlobalList.time}');
  }

  bool checkTimeChange(int time) {
    if (time==0) {
      _timeController.sink.addError("Invalid");
      return false;
    }
    _timeController.sink.add("");
    return true;
  }

  void dispose() {
    _caloController.close();
    _timeController.close();
  }
}