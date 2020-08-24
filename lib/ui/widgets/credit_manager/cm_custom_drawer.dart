import 'package:flutter/material.dart';

class CmCustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            // Overview
            // Summary + Filter (active)
            // Archive
            // Settings
          ],
        )
      )
    );
  }
}