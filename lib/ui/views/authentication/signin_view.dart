import 'package:auxilidok/viewmodels/authentication/signin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Sign In'),
          )
        ),
      ),
    );
  }
}