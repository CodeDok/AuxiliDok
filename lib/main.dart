import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'locator.dart';
import 'services/navigation_service.dart';
import 'helper/router.dart' as router;
import 'ui/views/authentication/start_up_view.dart';

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
        primaryColor: Color.fromARGB(255, 20, 116, 143),
        accentColor: Color.fromARGB(255, 250, 169, 22),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
