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
      try {
        final _formData = _formKey.currentState.value;
        final result = await _authenticationService.signUpWithEmailAndPassword(
          email: _formData[constant.email],
          profilePicture: _pickedImage,
          password: _formData[constant.password],
          userRole: _formData[constant.userrole],
          username: _formData[constant.username]);
        if(result) {
          _navigationService.navigateTo(constant.startUpScreen);
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
                  _navigationService.pop();
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

  void navigateToSignIn() {
    _navigationService.popBack();
  }
}
