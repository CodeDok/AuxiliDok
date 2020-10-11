import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../app/constants.dart' as constant;
import '../models/credit_manager/credit.dart';
import '../models/user.dart' as userModel;

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _creditManagerCollection =
      FirebaseFirestore.instance.collection('user_data');
  final StorageReference storageRef = FirebaseStorage.instance.ref();

  // ignore: missing_return
  Future<String> uploadeProfilePicture(
      File profilePicture, String userId) async {
    try {
      if(profilePicture == null) profilePicture = File(constant.defaultUserProfilePicture);
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

  Future<void> createUser(userModel.User user, File profilePicture,
      UserCredential authResult) async {
    try {
      user.profilePictureUrl = await uploadeProfilePicture(profilePicture, authResult.user.uid);
      await _usersCollectionReference.doc(authResult.user.uid).set({
        'id': authResult.user.uid,
        'profilePictureUrl': user.profilePictureUrl,
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
    } catch (e) {}
  }



  Future<void> addCredit(String uid, Credit credit) async {
    try {
      await _creditManagerCollection
          .doc(uid)
          .collection(constant.creditManagerCollection)
          .add(credit.toMap())
          .then((doc) {
            doc.update({'id': doc.id});
          });
    } catch (e) {
      print(e);
    }
  }


  Stream<List<Credit>> listenToCredits(String uid) {
    return _creditManagerCollection
      .doc(uid)
      .collection(constant.creditManagerCollection)
      .snapshots()
      .map((snapShot) => snapShot.docs.map((doc) => Credit.fromMap(doc.data()))
      .toList());
  }

}
