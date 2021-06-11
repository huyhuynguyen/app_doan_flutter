import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_doan/models/thuc_an.dart';
import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';
import '';
class FireStoreList {
  var _fireStoreInstance=FirebaseFirestore.instance;
  FirAuth _firAuth = new FirAuth();

  Future<dynamic> getListThucAn() async{
    var arr =[];
    QuerySnapshot snapshot = await _fireStoreInstance.collection("ThucAn").get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element) {
      Map<String, dynamic> dataElement = {
        "id": element.id,
        "name": element["name"],
        "soluong": element["soluong"],
        "donvitinh": element["donvitinh"],
        "protein": element["protein"],
        "beo": element["beo"],
        "carbs": element["carbs"],
        "calo": element["calo"]
      };
      arr.add(dataElement);
    });

    return arr;
  }

  Future<dynamic> getListExercise() async{
    var arr =[];
    QuerySnapshot snapshot = await _fireStoreInstance.collection("tapluyen").get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    documents.forEach((element) {
      Map<String, dynamic> dataElement = {
        "name": element["name"],
        "time": element["time"],
        "calo": element["calo"]
      };
      arr.add(dataElement);
    });

    return arr;
  }
}