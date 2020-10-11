import 'package:auxilidok/models/credit_manager/credit.dart';
import 'package:auxilidok/ui/dumb_widgets/credit_manager/level_indicator.dart';
import 'package:flutter/material.dart';

class CreditTile extends StatelessWidget {
  final Credit credit;
  CreditTile({
    this.credit
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.black)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LevelIndicator(fraction: credit.fulfillmentFraction(), size: 80),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${credit.repaymentTotal()}'),
                Text('von'),
                Text('${credit.repayableAmount()}')
              ],
            ),
            // Flexible(
            //   child: ListView(
            //     children: [
            //       ...credit.debtors.map((debtor) => Text(debtor.name))
            //     ],
            //   ),
            // )
          ],
        )
      ) 
    );
  }
}