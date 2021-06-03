import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void signIn(User user, Function onSuccess, Function(String) onLoginError) {

  }
}