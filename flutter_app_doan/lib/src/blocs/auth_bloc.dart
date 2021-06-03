import 'dart:async';

import 'package:flutter_app_doan/models/user.dart';

class AuthBloc {
  StreamController _phoneController= new StreamController();
  StreamController _nameController= new StreamController();
  StreamController _yearOfBirthController=new StreamController();

  Stream get phoneStream => _phoneController.stream;
  Stream get nameStream => _nameController.stream;
  Stream get yearOfBirthStream => _yearOfBirthController.stream;

  bool isValid(User user) {
    if (user.phoneNumber.length==0) {
      _phoneController.sink.addError("Please enter your phone number");
      return false;
    }
    _phoneController.sink.add("");

    if (user.name.length==0) {
      _nameController.sink.addError("Please enter your name");
      return false;
    }
    _nameController.sink.add("");

    if (user.yearOfBirth.length==0) {
      _yearOfBirthController.sink.addError("Please enter correct year");
      return false;
    }
    _yearOfBirthController.sink.add("");

    return true;
  }

  void dispose() {
    _phoneController.close();
    _nameController.close();
    _yearOfBirthController.close();
  }
}