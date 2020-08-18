import 'package:auxilidok/ui/widgets/busy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/constants.dart' as constant;
import '../../../viewmodels/authentication/signup_view_model.dart';
import '../../widgets/textFormWidget.dart';
import '../../widgets/user_image_picker.dart';

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
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormWidget(
                          attributeAndLabel: constant.email,
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.local_post_office,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormWidget(
                            attributeAndLabel: constant.password, 
                            obTxt: true,
                            icon: Icons.vpn_key,
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
