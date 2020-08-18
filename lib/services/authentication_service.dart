import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../locator.dart';
import '../models/user.dart' as userModel;
import 'firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  UserCredential authResult;
  userModel.User _currentUser;
  userModel.User get currentUser => _currentUser;

  Future<bool> signUpWithEmailAndPassword({
      @required String email,
      @required String password,
      @required File profilePicture,
      @required String userRole,
      @required String username
  }) async {
    try {
      authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (authResult == null) throw new Exception();
      userModel.User user = userModel.User(
        id: authResult.user.uid,
        email: email,
        username: username,
      );
      await _firestoreService.createUser(user, profilePicture, authResult);
      return authResult.user != null;
    } catch (e) {
      // Get.snackbar('Error', e.toString());
      print(e);
    }
  }

  Future<bool> signInWithEmailAndPassword({@required String email, @required String password}) async {
    try {
      authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult == null) throw new Exception();
      await _populateCurrentUser(authResult.user);
    } catch (e) {
      // Get.snackbar('Error', e.toString());
      print(e);
    }
  }

  Future<void> logout() async{
    _currentUser = null;
    await _firebaseAuth.signOut();
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
