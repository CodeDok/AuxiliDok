import 'package:auxilidok/ui/credit_manager/overview/cm_overview_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CMOverviewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CMOverviewViewModel>.reactive(
      viewModelBuilder: () => CMOverviewViewModel(),
      builder: (context, model, child) => Container(
        color: Colors.red,
        child: Column(
          children: [
            Container(
              // wie viel insgesamt noch beglichen werden muss
            ),
            Container(
              // Wann die nächste Rate beglichen wird
            ),
            Container(
              // Wer einem was noch zurückzahlen muss
            ),
            FlatButton.icon(
              onPressed: () {
                model.retrieve();
              }, 
              icon: Icon(Icons.get_app), 
              label: Text('get credits')
            ),
            FlatButton.icon(
              onPressed: () {
                model.add();
              }, 
              icon: Icon(Icons.file_upload), 
              label: Text('add credits')
            )
          ],
        )
      ),
    );
  }
}