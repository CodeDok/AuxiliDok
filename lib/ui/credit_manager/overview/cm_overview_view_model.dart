import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../app/enums.dart';
import '../../../app/locator.dart';
import '../../../models/credit_manager/credit.dart';
import '../../../models/credit_manager/debtor.dart';
import '../../../models/credit_manager/repayment.dart';
import '../../../models/user.dart';
import '../../../services/authentication_service.dart';
import '../../../services/credit_manager_service.dart';

class CMOverviewViewModel extends ReactiveViewModel {
  final CreditManagerService _creditManagerService = locator.get(instanceName: 'CreditManager');
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_creditManagerService];
  
  List<Credit> _creditList;
  


  List<Credit> get credit => _creditList;
  Credit get highestRemainingDept => _creditManagerService.highestRemainingDept;
  double get outstandingBalance => _creditManagerService.getTotalOutStandingBalance;
  String get userProfilePicture => _authenticationService.currentUser.profilePictureUrl;
  String get nextRepaymentDate {
    final pattern = DateFormat('d.M.y');
    return _creditManagerService.nextRepaymentDate != null ? pattern.format(_creditManagerService.nextRepaymentDate) : pattern.format(DateTime.now());
  }
  String get nextRepaymentDebtors {
    String debtors = '';
    if(_creditManagerService.nextRepayment != null) {
      for(int i = 0; i < _creditManagerService.nextRepayment.debtors.length; i++) {
        debtors += ' ${_creditManagerService.nextRepayment.debtors[i].name} ';
        if(i<_creditManagerService.nextRepayment.debtors.length-1) debtors += '|';
      }
    }
    return debtors;
  }
  String get nextRepaymentAmount {
    if(_creditManagerService.nextRepayment == null) return '';
    Credit nextRepayment = _creditManagerService.nextRepayment;
    int interval = Credit.getInterval(nextRepayment.interestInterval);
    int intervalsLeft = 1;
    DateTime tempDate = nextRepayment.startDate;
    while(tempDate.add(Duration(days: interval)).isBefore(nextRepayment.endDate)) {
      tempDate = tempDate.add(Duration(days: interval));
      intervalsLeft++;
    }
    double paidAmount = 0;
    for(int i = 0; i < nextRepayment.repayments.length; i++) {
      paidAmount += nextRepayment.repayments[i].amount;
    }
    return ((nextRepayment.repayableAmount() - paidAmount) / intervalsLeft).toStringAsFixed(2);
  }
  double get nextRepaymentFulfillmentFraction => _creditManagerService.nextRepayment.fulfillmentFraction();
  User get getUser => _authenticationService.currentUser;

  CMOverviewViewModel() {
    _creditManagerService.addListener(init);
  }

  void init(){
    setBusy(true);
    if(_creditManagerService.creditList != null && _creditManagerService.creditList.isNotEmpty && _creditManagerService.isInitialized) {
      _creditList = _creditManagerService.creditList; 
      notifyListeners();
    }
    setBusy(false);
  }

  @override
  void dispose() {
    print('weg bin ich');
    super.dispose();
  }

  void addCredit() {
    _creditManagerService.addCredit(
      archived: false,
      currency: 'Euro',
      debtors: [Debtor(name: 'John'), Debtor(name: 'Marius')],
      endDate: DateTime(2020,10,30),
      startDate: DateTime.now(),
      interestInterval: creditManagerInterval.weekly.interval,
      interestPercentage: 12,
      loanedAmount: 200,
      name: 'Auto',
      repayments: [Repayment(amount: 10, date: DateTime.now())]
    );
  }

}