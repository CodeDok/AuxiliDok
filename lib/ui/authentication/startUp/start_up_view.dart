import 'package:auxilidok/ui/authentication/startUp/start_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StreamStartUpViewModel>.reactive(
      viewModelBuilder: () => StreamStartUpViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator()
          )
        ),
      )
    );
  }
}
