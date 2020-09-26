
import 'constants.dart';

enum userRole {
  Normal,
  Admin,
}
extension userRoleExtension on userRole {

  static const roles = {
    userRole.Normal : userrole_normal,
    userRole.Admin : userrole_admin,
  };

  String get role => roles[this];
}

enum creditManagerInterval {
  weekly,
  monthly,
  yearly,
  daily,
}
extension creditManagerIntervalExtension on creditManagerInterval {
  static const intervals = {
    creditManagerInterval.daily : cm_daily,
    creditManagerInterval.weekly : cm_weekly,
    creditManagerInterval.monthly : cm_monthly,
    creditManagerInterval.yearly : cm_yearly,
  };
  String get interval => intervals[this];
}