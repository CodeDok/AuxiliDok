import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../models/credit_manager/credit.dart';
import '../models/credit_manager/debtor.dart';
import '../models/credit_manager/repayment.dart';
import 'authentication_service.dart';
import 'firestore_service.dart';

class CreditManagerService with ReactiveServiceMixin{
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  RxList<Credit> _creditList = RxList<Credit>();
  List<Credit> get creditList => _creditList;
  bool _isInitialized = false;

  double _totalOutstandingBalance;
  double get getTotalOutStandingBalance => _totalOutstandingBalance;
  bool get isInitialized => _isInitialized;
  set setInitialization(bool init) {_isInitialized = init;}

  Future<void> initStream() async {
    await for (List<Credit> credits in _firestoreService.listenToCredits(_authenticationService.currentUser.id)) {
      _creditList.clear();
      _creditList.addAll(credits);
      // print('initStream ${_creditList}');
      _calculateTotalOutstandingBalance();
      notifyListeners();
    }
  }

  Future<void> addCredit({
    String interestInterval,
    int interestPercentage,
    List<Debtor> debtors,
    double loanedAmount,
    String currency,
    String name,
    List<Repayment> repayments,
    DateTime startDate,
    DateTime endDate,
    bool archived,
  }) async {
    await _firestoreService.addCredit(_authenticationService.currentUser.id, Credit(
      name: name,
      loanedAmount: loanedAmount,
      currency: currency,
      repayments: repayments,
      debtors: debtors,
      interestInterval: interestInterval,
      interestPercentage: interestPercentage,
      startDate: startDate,
      endDate: endDate,
      archived: archived,
    ));
  }

  void _calculateTotalOutstandingBalance() {
    double _outstandingBalance = 0;
    _totalOutstandingBalance = 0;
    _creditList.forEach((credit) {
      double _remainingBalance = credit.loanedAmount;
      credit.repayments.forEach((repayment) {
        _remainingBalance -= repayment.amount;
      });
      _outstandingBalance += _remainingBalance;
    });
    _totalOutstandingBalance = _outstandingBalance;
  }


}
  
