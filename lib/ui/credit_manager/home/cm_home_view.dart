import 'package:auxilidok/ui/credit_manager/overview/cm_overview_view.dart';
import 'package:auxilidok/ui/smart_widgets/credit_manager/cm_custom_drawer.dart';
import 'package:flutter/material.dart';

class CMHomeView extends StatefulWidget {



  @override
  _CMHomeViewState createState() => _CMHomeViewState();
}

class _CMHomeViewState extends State<CMHomeView> {

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // CMCustomDrawer(height: mediaQuery.size.height,),
            // CMOverviewView(),
            Container(
              width: mediaQuery.size.width*0.13,
              height: mediaQuery.size.height,
              child: CMCustomDrawer(),
            ),
            Expanded(
              child: CMOverviewView(),
            )
          ],
        )
      ),
    );
  }
}