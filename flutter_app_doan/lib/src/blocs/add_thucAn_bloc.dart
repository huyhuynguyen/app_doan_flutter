import 'dart:async';

import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';
import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';

class AddThucAnBloc {
  FirAuth _firAuth = new FirAuth();

  StreamController _nameController = new StreamController();
  StreamController _numberController = new StreamController();
  StreamController _proteinController = new StreamController();
  StreamController _beoController = new StreamController();
  StreamController _carbsController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get numberStream => _numberController.stream;
  Stream get proteinStream => _proteinController.stream;
  Stream get beoStream => _beoController.stream;
  Stream get carbsStream => _carbsController.stream;


  bool isValidThucAn(Map<String, dynamic> thucAnToAdd) {
    if (thucAnToAdd["name"]=="") {
      _nameController.sink.addError("Please enter name of food");
      return false;
    }
    _nameController.sink.add("");

    if (thucAnToAdd["soluong"]=="" || double.parse(thucAnToAdd["soluong"]).runtimeType!=double || double.parse(thucAnToAdd["soluong"])<=0.0) {
      _numberController.sink.addError("Please enter the correct number format of food");
      return false;
    }
    _numberController.sink.add("");

    if (thucAnToAdd["protein"]=="" || double.parse(thucAnToAdd["protein"]).runtimeType!=double || double.parse(thucAnToAdd["protein"])<0.0) {
      _proteinController.sink.addError("Please enter the correct number format of protein");
      return false;
    }
    _proteinController.sink.add("");

    if (thucAnToAdd["beo"]=="" || double.parse(thucAnToAdd["beo"]).runtimeType!=double || double.parse(thucAnToAdd["beo"])<0.0) {
      _beoController.sink.addError("Please enter the correct number format of protein");
      return false;
    }
    _beoController.sink.add("");

    if (thucAnToAdd["carbs"]=="" || double.parse(thucAnToAdd["carbs"]).runtimeType!=double || double.parse(thucAnToAdd["carbs"])<0.0) {
      _carbsController.sink.addError("Please enter the correct number format of protein");
      return false;
    }
    _carbsController.sink.add("");

    return true;
  }

  void addNewThucAnForUser(Map<String, dynamic> thucAnToAdd, Function onSuccess) {
    _firAuth.addNewThucAnForUser(thucAnToAdd, onSuccess);
  }

  void dispose() {
    _nameController.close();
    _numberController.close();
    _proteinController.close();
    _beoController.close();
    _carbsController.close();
  }

}