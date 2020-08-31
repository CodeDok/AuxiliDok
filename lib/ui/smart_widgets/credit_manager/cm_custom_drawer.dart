import 'package:auxilidok/app/constants.dart' as constants;
import 'package:flutter/material.dart';

class CMCustomDrawer extends StatefulWidget {
  final double height;
  bool expanded;

  CMCustomDrawer({
    this.height,
    this.expanded = false,
  });

  @override
  _CMCustomDrawerState createState() => _CMCustomDrawerState();
}

class _CMCustomDrawerState extends State<CMCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 120),
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
          topRight: Radius.circular(80),
        ),
        color: constants.cm_primaryColor2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.view_list, color: Colors.white),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.archive, color: Colors.white),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              
            },
          ),
        ],
      ),
    );
  }
}