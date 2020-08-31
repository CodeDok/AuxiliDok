import 'package:auxilidok/app/constants.dart' as constants;
import 'package:auxilidok/services/authentication_service.dart';
import 'package:auxilidok/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';


class SignInViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  

  Future<void> handleSignIn(GlobalKey<FormBuilderState> _formKey) async {
    if (_formKey.currentState.saveAndValidate()) {
      final _formData = _formKey.currentState.value;
      try {
        setBusy(true);
        final result = await _authenticationService.signInWithEmailAndPassword(
            email: _formData[constants.email],
            password: _formData[constants.password]);
        setBusy(false);
        if (result != false) {
          _navigationService.navigateToReplaceNamed(constants.startUpScreen);
        }
      } catch (error) {
        showDialog(
          context:
              _navigationService.navigationKey.currentState.overlay.context,
          builder: (context) => new AlertDialog(
            title: Text('Error'),
            content: Text(error),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  _navigationService.popBack();
                },
              )
            ],
          ),
        );
      } finally {
        setBusy(false);
      }
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateToNamed(constants.signUp);
  }
}
