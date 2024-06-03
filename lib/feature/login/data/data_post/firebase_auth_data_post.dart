import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataPost {
  Future<User?> login(String email, String password);
  Future<void> logOut();
}

class AuthDataPostImpl implements AuthDataPost {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> login(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  @override
  Future<void> logOut() async {
    final result = await logOut();
    return result;
  }
}
