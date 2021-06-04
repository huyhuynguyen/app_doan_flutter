import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;

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


    var ref=FirebaseDatabase.instance.reference().child("users");
    ref.child(uid).set(user).then((user) {
      // SUCCESS
      onSuccess();
    }).catchError((err) {
      // TODO
      onError("Sign up failed, please try again");
    });
  }

  void login(String email, Function onSuccess, Function(String) onError) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: "123456");
      return onSuccess();
    }on FirebaseException catch(e) {
      _onLoginErr(e.code, onError);
    }
  }

  void updateCurrentUser(int height, int weight, Function onSuccess) async {
    User user = _auth.currentUser;
    DatabaseReference reference = FirebaseDatabase.instance.reference().child("users");
    await reference.child(user.uid).child("height").set(height).then((user) {

    }).catchError((err) {

    });

    await reference.child(user.uid).child("weight").set(weight).then((user) {
      onSuccess();
    }).catchError((err) {

    });
  }

  User get Usercurrent => _auth.currentUser;

  // User get currentUser => auth.currentUser;

  Future<dynamic> getValueUser(String key) async{
    User user = _auth.currentUser;
    DatabaseReference reference = FirebaseDatabase.instance.reference().child("users");
    try {
      DataSnapshot dataSnapshot = await reference.child(user.uid).child(key).once();
      return dataSnapshot.value;
    }catch(e) {
      print(e);
    }
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