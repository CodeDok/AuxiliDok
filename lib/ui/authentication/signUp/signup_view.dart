import 'package:auxilidok/ui/dumb_widgets/app/authentication_input_field.dart';
import 'package:auxilidok/ui/dumb_widgets/app/busy_button.dart';
import 'package:auxilidok/ui/dumb_widgets/app/textFormWidget.dart';
import 'package:auxilidok/ui/dumb_widgets/app/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart' as constants;
import 'signup_view_model.dart';


class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, widget) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            decoration: BoxDecoration(
              gradient: constants.tLeftbRight_bluePurple
            ),
            child: Column(
              children: [
                UserImagePicker(model.selectImage),
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
                            label: constants.username, 
                            textInputField: TextFormWidget(
                              customLabeling: true,
                              attributeAndLabel: constants.username, 
                              keyboardType: TextInputType.emailAddress,
                              icon: Icons.local_post_office,
                              validation: [
                                FormBuilderValidators.minLength(5, errorText: 'Must be greater than 3 characters!')
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                          AuthenticationInputField(
                            label: constants.email, 
                            textInputField: TextFormWidget(
                              customLabeling: true,
                              attributeAndLabel: constants.email, 
                              keyboardType: TextInputType.emailAddress,
                              icon: Icons.person,
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
                                model.handleSignUp(_formKey);
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
                  child: Text('Sign in with existing Account'),
                  onPressed: () {
                    model.navigateToSignIn();
                  },
                ),
              ],
            )
          ),
      ),
    );
  }
}
