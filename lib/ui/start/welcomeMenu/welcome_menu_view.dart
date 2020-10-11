import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'welcome_menu_view_model.dart';

class WelcomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeMenuViewModel>.reactive(
      viewModelBuilder: () => WelcomeMenuViewModel(),
      builder: (context, model, child) => model.isBusy ?
      Center(
        child: CircularProgressIndicator()
      )
      :Center(
        child: Column(
          children: [
            FlatButton.icon(
              icon: Icon(Icons.library_books), 
              label: Text('Credit Manager'),
              onPressed: model.navigateToCM, 
            ),
            FlatButton.icon(
              icon: Icon(Icons.exit_to_app), 
              label: Text('Log out'),
              onPressed: model.logout, 
            ),
          ],
        ),
      ),
    );
  }
}
