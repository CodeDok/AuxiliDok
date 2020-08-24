import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

import '../../helper/constants.dart' as constant;
import '../../locator.dart';
import '../../services/authentication_service.dart';
import '../../services/navigation_service.dart';

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
            email: _formData[constant.email],
            password: _formData[constant.password]);
        setBusy(false);
        if (result != false) {
          _navigationService.navigateToReplaceNamed(constant.startUpScreen);
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
    _navigationService.navigateToNamed(constant.signUp);
  }
}
