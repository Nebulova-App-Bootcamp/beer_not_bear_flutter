import 'dart:developer';
import 'package:beer_not_bear_flutter/models/user_model.dart';
import 'package:beer_not_bear_flutter/pages/home.dart';
import 'package:beer_not_bear_flutter/pages/intro.dart';
import 'package:beer_not_bear_flutter/services/firestore/firestore_service_users.dart';
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
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    //run every time auth state change
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);
    super.onReady();
  }

  //Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      if (firebaseUser.value?.isAnonymous == false)
        firestoreUser.bindStream(streamFirestoreUser());
    }

    if (_firebaseUser == null) {
      Get.offAll(Intro());
    } else {
      Get.offAll(Home());
    }
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return _db.doc('/users/${firebaseUser.value!.uid}').get().then(
        (documentSnapshot) => UserModel.fromJson(documentSnapshot.data()!));
  }

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    return _db
        .doc('users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) {
      print(snapshot.data() as Map<String, dynamic>);
      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    });
  }

  Future<User> signInAnonymous() async {
    UserCredential result = await _auth.signInAnonymously();

    print(result.user!.isAnonymous);
    return result.user!;
  }

  Future<void> updateUser(BuildContext context, UserModel user) async {
    try {
      _db.doc('/users/${user.uid}').update(user.toJson());
      update();
    } catch (err) {
      log("$err");
    }
  }

  registerWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      )
          .then((result) async {
        print("UID: " + result.user!.uid.toString());
        print("email: " + result.user!.email.toString());

        UserModel _newUser = UserModel(
          uid: result.user!.uid,
          email: result.user!.email,
          name: "user",
          photoUrl: "https://picsum.photos/250?image=9",
        );
        DatabaseUsers().createNewUser(_newUser);
        Get.to(Home());
      });
    } on FirebaseAuthException catch (error) {
      print(error.message);
    }
  }

  signInWithEmailAndPassword() async {
    try {
      print(emailController.text.trim());
      print(passController.text.trim());
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
      emailController.clear();
      passController.clear();
      Get.to(Home());
    } catch (err) {
      print(err);
    }
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

      UserModel _newUser = UserModel(
        uid: result.user!.uid,
        email: result.user!.email,
        name: result.user!.displayName!,
        photoUrl: result.user!.photoURL!,
      );

      DatabaseUsers().createNewUser(_newUser);
      //get token of mobile
      _firebaseMessaging.getToken().then((token) {
        saveTokens(token);
      });

      Get.to(Home());

      return result.user;
    }

    return null;
  }

  //Pasword reset email
  Future<void> sendPasswordResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar("OYE USUARIOOOO", "TE HEMOS ENVIADO UN EMAIL");
    } on FirebaseAuthException catch (error) {
      print(error.message);
    }
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

  // Sign out
  Future<void> signOut() {
    _googleSignIn.signOut();
    return _auth.signOut();
  }
}
