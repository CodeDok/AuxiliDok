import 'package:auxilidok/helper/constants.dart';
import 'package:auxilidok/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class CustomNavigationBar extends StatefulWidget {
  int currentIndex;
  Function setIndex;

  CustomNavigationBar({this.currentIndex, this.setIndex});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  NavigationService _navigationService = locator<NavigationService>();

  void onTapped(int index) {
    switch (index) {
      case 0:
        _navigationService.navigateToNamed(home);
        break;
      case 1:
        _navigationService.navigateToNamed(profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: customPurple,
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text(
              'Profile',
            ),
          ),
        ],
        currentIndex: widget.currentIndex != null ? widget.currentIndex : null,
        selectedItemColor: widget.currentIndex != null ? Colors.white : null,
        onTap: widget.setIndex != null ? widget.setIndex : onTapped ,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
