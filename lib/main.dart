import 'package:flutter/material.dart';


import 'locator.dart';
import 'services/navigation_service.dart';
import 'ui/router.dart' as router;
import 'ui/views/start_up_view.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compound',
      // builder: (context, child) => Navigator(
      //   key: locator<DialogService>().dialogNavigationKey,
      //   onGenerateRoute: (settings) => MaterialPageRoute(
      //       builder: (context) => DialogManager(child: child)),
      // ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 9, 202, 172),
        backgroundColor: Color.fromARGB(255, 26, 27, 30),
        textTheme: Theme.of(context).textTheme.apply(
            ),
      ),
      home: StartUpView(),
      onGenerateRoute: router.generateRoute,
    );
  }
}
