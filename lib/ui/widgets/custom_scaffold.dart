import 'package:auxilidok/helper/constants.dart';
import 'package:flutter/material.dart';


class CustomScaffold extends StatelessWidget {
  Widget body;
  Widget bottomNavigationBar;
  bool resizeToAvoidBottomInsetBool;

  CustomScaffold({
    this.body, 
    this.resizeToAvoidBottomInsetBool = false,
    this.bottomNavigationBar,
  });


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInsetBool,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Theme.of(context).primaryColor, customPurple]
                )
              ),
              child: Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: customLightBlue, width: 2),
                ),
                child: body,
              ),
            ),
            if(bottomNavigationBar != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: bottomNavigationBar,
            )
          ]
        ),
      ),
    );
  }
}