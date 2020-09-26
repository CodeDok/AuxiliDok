library constants;

import 'dart:ui';

import 'package:flutter/material.dart';

// Folders | Images
// Firestore
const String userProfilePictureFolder = 'user_image/profile_pictures';
const String userWelcomePictureFolder = 'user_image/welcome_pictures';
const String userBannerFolder = 'user_image/banner_pictures';
const String creditManagerCollection = 'credit_manager';
const String defaultFirestoreProfilePicture = 'https://firebasestorage.googleapis.com/v0/b/auxilidok.appspot.com/o/user_image%2Fprofile_pictures%2Fdefault_profile_image.png?alt=media&token=3bd56c82-e41e-4089-93b7-912cac291712';
// Local
const String defaultUserProfilePicture = 'assets/images/default_profile_image.png';



// Model Attributes
// Attributes User
const String email = 'E-Mail';
const String password = 'Password';
const String userrole = 'User Role';
const String username = 'Username';
const String userrole_admin = 'Admin';
const String userrole_normal = 'Normal';



// Start ---------------------------------------------------------------------->
// Start Routes
const String startUpScreen = '/';
const String signIn = '/signIn';
const String signUp = '/signUp';
const String home = '/home';
const String profile = '/profile';
// Custom Colors Start
const Color start_primaryColor = Color.fromARGB(255, 20, 116, 143);
const Color start_darkPrimaryColor = Color.fromARGB(255, 11, 60, 73);
const Color start_customPurple = Color.fromARGB(255, 134, 22, 87);
const Color start_customLightBlue = Color.fromARGB(255, 67, 146, 241);
const Color start_customGrey = Color.fromARGB(255, 112, 112, 112);
const Color start_customChromeYellow = Color.fromARGB(255, 250, 169, 22);
const Color start_customChromeYellow_m25 = Color.fromARGB(255, 199, 131, 4);
const Color start_customChromeYellow_p25 = Color.fromARGB(255,251, 161, 79);
// Gradient Start 
const Gradient tLeftbRight_bluePurple = LinearGradient(
  stops: [0.4,0.8],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [start_darkPrimaryColor, start_customPurple]
);
const Gradient tLeftbRight_purpleBlue = LinearGradient(
  stops: [0.4,0.8],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [start_customPurple, start_darkPrimaryColor]
);


// Credit Manager ------------------------------------------------------------->
// Credit Manager Routes
const String cmHome = '/cm';
const String cmOverview = '/cm/overview';
// Custom Colors Credit Manager
const Color cm_primaryColor = Color.fromARGB(255, 188, 237, 9);
const Color cm_primaryColor2 = Color.fromARGB(255, 191, 233, 35);
const Color cm_accentColor = Color.fromARGB(255, 122, 48, 108);
// Gradient Credit Manager
const Gradient tMidbMid_blueCyan = LinearGradient(
  stops: [0.4,0.8],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [cm_primaryColor, cm_accentColor]
);
// Model Attributes
const String cm_daily = 'Täglich';
const String cm_weekly = 'Wöchentlich';
const String cm_monthly = 'Monatlich';
const String cm_yearly = 'Jährlich';
