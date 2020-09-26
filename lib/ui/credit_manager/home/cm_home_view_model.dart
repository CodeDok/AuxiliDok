import 'package:auxilidok/ui/credit_manager/archive/cm_archive_view.dart';
import 'package:auxilidok/ui/credit_manager/overview/cm_overview_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CMHomeViewModel extends IndexTrackingViewModel {
  
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return CMOverviewView();
        break;
      case 1:
        return CMArchiveView();
        break;
      default:
        return CMOverviewView();
    }
  }
}