
import 'package:auxilidok/app/locator.dart';
import 'package:auxilidok/services/credit_manager_service.dart';
import 'package:stacked/stacked.dart';

class CMOverviewViewModel extends BaseViewModel {
  final CreditManagerService _creditManagerService = locator<CreditManagerService>();

  void retrieve() {
    _creditManagerService.retrieveCredits();
  }

  void add() {
    _creditManagerService.addCredit();
  }
}