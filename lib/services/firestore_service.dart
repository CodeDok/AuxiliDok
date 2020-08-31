import 'dart:io';

import 'package:auxilidok/models/credit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../app/constants.dart' as constant;
import '../models/user.dart' as userModel;

class FirestoreService {
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('users');
  final CollectionReference _creditManagerCollection = FirebaseFirestore.instance.collection('user_data');
  final StorageReference storageRef = FirebaseStorage.instance.ref();

  // ignore: missing_return
  Future<String> uploadeProfilePicture(File profilePicture, String userId) async {
    try {
      var snapshot = await storageRef
          .child(constant.userProfilePictureFolder)
          .child('$userId.jpg')
          .putFile(profilePicture)
          .onComplete;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  Future<void> createUser(userModel.User user, File profilePicture, UserCredential authResult) async {
    try {
      user.profilePictureUrl = await uploadeProfilePicture(profilePicture, authResult.user.uid);
      await _usersCollectionReference.doc(authResult.user.uid).set({
        'id' : authResult.user.uid,
        'profilPictureUrl': user.profilePictureUrl,
        'userRole': user.userrole,
        'username': user.username,
      });
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<userModel.User> getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return userModel.User.fromData(userData.data());
    } catch (e) {
    }
  }

  Future<List<Credit>> getCredits (String uid) async {
    try {
      List<Credit> credits;
      var creditData = await _creditManagerCollection.doc(uid).collection(constant.creditManagerCollection).get();
      creditData.docs.forEach((credit) { 

        print(credit.data());
        //if(!credit.exists) return credits = [];
        print(Credit.fromData(credit.data()));
        credits.add(Credit.fromData(credit.data()));
        print(credits);
      });
    } catch (e) {
    }
  }

  Future<void> addCredit (String uid, Credit credit) async {
    try {
      print(credit.toJson());
      var id = await _creditManagerCollection.doc(uid).collection(constant.creditManagerCollection).add(
        credit.toJson()
      );
      print('id: $id');
    } catch (e) {
      print(e);
    }
  }
}
