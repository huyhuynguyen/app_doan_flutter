// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/global_list.dart';
import 'package:intl/intl.dart';

class FirAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var firestoreInstance = FirebaseFirestore.instance;

  void signIn(Map<String, dynamic> user, Function onSuccess, Function(String) onError) async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: user["email"], password: "123456");
      // success
      return createUserDB(userCredential.user.uid, user["name"], user["yearOfBirth"], user["gender"], onSuccess, onError);
    } on FirebaseAuthException catch (e) {
      _onSignInErr(e.code, onError);
    }
  }

  void createUserDB(String uid, String name, String yearOfBirth, String gender, Function onSuccess, Function(String) onError) {
    // var weightArray=[];
    var user={
      "name" : name,
      "year of birth": yearOfBirth,
      "gender": gender,
      "height": 0,
      "weight": 0
    };

    firestoreInstance.collection("user").doc(uid).set(user).then((value) {
      onSuccess();
    }).catchError((err) {
      onError("Sign up failed, please try again");
    });
    // var ref=FirebaseDatabase.instance.reference().child("users");
    // ref.child(uid).set(user).then((user) {
    //   // SUCCESS
    //   onSuccess();
    // }).catchError((err) {
    //   // TODO
    //   onError("Sign up failed, please try again");
    // });
  }

  void login(String email, Function onSuccess, Function(String) onError) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: "123456");
      return onSuccess();
    }on FirebaseException catch(e) {
      _onLoginErr(e.code, onError);
    }
  }

  void logout(Function onSuccess) async{
    await _auth.signOut();
    onSuccess();
  }

  void updateCurrentUser(int height, int weight, Function onSuccess) async {
    User user = _auth.currentUser;
    // DocumentReference reference = firestoreInstance.collection("user").doc(user.uid);
    // DocumentSnapshot snapshot = await reference.get();
    //
    // Map<String, dynamic> maps=snapshot.data();
    // var weightArray=maps["weightArray"];
    // var result=false;
    // for (var element in weightArray) {
    //   if (element["date"]==DateFormat("yyyy-MM-dd").format(DateTime.now())) {
    //     element["weight"]=weight;
    //     result=true;
    //   }
    // }
    // if (!result) {
    //   Map<String, dynamic> weightDate={
    //     "weight" : weight,
    //     "date" : DateFormat("yyyy-MM-dd").format(DateTime.now())
    //   };
    //   weightArray.add(weightDate);
    // }

    await firestoreInstance
        .collection("user")
        .doc(user.uid)
        .update({"height": height});

    await firestoreInstance
        .collection("user")
        .doc(user.uid)
        .update({"weight": weight}).
          then((value) => onSuccess())
          .catchError((err) => print(err));
    // DatabaseReference reference = FirebaseDatabase.instance.reference().child("users");
    // await reference.child(user.uid).child("height").set(height).then((user) {
    //
    // }).catchError((err) {
    //
    // });
    //
    // await reference.child(user.uid).child("weight").set(weight).then((user) {
    //   onSuccess();
    // }).catchError((err) {
    //
    // });
  }

  Future<dynamic> getValueUser() async{
    User user = _auth.currentUser;
    DocumentReference reference = firestoreInstance.collection("user").doc(user.uid);
    try {
      DocumentSnapshot snapshot = await reference.get();
      return snapshot.data();
    } catch(e) {
      print(e);
    }
    
    // DatabaseReference reference = FirebaseDatabase.instance.reference().child("users");
    // try {
    //   DataSnapshot dataSnapshot = await reference.child(user.uid).child(key).once();
    //   return dataSnapshot.value;
    // }catch(e) {
    //   print(e);
    // }
  }

  // thêm vào thuc an user chọn
  Future<void> addThucAnChosen(Map<String, dynamic> thucAnchosen, Function onSuccess) async{
    User user = _auth.currentUser;
    thucAnchosen["user"]=user.uid;
    thucAnchosen["dateChon"]=GlobalList.time;
    await firestoreInstance.collection("user_ThucAn").add(thucAnchosen)
        .then((value) => onSuccess());
  }

  // listThucAn mà user đã chọn và hiển thị bên trang homePage
  Future<dynamic> getListThucAnForUser() async {
    User user = _auth.currentUser;
    var arr =[];
    QuerySnapshot snapshot = await firestoreInstance.collection("user_ThucAn").get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element) {
      if (user.uid == element["user"] && GlobalList.time == element["dateChon"]) {
        Map<String, dynamic> data = element.data();
        data["docID"] = element.id;
        arr.add(data);
      }
    });
    return arr;
  }

  Future<void> updateThucAnUser(Map<String, dynamic> thucAnToUpdate, Function onSuccess) async{
    await firestoreInstance
        .collection("user_ThucAn")
        .doc(thucAnToUpdate["docID"])
        .update(thucAnToUpdate).then((value) => onSuccess());
  }

  Future<void> deleteThucAnUser(String thucAnUserDocId, Function onSuccess) async {
    await firestoreInstance
        .collection("user_ThucAn")
        .doc(thucAnUserDocId)
        .delete().then((value) => onSuccess());
  }

  Future<void> deleteThucAnTuChon(String thucAnTuChonId, Function onSuccess) async {
    await firestoreInstance
        .collection("ThucAn")
        .doc(thucAnTuChonId)
        .delete().then((value) => onSuccess());
  }

  // thêm thực đơn
  Future<void> addNewThucAnForUser(Map<String, dynamic> thucAnToAdd, Function onSuccess) async {
    User user = _auth.currentUser;
    thucAnToAdd["user"]=user.uid;
    await firestoreInstance.collection("ThucAn").add(thucAnToAdd)
        .then((value) => onSuccess());
  }

  // thêm vào khi tick tap luyen
  Future<void> addTapLuyenChosen(Map<String, dynamic> tapluyenchosen, Function onSuccess) async{
    User user = _auth.currentUser;
    tapluyenchosen["user"]=user.uid;
    tapluyenchosen["dateChon"]=GlobalList.time;
    await firestoreInstance.collection("user_tapluyen").add(tapluyenchosen)
        .then((value) => onSuccess());
  }

  Future<void> deleteTapLuyenTuChon(String tapLuyenTuChonId, Function onSuccess) async {
    await firestoreInstance
        .collection("tapluyen")
        .doc(tapLuyenTuChonId)
        .delete().then((value) => onSuccess());
  }

  // listTapLuyen mà user đã chọn và hiển thị bên trang homePage
  Future<dynamic> getListTapLuyenForUser() async {
    User user = _auth.currentUser;
    var arr =[];
    QuerySnapshot snapshot = await firestoreInstance.collection("user_tapluyen").get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element) {
      if (user.uid == element["user"] && GlobalList.time == element["dateChon"]) {
        Map<String, dynamic> data = element.data();
        data["docID"]=element.id;
        arr.add(data);
      }
    });
    return arr;
  }

  Future<void> updateTapLuyenUser(Map<String, dynamic> tapluyenToUpdate, Function onSuccess) async{
    await firestoreInstance
        .collection("user_tapluyen")
        .doc(tapluyenToUpdate["docID"])
        .update(tapluyenToUpdate).then((value) => onSuccess());
  }

  Future<void> deleteTapLuyenUser(String tapluyenUserDocId, Function onSuccess) async {
    await firestoreInstance
        .collection("user_tapluyen")
        .doc(tapluyenUserDocId)
        .delete().then((value) => onSuccess());
  }

  // thêm tập luyện
  Future<void> addNewTapLuyenForUser(Map<String, dynamic> tapluyen, Function onSuccess) async {
    User user = _auth.currentUser;
    tapluyen["user"]=user.uid;
    await firestoreInstance.collection("tapluyen").add(tapluyen)
        .then((value) => onSuccess());
  }

  Future<void> addToNote(Map<String, String> note, Function onSuccess) async{
    User user = _auth.currentUser;
    note["user"]=user.uid;
    await firestoreInstance.collection("note").add(note)
        .then((value) => onSuccess());
  }

  Future<void> deleteNote(String noteId, Function onSuccess) async{
    await firestoreInstance
        .collection("note")
        .doc(noteId)
        .delete().then((value) => onSuccess());
  }
  
  Future<void> updateNote(Map<String, String> noteNew, String noteID, Function onSuccess) async {
    await firestoreInstance
        .collection("note")
        .doc(noteID)
        .update(noteNew).then((value) => onSuccess());
  }

  void _onSignInErr(String code, Function(String) onError) {
    switch(code) {
      case "email-already-in-use":
        onError("Email already in use");
        break;
      case "invalid-email":
        onError("Invalid email");
        break;
      case "operation-not-allowed":
        onError("Operation not allowed");
        break;
      default:
        onError("Sign up failed, please try again");
        break;
    }
  }

  void _onLoginErr(String code, Function(String p1) onError) {
    switch(code) {
      case "invalid-email":
        onError("Invaid email");
        break;
      default:
        onError("Login fail");
        break;
    }
  }
}