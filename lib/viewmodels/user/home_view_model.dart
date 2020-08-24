
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../helper/constants.dart';
import '../../locator.dart';
import '../../services/authentication_service.dart';
import '../../services/navigation_service.dart';
import '../../ui/views/user/profile_view.dart';
import '../../ui/views/user/welcome_menu_view.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final AuthenticationService _authenticationService =locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();


  String get username => _authenticationService.currentUser.username;

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return WelcomeMenu();
        break;
      case 1:
        return ProfileView();
        break;
      default:
        return WelcomeMenu();
    }
  }

}