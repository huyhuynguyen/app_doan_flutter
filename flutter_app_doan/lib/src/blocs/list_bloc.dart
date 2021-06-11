import 'dart:async';

import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';
import 'package:flutter_app_doan/src/fire_base/fire_store_list.dart';

class ListBloc {
  FireStoreList list = new FireStoreList();
  FirAuth _firAuth = new FirAuth();

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

  void addListThucAnChosen(Map<String, dynamic> thucAnchosen, Function onSuccess) {
    _firAuth.addListThucAnChosen(thucAnchosen, onSuccess);
  }

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

  void deleteThucAnUser(Map<String, dynamic> thucAnToUpdate, Function onSuccess) {
    _firAuth.deleteThucAnUser(thucAnToUpdate, onSuccess);
  }

}