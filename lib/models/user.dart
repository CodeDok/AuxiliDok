import '../app/enums.dart';
import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String email;
  String profilePictureUrl;
  String userrole;
  final String username;

  User({
    @required this.id,
    @required this.email,
    this.profilePictureUrl = 'https://firebasestorage.googleapis.com/v0/b/hotspot-368c2.appspot.com/o/user_image%2Fdefault_profile_image.png.png?alt=media&token=0046ee1b-ce7d-4810-8c39-b5b09dcc7c7b',
    @required this.username,
  }){
    this.userrole = userRole.Normal.role;
  }

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        profilePictureUrl = data.containsKey('profilePictureUrl') ? data['profilePictureUrl'] : 'https://firebasestorage.googleapis.com/v0/b/hotspot-368c2.appspot.com/o/user_image%2Fdefault_profile_image.png.png?alt=media&token=0046ee1b-ce7d-4810-8c39-b5b09dcc7c7b',
        username = data['username'],
        userrole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profilePictureUrl': profilePictureUrl,
      'email': email,
      'username': username,
      'userRole': userRole,
    };
  }
}
