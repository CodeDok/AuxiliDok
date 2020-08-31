import 'package:auxilidok/models/user.dart';
import 'package:auxilidok/services/authentication_service.dart';
import 'package:auxilidok/services/firestore_service.dart';
import 'package:auxilidok/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';


class FutureProfileViewModel extends FutureViewModel<User> {
  AuthenticationService _authenticationService = locator<AuthenticationService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  NavigationService _navigationService = locator<NavigationService>();


  Future<User> loadUserProfile() async {
    String uid = _authenticationService.currentUser.id;
    return await _firestoreService.getUser(uid);
  }

  @override
  Future<User> futureToRun() => loadUserProfile();

}