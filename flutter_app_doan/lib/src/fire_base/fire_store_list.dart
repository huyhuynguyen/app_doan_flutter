import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FireStoreList {
  var _fireStoreInstance=FirebaseFirestore.instance;

  // get all thucAn in dinhduongPage
  Future<dynamic> getListThucAn() async{
    var arr =[];
    QuerySnapshot snapshot = await _fireStoreInstance.collection("ThucAn").get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    User user = FirebaseAuth.instance.currentUser;
    documents.forEach((element) {
      Map<String, dynamic> dataElement=element.data();
      if (!dataElement.containsKey('user')) {
        dataElement["id"]=element.id;
        arr.add(dataElement);
      }
      else {
        if (dataElement['user']==user.uid) {
          dataElement["id"]=element.id;
          arr.add(dataElement);
        }
      }

    });

    return arr;
  }

  // get all tapluyen in exercisePage
  Future<dynamic> getListExercise() async{
    var arr =[];
    QuerySnapshot snapshot = await _fireStoreInstance.collection("tapluyen").get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    documents.forEach((element) {
      Map<String, dynamic> dataElement = element.data();
      dataElement["id"]=element.id;
      arr.add(dataElement);
    });

    return arr;
  }
}