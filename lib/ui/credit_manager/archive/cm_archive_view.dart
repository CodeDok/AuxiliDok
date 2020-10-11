import 'package:auxilidok/ui/credit_manager/archive/cm_archive_view_model.dart';
import 'package:auxilidok/ui/dumb_widgets/credit_manager/credit_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CMArchiveView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ArchiveViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Container(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text('Search / Filter')
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: model.creditList.length,
                itemBuilder: (context, index) => CreditTile(
                  credit: model.creditList[index]
                ),
              ),
            )
          ],
        )
      ), 
    );
  }
}