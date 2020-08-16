import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../constants/constants.dart' as constant;
import '../models/user.dart';
import '../models/user.dart' as userModel;

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final StorageReference storageRef = FirebaseStorage.instance.ref();

  Future<String> uploadeProfilePicture(File profilePicture, String userId) async {
    try {
      var snapshot = await storageRef
          .child(constant.userImageFolder)
          .child('$userId.jpg')
          .putFile(profilePicture)
          .onComplete;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  Future<void> createUser(userModel.User user, File profilePicture, AuthResult authResult) async {
    try {
      user.profilePictureUrl = await uploadeProfilePicture(profilePicture, authResult.user.uid);
      await _usersCollectionReference.document(authResult.user.uid).setData({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'profilPictureUrl': user.profilePictureUrl,
        'userRole': user.userRole,
        'username': user.username,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<User> getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return userModel.User.fromData(userData.data);
    } catch (e) {
      print(e);
    }
  }
}
