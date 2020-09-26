import 'package:auxilidok/app/constants.dart';
import 'package:auxilidok/ui/credit_manager/overview/cm_overview_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CMOverviewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<CMOverviewViewModel>.reactive(
      viewModelBuilder: () => CMOverviewViewModel(),
      onModelReady: (model) =>  model.init(),
      builder: (context, model, child) => 
      model.isBusy ?
      Center(child: CircularProgressIndicator())
      : Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              child: Text('Übersicht'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // wie viel insgesamt noch beglichen werden muss
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('Offener Betrag:'),
                            Text(model.outstandingBalance.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            Text(model.highestRemainingDept != null ? model.highestRemainingDept.loanedAmount.toString() : 0.toString()),
                            Text(model.highestRemainingDept != null ? model.highestRemainingDept.name : 'No Name'),
                          ]
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.symmetric(vertical: 50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child: ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.grey,
                      ),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(model.userProfilePicture != null ? model.userProfilePicture : defaultFirestoreProfilePicture),
                      ),
                    ),
                  ),
                ),
                Container(
                  // Wann die nächste Rate beglichen wird
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Fälligkeitsdatum'),
                          Text('Betrag'),
                          Text('Person')
                        ],
                      ),
                      ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.green
                          ),
                          child: Text('Von wie viel')  
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    model.addCredit();
                  },
                )
                // Container(
                //   // Wer einem was noch zurückzahlen muss
                // ),
                
              ],
            ),
          ],
        )
      ),
    );
  }
}