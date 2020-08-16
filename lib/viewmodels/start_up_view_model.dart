

import 'package:auxilidok/services/authentication_service.dart';
import 'package:auxilidok/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import '../constants/constants.dart';

class StartUpViewModel extends ChangeNotifier{
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> handleStartUpLogic() async {
    var hasLoggedIn = await _authenticationService.isUserLoggedIn();

    if(hasLoggedIn) {
      _navigationService.navigateTo(startUpScreen);
    } else {
      _navigationService.navigateTo(signIn);
    }
  }


}