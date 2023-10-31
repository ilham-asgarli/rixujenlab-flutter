import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'RixujenLab'**
  String get appName;

  /// No description provided for @notFoundNavigation.
  ///
  /// In en, this message translates to:
  /// **'403'**
  String get notFoundNavigation;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'You don\'\'t have internet connection.'**
  String get noInternet;

  /// No description provided for @mainMenuSkinTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn your skin type'**
  String get mainMenuSkinTypeTitle;

  /// No description provided for @mainMenuSkinTypeDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn your skin type to understand how to treat it'**
  String get mainMenuSkinTypeDescription;

  /// No description provided for @mainMenuDictionaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Skincare dictionary'**
  String get mainMenuDictionaryTitle;

  /// No description provided for @mainMenuDictionaryDescription.
  ///
  /// In en, this message translates to:
  /// **'Find the ingredients in the product'**
  String get mainMenuDictionaryDescription;

  /// No description provided for @mainMenuTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Skincare tips'**
  String get mainMenuTipsTitle;

  /// No description provided for @mainMenuTipsDescription.
  ///
  /// In en, this message translates to:
  /// **'Valuble tips for your skin'**
  String get mainMenuTipsDescription;

  /// No description provided for @mainMenuRoutineTitle.
  ///
  /// In en, this message translates to:
  /// **'What is skincare routine?'**
  String get mainMenuRoutineTitle;

  /// No description provided for @mainMenuRoutineDescription.
  ///
  /// In en, this message translates to:
  /// **'Sort the products correctly'**
  String get mainMenuRoutineDescription;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Enter your information'**
  String get signUp;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get userName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get signIn;

  /// No description provided for @skincare.
  ///
  /// In en, this message translates to:
  /// **'SKINCARE'**
  String get skincare;

  /// No description provided for @routines.
  ///
  /// In en, this message translates to:
  /// **'Routines'**
  String get routines;

  /// No description provided for @steps.
  ///
  /// In en, this message translates to:
  /// **'steps'**
  String get steps;

  /// No description provided for @routinesStepCleanserTitle.
  ///
  /// In en, this message translates to:
  /// **'Cleanser'**
  String get routinesStepCleanserTitle;

  /// No description provided for @routinesStepCleanserDescription.
  ///
  /// In en, this message translates to:
  /// **'Wash your face twice (day&night) a day.'**
  String get routinesStepCleanserDescription;

  /// No description provided for @routinesStepTonerTitle.
  ///
  /// In en, this message translates to:
  /// **'Toner'**
  String get routinesStepTonerTitle;

  /// No description provided for @routinesStepTonerDescription.
  ///
  /// In en, this message translates to:
  /// **'Apply to cleansed skin.'**
  String get routinesStepTonerDescription;

  /// No description provided for @routinesStepFaceSerumTitle.
  ///
  /// In en, this message translates to:
  /// **'FaceSerum'**
  String get routinesStepFaceSerumTitle;

  /// No description provided for @routinesStepFaceSerumDescription.
  ///
  /// In en, this message translates to:
  /// **'Apply with upward movements'**
  String get routinesStepFaceSerumDescription;

  /// No description provided for @routinesStepMoisturizerTitle.
  ///
  /// In en, this message translates to:
  /// **'Moisturizer'**
  String get routinesStepMoisturizerTitle;

  /// No description provided for @routinesStepMoisturizerDescription.
  ///
  /// In en, this message translates to:
  /// **'Apply it all over your skin with your fingertips.'**
  String get routinesStepMoisturizerDescription;

  /// No description provided for @routinesStepEyeCreamTitle.
  ///
  /// In en, this message translates to:
  /// **'Eye Cream'**
  String get routinesStepEyeCreamTitle;

  /// No description provided for @routinesStepEyeCreamDescription.
  ///
  /// In en, this message translates to:
  /// **'Apply with your ring fingers.'**
  String get routinesStepEyeCreamDescription;

  /// No description provided for @routinesStepSunscreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Sunscreen'**
  String get routinesStepSunscreenTitle;

  /// No description provided for @routinesStepSunscreenDescription.
  ///
  /// In en, this message translates to:
  /// **'Apply every day 15 minutes before going out.'**
  String get routinesStepSunscreenDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
