import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app_doan/models/user.dart';
import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';

class AuthBloc {
  var _firauth=FirAuth();

  StreamController _phoneController= new StreamController();
  StreamController _nameController= new StreamController();
  StreamController _yearOfBirthController=new StreamController();
  StreamController _heightController=new StreamController();

  Stream get phoneStream => _phoneController.stream;
  Stream get nameStream => _nameController.stream;
  Stream get yearOfBirthStream => _yearOfBirthController.stream;
  Stream get heightStream => _heightController.stream;

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

  void updateCurrentUser(int height, int weight, Function onSuccess) {
    _firauth.updateCurrentUser(height, weight, onSuccess);
  }

  // void getName() {
  //   _firauth.getName();
  // }

  void getHeight() async{
    await FirebaseDatabase.instance.reference().child("users").child(_firauth.currentUser.uid).child('height').once().then((DataSnapshot dataSnapshot) {
      _heightController.sink.add(dataSnapshot.value);
    });
  }

  void dispose() {
    _phoneController.close();
    _nameController.close();
    _yearOfBirthController.close();
    _heightController.close();
  }
}