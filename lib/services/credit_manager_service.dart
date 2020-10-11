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
  Credit _highestRemainingDept;
  DateTime _nextRepaymentDate;
  Credit _nextRepayment;
  bool _isInitialized = false;

  double _totalOutstandingBalance;
  DateTime get nextRepaymentDate => _nextRepaymentDate;
  Credit get nextRepayment => _nextRepayment;
  double get getTotalOutStandingBalance => _totalOutstandingBalance;
  Credit get highestRemainingDept => _highestRemainingDept;
  bool get isInitialized => _isInitialized;
  set creditList(List<Credit> credits) {_creditList = credits;}
  set setInitialization(bool init) {_isInitialized = init;}


  Future<CreditManagerService> initStream() async {
    locator<FirestoreService>().listenToCredits(locator<AuthenticationService>().currentUser.id).listen((credits) {
      creditList.clear();
      creditList.addAll(credits);
      if(creditList != null && creditList.isNotEmpty) {
        _calculateTotalOutstandingBalance();
        _getHighestDept();
        _getUpcommingCreditRepayments();
        setInitialization = true;
      }
      notifyListeners();
    });
    return this;
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

  void _getHighestDept() {
    List<Credit> activeCredits = _creditList.where((credit) => credit.archived == false).toList();
    activeCredits.sort((creditOne, creditTwo) {
      double remainingOne = creditOne.repayableAmount() - creditOne.repaymentTotal();
      double remainingTwo = creditTwo.repayableAmount() - creditTwo.repaymentTotal();
      // creditOne.repayments.forEach((repayment) {
      //   remainingOne -= repayment.amount;
      // });
      // creditTwo.repayments.forEach((repayment) {
      //   remainingTwo -= repayment.amount;
      // });
      return remainingTwo.compareTo(remainingOne);
    });
    _highestRemainingDept = activeCredits.first;
  }
 
  void _getUpcommingCreditRepayments() {
    List<Credit> activeCredits = _creditList.where((credit) => credit.archived == false).toList();
    Credit resultCredit;
    DateTime earliestRepaymentDate = DateTime(10000);
    activeCredits.forEach((credit){
      DateTime nextRepayment;
      var interval = Credit.getInterval(credit.interestInterval);
      
      DateTime date = credit.startDate;
      while(date.isBefore(credit.endDate)) {
        date = date.add(Duration(days: interval));
        nextRepayment = date;
      }
      if(nextRepayment.isBefore(earliestRepaymentDate)) {
        earliestRepaymentDate = nextRepayment;
        resultCredit = credit;
      }
    });
    _nextRepayment = resultCredit;
    _nextRepaymentDate = earliestRepaymentDate;
  }


}
  
