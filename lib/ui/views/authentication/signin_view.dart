import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/constants.dart';
import '../../../viewmodels/authentication/signin_view_model.dart';
import '../../widgets/busy_button.dart';
import '../../widgets/textFormWidget.dart';

class SignInView extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              height: mediaQuery.size.height*0.5,
              width: mediaQuery.size.width*0.9,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.only(bottom: 10,top: 20, left: 20, right:20),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormWidget(
                          attributeAndLabel: email, 
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.local_post_office,
                        ),
                        TextFormWidget(
                          attributeAndLabel: password, 
                          obTxt: true,
                          icon: Icons.vpn_key,
                        ),
                        BusyButton(
                          title: 'Sign In',
                          busy: model.anyObjectsBusy,
                          onPressed: () {
                            model.handleSignIn(_formKey);
                          },
                        ),
                        FlatButton(
                          child: Text('Create a new Account'),
                          onPressed: () {
                            model.navigateToSignUp();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}