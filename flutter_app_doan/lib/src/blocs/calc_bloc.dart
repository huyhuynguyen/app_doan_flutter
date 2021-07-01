import 'dart:async';

import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';

class CalcBloc {
  // StreamController _bmiController = new StreamController();
  // StreamController _bmrController = new StreamController();
  // StreamController _tdeeController = new StreamController();
  StreamController _proteinIniController = new StreamController();
  StreamController _beoController = new StreamController();
  StreamController _carbsController = new StreamController();
  StreamController _caloController = new StreamController();

  Stream get proteinStream => _proteinIniController.stream;
  Stream get beoStream => _beoController.stream;
  Stream get carbsStream => _carbsController.stream;
  Stream get caloStream => _caloController.stream;

  void CalcTPDinhDuong(double soluongIni, double soluong, double proteinIni, double beoIni, double carbsIni, double caloIni) {
    _proteinIniController.sink.add(((proteinIni*soluong)/soluongIni).toStringAsFixed(2));
    _beoController.sink.add(((beoIni*soluong)/soluongIni).toStringAsFixed(2));
    _carbsController.sink.add(((carbsIni*soluong)/soluongIni).toStringAsFixed(2));
    _caloController.sink.add(((caloIni*soluong)/soluongIni).toStringAsFixed(0));
  }

  // void calcCaloFromTapLuyen(int timeIni, int time, double caloIni) {
  //   _caloController.sink.add(((caloIni*time)/timeIni).toStringAsFixed(0));
  // }


  AuthBloc authBloc = new AuthBloc();

  Future<double> BMICalc() async {
    int height = await authBloc.getValueUser("height");
    int weight = await authBloc.getValueUser("weight");
    double convertHeight = height/100;
    double result = weight / (convertHeight * convertHeight);
    return double.parse(result.toStringAsFixed(2));
  }

  double BMRCalc(int weight, int height) {

  }

  double TDEECalc(int weight, int height) {

  }



  void dispose() {
    _proteinIniController.close();
    _beoController.close();
    _carbsController.close();
    _caloController.close();
  }
}