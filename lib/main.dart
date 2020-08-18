import 'package:firebase_core/firebase_core.dart';
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
      title: 'AuxiliDok',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 9, 202, 172),
        backgroundColor: Color.fromARGB(255, 26, 27, 30),
        textTheme: Theme.of(context).textTheme.apply(
            ),
      ),
      home: FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text('Test');
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return StartUpView();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return CircularProgressIndicator();
        },
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
