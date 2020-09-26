import 'package:animations/animations.dart';
import 'package:auxilidok/ui/start/custom_navigation_bar.dart';
import 'package:auxilidok/ui/start/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, widget) => CustomScaffold(
        body: PageTransitionSwitcher(
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
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: model.currentIndex,
          setIndex: model.setIndex,
        ),
      )
    );
  }
}

