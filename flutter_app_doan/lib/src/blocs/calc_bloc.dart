import 'dart:async';

import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/global_list.dart';
import 'package:intl/intl.dart';

class CalcBloc {
  StreamController _proteinIniController = new StreamController();
  StreamController _beoController = new StreamController();
  StreamController _carbsController = new StreamController();
  StreamController _caloController = new StreamController();
  StreamController _dateController = new StreamController();

  Stream get proteinStream => _proteinIniController.stream;
  Stream get beoStream => _beoController.stream;
  Stream get carbsStream => _carbsController.stream;
  Stream get caloStream => _caloController.stream;
  Stream get dateStream => _dateController.stream;

  void CalcTPDinhDuong(double soluongIni, double soluong, double proteinIni, double beoIni, double carbsIni, double caloIni) {
    _proteinIniController.sink.add(((proteinIni*soluong)/soluongIni).toStringAsFixed(2));
    _beoController.sink.add(((beoIni*soluong)/soluongIni).toStringAsFixed(2));
    _carbsController.sink.add(((carbsIni*soluong)/soluongIni).toStringAsFixed(2));
    _caloController.sink.add(((caloIni*soluong)/soluongIni).toStringAsFixed(0));
  }

  void addOneDay(String dateIni) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime date=DateTime.parse(dateIni);
    var newDate=DateTime(date.year, date.month, date.day+1);
    _dateController.sink.add(dateFormat.format(newDate));
  }

  void minusOneDay(String dateIni) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime date=DateTime.parse(dateIni);
    var newDate=DateTime(date.year, date.month, date.day-1);
    _dateController.sink.add(dateFormat.format(newDate));
  }

  void getDayCalendar(DateTime date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    _dateController.sink.add(dateFormat.format(date));
  }


  AuthBloc authBloc = new AuthBloc();

  Future<double> BMICalc() async {
    int height = await authBloc.getValueUser("height");
    int weight = await authBloc.getValueUser("weight");
    double convertHeight = height/100;
    double result = weight / (convertHeight * convertHeight);
    return double.parse(result.toStringAsFixed(2));
  }

  Future<double> BMRCalc() async{
    int height = await authBloc.getValueUser("height");
    int weight = await authBloc.getValueUser("weight");
    String gender = await authBloc.getValueUser("gender");
    String age = await authBloc.getValueUser("age");
    double result=10*weight + 6.25*height - 5*int.parse(age);
    result += (gender=="Nam") ? 5 : -161;
    return double.parse(result.toStringAsFixed(2));
  }

  Future<int> TDEECalc() async{
    double BMR = await BMRCalc();
    return int.parse((BMR*1.55).toStringAsFixed(0));
  }


  void dispose() {
    _proteinIniController.close();
    _beoController.close();
    _carbsController.close();
    _caloController.close();
    _dateController.close();
  }
}