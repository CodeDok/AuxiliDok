import 'package:auxilidok/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, widget) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(50),
                child: Container(
                  child: Center(
                    child: Text('Home')
                  ),
                ) 
              ),
              FloatingActionButton(
                child: Icon(Icons.exit_to_app),
                onPressed: () {
                  model.logout();
                },
              )
            ],
          ),
        ),
      ),
    ); 
  }
}
