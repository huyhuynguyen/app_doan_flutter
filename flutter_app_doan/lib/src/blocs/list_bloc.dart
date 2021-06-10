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

  Future<void> UpdateThucAnUser() async{

  }

}