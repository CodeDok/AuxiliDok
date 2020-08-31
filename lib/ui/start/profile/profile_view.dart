import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import 'profile_view_model.dart';


class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FutureProfileViewModel>.reactive(
      viewModelBuilder: () => locator<FutureProfileViewModel>(),
      disposeViewModel: false,
      fireOnModelReadyOnce: true,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, widget) => Center(
        child: model.isBusy
              ? CircularProgressIndicator()
              : Text(model.data.id),
      )
    );
  }
}