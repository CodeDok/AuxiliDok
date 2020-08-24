import 'package:auxilidok/helper/constants.dart';
import 'package:auxilidok/services/authentication_service.dart';
import 'package:auxilidok/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class WelcomeMenuViewModel extends BaseViewModel {
  AuthenticationService _authenticationService = locator<AuthenticationService>();
  NavigationService _navigationService = locator<NavigationService>();

  void navigateToCM() {
    _navigationService.navigateToNamed(cmOverview);
  }

  void logout() {
    _authenticationService.logout();
    _navigationService.navigateToNamed(startUpScreen);
  }
}