import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CMArchiveView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: null,
      builder: (context, model, child) => Container(
        child: Text('Archive')
      ), 
    );
  }
}