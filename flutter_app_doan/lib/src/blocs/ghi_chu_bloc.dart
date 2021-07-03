import 'dart:async';

import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';
import 'package:flutter_app_doan/src/fire_base/fire_store_list.dart';

class GhiChuBloc {
  StreamController _tieudeController = new StreamController();
  StreamController _noidungController = new StreamController();

  Stream get tieudeStream => _tieudeController.stream;
  Stream get noidungStream => _noidungController.stream;

  bool checkNullValue(String tieude, String noidung) {
    if (tieude=="") {
      _tieudeController.sink.addError("Please fill the title");
      return false;
    }
    _tieudeController.sink.add("");
    if (noidung=="") {
      _noidungController.sink.addError("Please fill the content");
      return false;
    }
    _noidungController.sink.add("");
    return true;
  }

  FirAuth _firAuth = new FirAuth();
  FireStoreList fireStoreList = new FireStoreList();

  void addToNote(Map<String, String> note, Function onSuccess) {
    _firAuth.addToNote(note, onSuccess);
  }

  void deleteNote(String noteId, Function onSuccess) {
    _firAuth.deleteNote(noteId, onSuccess);
  }

  void updateNote(Map<String, String> noteNew, String noteID, Function onSuccess) {
    _firAuth.updateNote(noteNew, noteID, onSuccess);
  }

  Future<List<dynamic>> getAllNotes() async{
    var arr = await fireStoreList.getAllNotes();
    return arr.toList();
  }

  void dispose() {
    _tieudeController.close();
    _noidungController.close();
  }
}