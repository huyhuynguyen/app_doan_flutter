import 'dart:async';

import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';
import 'package:flutter_app_doan/src/fire_base/fire_store_list.dart';

class ListBloc {
  FireStoreList list = new FireStoreList();
  FirAuth _firAuth = new FirAuth();

  // get all list ThucAn
  Future<List<dynamic>> getListThucAn(String searchText) async {
    var arr = await list.getListThucAn();
    if (searchText.trim()=="") {
      List<dynamic> listThucAnFull = arr.toList();
      return listThucAnFull;
    }
    var filterArr = [];
    arr.forEach((thucAn) {
      if (thucAn["name"].toLowerCase().contains(searchText.trim().toLowerCase()))
        filterArr.add(thucAn);
    });
    List<dynamic> listThucAnForSearch = filterArr.toList();
    return listThucAnForSearch;
  }

  Future<List<dynamic>> getListExercise(String searchText) async {
    var arr = await list.getListExercise();
    if (searchText.trim()=="") {
      List<dynamic> listExerciseFull = arr.toList();
      return listExerciseFull;
    }
    var filterArr = [];
    arr.forEach((exercise) {
      if (exercise["name"].toLowerCase().contains(searchText.trim().toLowerCase()))
        filterArr.add(exercise);
    });
    List<dynamic> listExerciseForSearch = filterArr.toList();
    return listExerciseForSearch;
  }

  // add thức ăn chọn trong addToDiary
  void addThucAnChosen(Map<String, dynamic> thucAnchosen, Function onSuccess) {
    _firAuth.addThucAnChosen(thucAnchosen, onSuccess);
  }

  // get List ThucAn which user chose
  Future<List<dynamic>> getListThucAnForUser() async {
    var arr = await _firAuth.getListThucAnForUser();
    if (arr.length==0)
      arr=[];
    List<dynamic> listThucAnForUser = arr.toList();
    return listThucAnForUser;
  }

  void updateThucAnUser(Map<String, dynamic> thucAnToUpdate, Function onSuccess) {
    _firAuth.updateThucAnUser(thucAnToUpdate, onSuccess);
  }

  void deleteThucAnUser(String thucAnUserDocId, Function onSuccess) {
    _firAuth.deleteThucAnUser(thucAnUserDocId, onSuccess);
  }

  Future<double> sumOfCaloThucAnUser() async {
    var arr = await _firAuth.getListThucAnForUser();
    return arr.fold(0.0, (value, element) => value+(element["calo"]+.0));
  }

  // add tapluyen chọn trong dialog "add"
  void addTapluyenChosen(Map<String, dynamic> tapluyenchosen, Function onSuccess) {
    _firAuth.addTapLuyenChosen(tapluyenchosen, onSuccess);
  }

  // get List Tapluyen which user chose
  Future<List<dynamic>> getListTapLuyenForUser() async {
    var arr = await _firAuth.getListTapLuyenForUser();
    if (arr.length==0)
      arr=[];
    List<dynamic> listTapluyenForUser = arr.toList();
    return listTapluyenForUser;
  }

  void updateTapLuyenUser(Map<String, dynamic> tapluyenToUpdate, Function onSuccess) {
    _firAuth.updateTapLuyenUser(tapluyenToUpdate, onSuccess);
  }


  void deleteTapluyenUser(String tapluyenUserDocId, Function onSuccess) {
    _firAuth.deleteTapLuyenUser(tapluyenUserDocId, onSuccess);
  }

  Future<double> sumOfCaloTapluyenUser() async {
    var arr = await _firAuth.getListTapLuyenForUser();
    return arr.fold(0.0, (value, element) => value+(element["calo"]+.0));
  }

  Future<double> caloDay() async {
    double a = await sumOfCaloThucAnUser();
    double b = await sumOfCaloTapluyenUser();
    return a-b;
  }
}