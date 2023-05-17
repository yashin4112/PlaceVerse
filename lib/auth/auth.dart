import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:placeverse/admin/view.dart';

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

  static Future<User?> signIn(String? email, String? password) async {
    if (email != Null && password!=Null) {
        try {
          UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
          User? user = result.user; 
          CollectionReference collectionReference = FirebaseFirestore.instance.collection('Cities');
          String uid = user!.uid;
          FirebaseFirestore.instance.collection('com').doc('authen2').set({
            'capital': 'auth', 'uid': uid
          });
          print('useerrr $user');
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminView()));
          // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext (context) => AdminView())));
          // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AdminView()));

          return user;
        } catch (e) {
          
        }
      }
    }

  static Future<String?> signUp(String? email, String? password) async {
    if (email != Null && password!=Null) {
      late UserCredential result;
      late User? user;
      try {
        result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!, password: password!);
        user = result.user;
        await user!.sendEmailVerification();
        return user.uid;
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
      
    }
  }

  static Future<User?> getCurrentUser() async {
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