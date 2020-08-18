import 'dart:io';

import 'package:auxilidok/constants/constants.dart' as constant;
import 'package:auxilidok/services/authentication_service.dart';
import 'package:auxilidok/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  File _pickedImage;


  void selectImage(File image) {
    _pickedImage = image;
  }

  Future<void> handleSignUp(GlobalKey<FormBuilderState> _formKey) async {
    if (_formKey.currentState.saveAndValidate()) {
      final _formData = _formKey.currentState.value;
      final result = await _authenticationService.signUpWithEmailAndPassword(
        email: _formData[constant.email],
        profilePicture: _pickedImage,
        password: _formData[constant.password],
        userRole: _formData[constant.userrole],
        username: _formData[constant.username]);
      if(result != false) {
        _navigationService.navigateTo(constant.startUpScreen);
      }
    }
  }

  void navigateToSignIn() {
    _navigationService.popBack();
  }
}
