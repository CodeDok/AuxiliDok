import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../helper/constants.dart' as constant;
import '../../../viewmodels/authentication/signup_view_model.dart';
import '../../widgets/mini_helper/busy_button.dart';
import '../../widgets/mini_helper/textFormWidget.dart';
import '../../widgets/mini_helper/user_image_picker.dart';

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
        body: Center(
          child: Container(
            height: mediaQuery.size.height*0.6,
            width: mediaQuery.size.width*0.9,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UserImagePicker(model.selectImage),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormWidget(
                          attributeAndLabel: constant.username,
                          icon: Icons.person,
                          validation: [
                            FormBuilderValidators.minLength(3, errorText: 'Must be greater than 3 characters!'),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormWidget(
                          attributeAndLabel: constant.email,
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.local_post_office,
                          validation: [
                            FormBuilderValidators.email(errorText: 'Enter a valid email format'),
                            FormBuilderValidators.minLength(5, errorText: 'Must be greater than 5 characters!')
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormWidget(
                            attributeAndLabel: constant.password, 
                            obTxt: true,
                            icon: Icons.vpn_key,
                            validation: [
                              FormBuilderValidators.minLength(6, errorText: 'Must be greater than 6 characters!'),
                            ],
                        ),
                        BusyButton(
                          title: 'Sign up',
                          busy: model.anyObjectsBusy,
                          onPressed: () {
                            model.handleSignUp(_formKey);
                          },
                        ),
                        FlatButton(
                          child: Text('Sign in with an existing Account'),
                          onPressed: () {
                            model.navigateToSignIn();
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
