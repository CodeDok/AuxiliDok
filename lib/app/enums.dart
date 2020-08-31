
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
