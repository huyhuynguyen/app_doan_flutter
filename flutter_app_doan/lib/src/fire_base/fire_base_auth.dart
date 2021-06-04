import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  void signIn(String email, String name, String yearOfBirth, Function onSuccess, Function(String) onError) async{
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: "123456");
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


    var ref=FirebaseDatabase.instance.reference().child("users");
    ref.child(uid).set(user).then((user) {
      // SUCCESS
      onSuccess();
    }).catchError((err) {
      // TODO
      onError("Sign up failed, please try again");
    });
  }

  void login(String email, Function onSuccess) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: "123456");
    }on FirebaseException catch(e) {

    }
  }

  void updateCurrentUser(int height, int weight, Function onSuccess) async {
    User user = auth.currentUser;
    DatabaseReference reference = FirebaseDatabase.instance.reference().child("users");
    await reference.child(user.uid).child("height").set(height).then((user) {

    }).catchError((err) {

    });

    await reference.child(user.uid).child("weight").set(weight).then((user) {
      onSuccess();
    }).catchError((err) {

    });
  }

  User get currentUser => auth.currentUser;

  // void getName() async{
  //   User user = _auth.currentUser;
  //   DatabaseReference reference = FirebaseDatabase.instance.reference().child("users");
  //   await reference.child(user.uid).child('name').once().then((DataSnapshot snapshop) {
  //     print(snapshop.value);
  //   });
  // }


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
}