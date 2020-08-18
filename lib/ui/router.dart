import 'package:auxilidok/ui/views/authentication/signup_view.dart';
import 'package:auxilidok/ui/views/home_view.dart';
import 'package:auxilidok/ui/views/start_up_view.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'views/authentication/signin_view.dart';


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
