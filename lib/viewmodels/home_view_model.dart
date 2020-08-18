
import 'package:auxilidok/constants/constants.dart';
import 'package:auxilidok/services/authentication_service.dart';
import 'package:auxilidok/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

import '../locator.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void logout() {
    _authenticationService.logout();
    _navigationService.navigateTo(startUpScreen);
  }
}