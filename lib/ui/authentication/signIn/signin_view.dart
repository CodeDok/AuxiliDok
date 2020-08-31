import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart' as constants;
import '../../dumb_widgets/app/authentication_input_field.dart';
import '../../dumb_widgets/app/busy_button.dart';
import '../../dumb_widgets/app/textFormWidget.dart';
import 'signin_view_model.dart';

class SignInView extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          decoration: BoxDecoration(
            gradient: constants.tLeftbRight_bluePurple
          ),
          child: Column(
            children: [
              ClipRRect(
                child: Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Transform.rotate(
                    angle: 45 * math.pi/180,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(color: constants.start_customChromeYellow_p25)
                      ),
                      padding: EdgeInsets.all(4),
                      height: 200,
                      width: 200,
                      child: Transform.rotate(
                        angle: -45 * math.pi/180,
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AuthenticationInputField(
                          label: constants.email, 
                          textInputField: TextFormWidget(
                            customLabeling: true,
                            attributeAndLabel: constants.email, 
                            keyboardType: TextInputType.emailAddress,
                            icon: Icons.local_post_office,
                            validation: [
                              FormBuilderValidators.email(errorText: 'Enter a valid email format!'),
                              FormBuilderValidators.minLength(5, errorText: 'Must be greater than 5 characters!')
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        AuthenticationInputField(
                          label: constants.password,
                          textInputField: TextFormWidget(
                            attributeAndLabel: constants.password, 
                            customLabeling: true,
                            obTxt: true,
                            icon: Icons.vpn_key,
                            validation: [
                              FormBuilderValidators.minLength(6, errorText: 'Must be greater than 6 characters!'),
                            ],
                          ),
                        ),
                        FlatButton(
                          child: Text('Forgot Password?'),
                          onPressed: () {
                            model.navigateToSignUp();
                          },
                        ),
                        Container(
                          width: 100,
                          child: BusyButton(
                            color: constants.start_customChromeYellow.withOpacity(0.90),
                            title: 'Sign In',
                            textStyle: TextStyle(
                              color: Colors.white
                            ),
                            busy: model.anyObjectsBusy,
                            onPressed: () {
                              model.handleSignIn(_formKey);
                            },
                          ),
                        ),
                      ]
                    ),
                  ),
                )
              ),
              Spacer(),
              FlatButton(
                child: Text('Create a new Account'),
                onPressed: () {
                  model.navigateToSignUp();
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}