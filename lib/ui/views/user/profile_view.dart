import 'package:auxilidok/viewmodels/user/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';


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