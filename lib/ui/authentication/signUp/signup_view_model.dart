import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart' as constant;
import '../../../app/locator.dart';
import '../../../services/authentication_service.dart';
import '../../../services/navigation_service.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  File _pickedImage;


  void selectImage(File image) {
    if (image == null) image = File(constant.defaultUserProfilePicture);
    _pickedImage = image;
  }

  Future<void> handleSignUp(GlobalKey<FormBuilderState> _formKey) async {
    if (_formKey.currentState.saveAndValidate()) {
      try {
        final _formData = _formKey.currentState.value;
        if (_pickedImage == null) _pickedImage = File(constant.defaultUserProfilePicture);
        setBusy(true);
        final result = await _authenticationService.signUpWithEmailAndPassword(
          email: _formData[constant.email],
          profilePicture: _pickedImage,
          password: _formData[constant.password],
          userRole: _formData[constant.userrole],
          username: _formData[constant.username]);
        setBusy(false);
        if(result) {
          _navigationService.navigateToNamed(constant.startUpScreen);
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

  void navigateToSignIn() {
    _pickedImage = null;
    _navigationService.popBack();
  }
}
