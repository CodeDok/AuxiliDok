import 'package:animations/animations.dart';
import 'package:auxilidok/ui/credit_manager/home/cm_home_view_model.dart';
import 'package:auxilidok/ui/credit_manager/overview/cm_overview_view.dart';
import 'package:auxilidok/ui/smart_widgets/credit_manager/cm_custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CMHomeView extends StatefulWidget {



  @override
  _CMHomeViewState createState() => _CMHomeViewState();
}

class _CMHomeViewState extends State<CMHomeView> {

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CMHomeViewModel(),
      builder: (context, model, child) => 
      SafeArea(
        child: Scaffold(
          body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: mediaQuery.size.width*0.13,
                height: mediaQuery.size.height,
                child: CMCustomDrawer(model.setIndex),
              ),
              Container(
                width: mediaQuery.size.width*0.87,
                child: PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) {
                    return SharedAxisTransition(
                      child: child,
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                    );
                  },
                  child: model.getViewForIndex(model.currentIndex)
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}