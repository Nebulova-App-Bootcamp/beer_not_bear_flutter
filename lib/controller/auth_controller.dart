import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  GoogleSignIn _googleSignIn = GoogleSignIn();
  RxBool checkboxValue = false.obs;
  RxBool obscurePassConfirmation = true.obs;
  RxBool obscureTextPass = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<User> signInAnonymous() async {
    UserCredential result = await _auth.signInAnonymously();

    print(result.user!.isAnonymous);
    return result.user!;
  }

  Future<User?> signInGoogle() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);

      //var doc = await FirestoreService("users").get(result.user!.uid);
      //if (!doc.exists) {
      // UserModel _newUser = UserModel(
      //     uid: result.user!.uid,
      //     email: result.user!.email,
      //     name: result.user!.displayName!,
      //     photoUrl: result.user!.photoURL!);

      //firestoreUser.value = _newUser;

      // DatabaseUsers().createNewUser(_newUser);
      //get token of mobile
      _firebaseMessaging.getToken().then((token) {
        saveTokens(token);
      });

      return result.user;
    }

    return null;
  }

  Future<void> saveTokens(var token) async {
    try {
      await _db.collection('tokens').doc(token).set({
        'token': token,
      });
    } catch (e) {
      print(e);
    }
  }
}
