import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var firestoreInstance = FirebaseFirestore.instance;

  void signIn(String email, String name, String yearOfBirth, Function onSuccess, Function(String) onError) async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: "123456");
      // success
      return createUserDB(userCredential.user.uid, name, yearOfBirth, onSuccess, onError);
    } on FirebaseAuthException catch (e) {
      _onSignInErr(e.code, onError);
    }
  }

  void createUserDB(String uid, String name, String yearOfBirth, Function onSuccess, Function(String) onError) {
    var user={
      "name" : name,
      "year of birth": yearOfBirth,
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


  Future<void> addListThucAnChosen(Map<String, dynamic> thucAnchosen, Function onSuccess) async{
    User user = _auth.currentUser;
    thucAnchosen["user"]=user.uid;
    await firestoreInstance.collection("user_ThucAn").add(thucAnchosen)
        .then((value) => onSuccess());
  }

  Future<dynamic> getListThucAnForUser() async {
    User user = _auth.currentUser;
    var arr =[];
    QuerySnapshot snapshot = await firestoreInstance.collection("user_ThucAn").get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element) {
      if (user.uid == element["user"]) {
        Map<String, dynamic> data = {
          "id": element["id"],
          "name": element["name"],
          "soluong": element["soluong"],
          "donvitinh": element["donvitinh"],
          "protein": element["protein"],
          "beo": element["beo"],
          "carbs": element["carbs"],
          "calo": element["calo"],
          "user": element["user"]
        };

        arr.add(data);
      }
    });
    return arr;
  }

  Future<void> updateThucAnUser(Map<String, dynamic> thucAnToUpdate, Function onSuccess) async{
    User user = _auth.currentUser;
    QuerySnapshot snapshot = await firestoreInstance
        .collection("user_ThucAn")
        .where('user', isEqualTo: thucAnToUpdate["user"])
        .where('id', isEqualTo: thucAnToUpdate["id"])
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element) {
      firestoreInstance
          .collection("user_ThucAn")
          .doc(element.id)
          .update(thucAnToUpdate)
            .then((value) => onSuccess())
            .catchError((err) {}
      );
    });
  }

  Future<void> deleteThucAnUser(Map<String, dynamic> thucAnToUpdate, Function onSuccess) async {
    User user = _auth.currentUser;
    QuerySnapshot snapshot = await firestoreInstance
        .collection("user_ThucAn")
        .where('user', isEqualTo: thucAnToUpdate["user"])
        .where('id', isEqualTo: thucAnToUpdate["id"])
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element) {
      firestoreInstance
          .collection("user_ThucAn")
          .doc(element.id)
          .delete()
          .then((value) => onSuccess())
          .catchError((err) {}
      );
    });
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