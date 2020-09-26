
import 'package:auxilidok/app/enums.dart';
import 'package:auxilidok/models/credit_manager/credit.dart';
import 'package:auxilidok/models/user.dart';
import 'package:auxilidok/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../models/credit_manager/debtor.dart';
import '../../../models/credit_manager/repayment.dart';
import '../../../services/credit_manager_service.dart';

class CMOverviewViewModel extends ReactiveViewModel {
  final CreditManagerService _creditManagerService = locator<CreditManagerService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_creditManagerService];
  
  List<Credit> _creditList;
  Credit _highestRemainingDept;


  List<Credit> get credit => _creditList;
  Credit get highestRemainingDept => _highestRemainingDept;
  double get outstandingBalance => _creditManagerService.getTotalOutStandingBalance;
  String get userProfilePicture => _authenticationService.currentUser.profilePictureUrl;
  User get getUser => _authenticationService.currentUser;

  CMOverviewViewModel() {
    _creditManagerService.addListener(init);
  }

  void init(){
    setBusy(true);
    if(!_creditManagerService.isInitialized) {
      _creditManagerService.initStream();
      _creditManagerService.setInitialization = true;
    }
    if(_creditManagerService.creditList != null && _creditManagerService.creditList.isNotEmpty) {
      print('isFilled');
      _creditList = _creditManagerService.creditList; 
      _getHighestDept();
      notifyListeners();
    }
    setBusy(false);
  }

  void _getHighestDept() {
    List<Credit> destructionFree = credit.where((credit) => credit.archived == false).toList();
    destructionFree.sort((creditOne, creditTwo) {
      double remainingOne = creditOne.loanedAmount;
      double remainingTwo = creditTwo.loanedAmount;
      creditOne.repayments.forEach((repayment) {
        remainingOne -= repayment.amount;
      });
      creditTwo.repayments.forEach((repayment) {
        remainingTwo -= repayment.amount;
      });
      return remainingTwo.compareTo(remainingOne);
    });
    _highestRemainingDept = destructionFree.first;
  }
 

  void addCredit() {
    _creditManagerService.addCredit(
      archived: false,
      currency: 'Euro',
      debtors: [Debtor(name: 'John'), Debtor(name: 'Marius')],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      interestInterval: creditManagerInterval.weekly.interval,
      interestPercentage: 12,
      loanedAmount: 200,
      name: 'Auto',
      repayments: [Repayment(amount: 10, date: DateTime.now())]
    );
  }

  



}