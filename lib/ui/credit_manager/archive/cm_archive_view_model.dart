import 'package:auxilidok/app/locator.dart';
import 'package:auxilidok/models/credit_manager/credit.dart';
import 'package:auxilidok/services/credit_manager_service.dart';
import 'package:stacked/stacked.dart';

class ArchiveViewModel extends ReactiveViewModel{
  CreditManagerService _creditManagerService = locator.get(instanceName: 'CreditManager');

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_creditManagerService];
  List<Credit> _creditList;
  List<Credit> get creditList => _creditList; 

   ArchiveViewModel() {
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
}