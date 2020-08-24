

import 'package:auxilidok/services/authentication_service.dart';
import 'package:auxilidok/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../helper/constants.dart';

class StreamStartUpViewModel extends StreamViewModel<User>{
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();


  @override
  void onData(User data) async{
    if(data != null) {
      await _authenticationService.populateCurrentUser(data);
      _navigationService.navigateToReplaceNamed(home);
    } else {
      _navigationService.navigateToReplaceNamed(signIn);
    }
    super.onData(data);
  }



  @override
  Stream<User> get stream => _authenticationService.isUserLoggedIn;




}