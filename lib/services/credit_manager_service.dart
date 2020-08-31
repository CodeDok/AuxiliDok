import 'package:auxilidok/app/locator.dart';
import 'package:auxilidok/models/credit.dart';
import 'package:auxilidok/services/authentication_service.dart';
import 'package:auxilidok/services/firestore_service.dart';

class CreditManagerService {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  List<Credit> _credits;
  List<Credit> get credits => _credits; 

  Future<void> retrieveCredits() async {
    _firestoreService.getCredits(_authenticationService.currentUser.id);
  }

  Future<void> addCredit() async {
    var credit = Credit(
      debtors: ['test', 'test2'],
      loanedAmount: 12,
      name: "Test",
      currency: "Euro",
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      repayments: {DateTime.now().toIso8601String() : 12},
      interestPercentage: 12
    );
    _firestoreService.addCredit(_authenticationService.currentUser.id, credit);
  }

}