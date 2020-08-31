
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../services/authentication_service.dart';
import '../../../services/navigation_service.dart';
import '../profile/profile_view.dart';
import '../welcomeMenu/welcome_menu_view.dart';


class HomeViewModel extends IndexTrackingViewModel {
  final AuthenticationService _authenticationService =locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();



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