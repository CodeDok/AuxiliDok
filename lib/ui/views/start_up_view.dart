import 'package:auxilidok/viewmodels/start_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
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
