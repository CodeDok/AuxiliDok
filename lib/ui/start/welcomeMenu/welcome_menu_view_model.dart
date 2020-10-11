import 'package:auxilidok/app/constants.dart' as constants;
import 'package:auxilidok/services/authentication_service.dart';
import 'package:auxilidok/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';


class WelcomeMenuViewModel extends BaseViewModel {
  AuthenticationService _authenticationService = locator<AuthenticationService>();
  NavigationService _navigationService = locator<NavigationService>();

  void navigateToCM() {
    setBusy(true);
    locator.isReady(instanceName: 'CreditManager').then((value) {
      setBusy(false);
      _navigationService.navigateToNamed(constants.cmHome);
    });
  }

  void logout() {
    _authenticationService.logout();
    _navigationService.navigateToNamed(constants.startUpScreen);
  }
}