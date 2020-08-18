import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants.dart' as constant;
import '../../locator.dart';
import '../../services/authentication_service.dart';
import '../../services/navigation_service.dart';

class SignInViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();


  Future<void> handleSignIn(GlobalKey<FormBuilderState> _formKey) async {
    if (_formKey.currentState.saveAndValidate()) {
      final _formData = _formKey.currentState.value;
      setBusy(true);
      final result = await _authenticationService.signInWithEmailAndPassword(
        email: _formData[constant.email],
        password: _formData[constant.password]
        );
      setBusy(false);
      if(result != false) {
        _navigationService.navigateTo(constant.startUpScreen);
      }
    }
  }
    
  void navigateToSignUp() {
    _navigationService.navigateTo(constant.signUp);
  }
}