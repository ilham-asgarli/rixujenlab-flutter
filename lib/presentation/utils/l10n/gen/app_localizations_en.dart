import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'RixujenLab';

  @override
  String get notFoundNavigation => '403';

  @override
  String get noInternet => 'You don\'t have internet connection.';

  @override
  String get mainMenuSkinTypeTitle => 'Learn your skin type';

  @override
  String get mainMenuSkinTypeDescription => 'Learn your skin type to understand how to treat it';

  @override
  String get mainMenuDictionaryTitle => 'Skincare dictionary';

  @override
  String get mainMenuDictionaryDescription => 'Find the ingredients in the product';

  @override
  String get mainMenuTipsTitle => 'Skincare tips';

  @override
  String get mainMenuTipsDescription => 'Valuble tips for your skin';

  @override
  String get mainMenuRoutineTitle => 'What is skincare routine?';

  @override
  String get mainMenuRoutineDescription => 'Sort the products correctly';

  @override
  String get signUp => 'Enter your information';

  @override
  String get fullName => 'Full Name';

  @override
  String get userName => 'Username';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Log in';

  @override
  String get skincare => 'SKINCARE';

  @override
  String get routines => 'Routines';

  @override
  String get steps => 'steps';

  @override
  String get routinesStepCleanserTitle => 'Cleanser';

  @override
  String get routinesStepCleanserDescription => 'Wash your face twice (day&night) a day.';

  @override
  String get routinesStepTonerTitle => 'Toner';

  @override
  String get routinesStepTonerDescription => 'Apply to cleansed skin.';

  @override
  String get routinesStepFaceSerumTitle => 'FaceSerum';

  @override
  String get routinesStepFaceSerumDescription => 'Apply with upward movements';

  @override
  String get routinesStepMoisturizerTitle => 'Moisturizer';

  @override
  String get routinesStepMoisturizerDescription => 'Apply it all over your skin with your fingertips.';

  @override
  String get routinesStepEyeCreamTitle => 'Eye Cream';

  @override
  String get routinesStepEyeCreamDescription => 'Apply with your ring fingers.';

  @override
  String get routinesStepSunscreenTitle => 'Sunscreen';

  @override
  String get routinesStepSunscreenDescription => 'Apply every day 15 minutes before going out.';
}
