import 'package:auxilidok/app/constants.dart' as constants;
import 'package:flutter/material.dart';



class AuthenticationInputField extends StatelessWidget {

  final Widget textInputField;
  final String label;

  AuthenticationInputField({
    @required this.textInputField,
    @required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: [
          Container(
            height: 50,
            width: 260,
            margin: EdgeInsets.only(bottom: 7),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: constants.start_customGrey,
                width: 2,
              ),
              color: Colors.white.withOpacity(0.69)
            ),
          ),
          Positioned(
            top: -11,
            left: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: constants.start_customChromeYellow_m25.withOpacity(0.85), width: 2),
                borderRadius: BorderRadius.circular(40),
                color: constants.start_customChromeYellow.withOpacity(0.9)
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ),
          Positioned(
            top: 0,
            height: 50,
            width: 225,
            child: textInputField
          )
        ],
      ),
    );
  }
}