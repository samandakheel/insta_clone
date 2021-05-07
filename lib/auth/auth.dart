import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  AuthRepo._();
  static final AuthRepo instance = AuthRepo._();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> login(String email, String password) async {
    UserCredential _result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User _user = _result.user;
    return _user.uid;
  }

  Future<String> register(String email, String password) async {
    UserCredential _result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User _user = _result.user;
    return _user.uid;
  }

  Future<void> logOut() {
    return _firebaseAuth.signOut();
  }

  User giveCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
