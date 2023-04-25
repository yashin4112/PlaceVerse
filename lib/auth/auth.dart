import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<User?> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}

class Auth {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<String?> signIn(String? email, String? password) async {
    if (email != Null && password!=Null) {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!, password: password!);
      User? user = result.user; 
      CollectionReference collectionReference = FirebaseFirestore.instance.collection('Cities');
      String uid = user!.uid;
      // collectionReference.add()
      FirebaseFirestore.instance.collection('cities').doc('authen2').set(
        {
          'capital': 'auth', 'uid': uid
        });
      return user.uid;
    }
  }

  static Future<String?> signUp(String? email, String? password) async {
    if (email != Null && password!=Null) {
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!, password: password!);
      User? user = result.user;
    return user!.uid;
    }
  }

  Future<User?> getCurrentUser() async {
    final User? user = await _firebaseAuth.currentUser;
    return user;
  }

  static Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    User? user = await _firebaseAuth.currentUser;
    user!.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    User? user = await _firebaseAuth.currentUser;
    return user!.emailVerified;
  }
}