
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

// enum authenticationType {
//   SignIn,
//   SignUp,
// }
// extension authenticationTypeExtension on authenticationType {
  
//   static const types = {
//     authenticationType.SignIn : 'Sign In',
//     authenticationType.SignUp : 'Sign up'
//   };
//   String get type => types[this];
// }

// // Sign In
// enum authenticationSignIn {
//   SignInWithEmailAndPassword,

// }
// extension authenticationSignInExtension on authenticationSignIn {

//   static const typesName = {
//     authenticationSignIn.SignInWithEmailAndPassword : 'Sign In (Email and Password)',
//   };
//   String get name => typesName[this];

//   static const typesRoutes = {
//     authenticationSignIn.SignInWithEmailAndPassword : signInWithEmailAndPassword,
//   };
//   String get route => typesRoutes[this];
// }

// // Sign Up
// enum authenticationSignUp {
//   SignUpWithEmailAndPassword,
// }
// extension authenticationSignUpExtension on authenticationSignUp {

//   static const typesName = {
//     authenticationSignUp.SignUpWithEmailAndPassword : 'Sign Up (Email and Password)'
//   };
//   String get name => typesName[this];

//   static const typesRoutes = {
//     authenticationSignUp.SignUpWithEmailAndPassword : signUpWithEmailAndPassword,
//   };
//   String get route => typesRoutes[this];
// }