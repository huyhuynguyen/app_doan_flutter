import 'dart:async';

import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';

class AddTapLuyenBloc {
  FirAuth _firAuth = new FirAuth();

  StreamController _nameController = new StreamController();
  StreamController _minuteController = new StreamController();
  StreamController _caloTapLuyenController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get minuteStream => _minuteController.stream;
  Stream get caloTapLuyenStream => _caloTapLuyenController.stream;

  bool isValidTapLuyen(Map<String, dynamic> tapluyen) {
    if (tapluyen["name"].toString().trim()=="") {
      _nameController.sink.addError("Please fill name");
      return false;
    }
    _nameController.sink.add("");

    if (tapluyen["time"]<=0) {
      _minuteController.sink.addError("Please enter correct minute");
      return false;
    }
    _minuteController.sink.add("");

    if (tapluyen["calo"]<=0) {
      _caloTapLuyenController.sink.addError("Please enter correct calo");
      return false;
    }
    _caloTapLuyenController.sink.add("");

    return true;
  }

  void addNewTapLuyenForUser(Map<String, dynamic> tapluyen, Function onSuccess) {
    _firAuth.addNewTapLuyenForUser(tapluyen, onSuccess);
  }

  void dispose() {
    _nameController.close();
    _minuteController.close();
    _caloTapLuyenController.close();
  }
}