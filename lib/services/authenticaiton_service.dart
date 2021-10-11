import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(
    this._firebaseAuth,
  );

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return "Error login : " + e.message!;
    }
  }

  Future<String> logout() async {
    try {
      await _firebaseAuth.signOut();
      return "Signed out";
    } on FirebaseAuthException catch (e) {
      return "Error Signout : " + e.message!;
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Sign up done";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }
}
