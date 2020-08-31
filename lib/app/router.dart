
import 'package:flutter/material.dart';

import '../ui/authentication/signIn/signin_view.dart';
import '../ui/authentication/signUp/signup_view.dart';
import '../ui/authentication/startUp/start_up_view.dart';
import '../ui/credit_manager/home/cm_home_view.dart';
import '../ui/start/home/home_view.dart';
import '../ui/start/profile/profile_view.dart';
import 'constants.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case signIn:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignInView(),
      );
    case signUp:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case startUpScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartUpView(),
      );
    case home:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case profile:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ProfileView(),
      );
    case cmHome:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CMHomeView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}')),
        ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
