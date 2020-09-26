
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../profile/profile_view.dart';
import '../welcomeMenu/welcome_menu_view.dart';


class HomeViewModel extends IndexTrackingViewModel {


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