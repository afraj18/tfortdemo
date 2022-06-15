// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

import 'package:tfortdemo/models/user.dart';
import 'package:tfortdemo/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj based on firebase User
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //Auth Change User Stream
  Stream<UserModel?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  //sign In Annonymous
  Future signInAnnoy() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register in with Email pass
  Future registerWithEmailAndPassword(
    String email,
    String password,
    String name,
    String address,
    String phoneNo,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // Create new document for the user with uid
      await DatabaseService(uid: user!.uid).UpdateUserData(
        name,
        email,
        "Investor",
        address,
        phoneNo,
      );
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
