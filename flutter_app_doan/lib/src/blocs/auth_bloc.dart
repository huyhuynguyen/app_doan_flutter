import 'dart:async';

import 'package:flutter_app_doan/models/user.dart';
import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc {
  var _firauth= new FirAuth();

  StreamController _phoneController= new StreamController();
  StreamController _nameController= new StreamController();
  StreamController _yearOfBirthController=new StreamController();

  Stream get phoneStream => _phoneController.stream;
  Stream get nameStream => _nameController.stream;
  Stream get yearOfBirthStream => _yearOfBirthController.stream;

  bool isValid(User user) {
    if (user.email.length==0) {
      _phoneController.sink.addError("Please enter your email");
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

  void signIn(User user, Function onSuccess, Function(String) onLoginError) {
    _firauth.signIn(user.email, user.name, user.yearOfBirth, onSuccess, onLoginError);
  }

  void logIn(String email, Function onSuccess, Function(String) onLoginError) {
    _firauth.login(email, onSuccess, onLoginError);
  }

  void logOut(Function onSuccess) {
    _firauth.logout(onSuccess);
  }

  void updateCurrentUser(int height, int weight, Function onSuccess) {
    _firauth.updateCurrentUser(height, weight, onSuccess);
  }

  Future<dynamic> getValueUser(String key) async{
    var userValue=  await _firauth.getValueUser();
    if (key=="age") {
      DateTime now=new DateTime.now();
      int age=now.year-int.parse(userValue['year of birth']);
      return age.toString();
    }
    return userValue[key];
  }

  void dispose() {
    _phoneController.close();
    _nameController.close();
    _yearOfBirthController.close();
  }
}