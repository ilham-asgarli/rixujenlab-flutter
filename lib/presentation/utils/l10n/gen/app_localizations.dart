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

  /// No description provided for @lab.
  ///
  /// In en, this message translates to:
  /// **'Lab'**
  String get lab;

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
  /// **'Valuable tips for your skin'**
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

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your information'**
  String get signUpTitle;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get signInTitle;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @guess.
  ///
  /// In en, this message translates to:
  /// **'Guess'**
  String get guess;

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

  /// No description provided for @continue_.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_;

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

  /// No description provided for @skincareDictionaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Skincare'**
  String get skincareDictionaryTitle;

  /// No description provided for @skincareDictionaryDescription.
  ///
  /// In en, this message translates to:
  /// **'Dictionary'**
  String get skincareDictionaryDescription;

  /// No description provided for @skincareDictionaryPhoto.
  ///
  /// In en, this message translates to:
  /// **'TAKE A PHOTO'**
  String get skincareDictionaryPhoto;

  /// No description provided for @skincareDictionaryUpload.
  ///
  /// In en, this message translates to:
  /// **'UPLOAD PHOTO'**
  String get skincareDictionaryUpload;

  /// No description provided for @skin.
  ///
  /// In en, this message translates to:
  /// **'Skin'**
  String get skin;

  /// No description provided for @careTips.
  ///
  /// In en, this message translates to:
  /// **'Care Tips'**
  String get careTips;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'READ MORE'**
  String get readMore;

  /// No description provided for @shortSkinCareTip1.
  ///
  /// In en, this message translates to:
  /// **'Avoid products with artificial colorants and synthetic fragrances'**
  String get shortSkinCareTip1;

  /// No description provided for @shortSkinCareTip2.
  ///
  /// In en, this message translates to:
  /// **'Hydrate your skin'**
  String get shortSkinCareTip2;

  /// No description provided for @shortSkinCareTip3.
  ///
  /// In en, this message translates to:
  /// **'Eat skin-friendly food'**
  String get shortSkinCareTip3;

  /// No description provided for @shortSkinCareTip4.
  ///
  /// In en, this message translates to:
  /// **'Limit sun exposure'**
  String get shortSkinCareTip4;

  /// No description provided for @shortSkinCareTip5.
  ///
  /// In en, this message translates to:
  /// **'Protect skin at all times'**
  String get shortSkinCareTip5;

  /// No description provided for @skinCareTip1.
  ///
  /// In en, this message translates to:
  /// **'Sun Protection: Always use a broad-spectrum sunscreen when going out in the sun. UV rays can damage your skin and lead to premature aging.'**
  String get skinCareTip1;

  /// No description provided for @skinCareTip2.
  ///
  /// In en, this message translates to:
  /// **'Cleansing: It\'\'s important to cleanse your skin in the morning and evening. Use an appropriate cleanser to remove dirt and makeup from your skin.'**
  String get skinCareTip2;

  /// No description provided for @skinCareTip3.
  ///
  /// In en, this message translates to:
  /// **'Moisturizing: Moisturizing your skin helps prevent dryness and keeps your skin looking young and vibrant. Choose a moisturizer that suits your skin type.'**
  String get skinCareTip3;

  /// No description provided for @skinCareTip4.
  ///
  /// In en, this message translates to:
  /// **'Proper Nutrition: Adopt a healthy eating habit. Consume foods rich in vitamins A, C, E and antioxidants for the health of your skin.'**
  String get skinCareTip4;

  /// No description provided for @skinCareTip5.
  ///
  /// In en, this message translates to:
  /// **'Exercise: Regular exercise ensures better oxygen circulation to your skin and improves blood flow.'**
  String get skinCareTip5;

  /// No description provided for @skinCareTip6.
  ///
  /// In en, this message translates to:
  /// **'Squeezing acne or blackheads with your fingers can worsen your skin and lead to scarring. Leave this to a professional esthetician or dermatologist.'**
  String get skinCareTip6;

  /// No description provided for @skinCareTip7.
  ///
  /// In en, this message translates to:
  /// **'Stress Management: Stress can lead to skin issues. Relaxation techniques like meditation and yoga can reduce stress.'**
  String get skinCareTip7;

  /// No description provided for @skinCareTip8.
  ///
  /// In en, this message translates to:
  /// **'Clean Makeup Tools: Clean your makeup brushes and sponges regularly. Dirty tools can lead to skin infections.'**
  String get skinCareTip8;

  /// No description provided for @skinCareTip9.
  ///
  /// In en, this message translates to:
  /// **'Evening Skincare Routine: Nighttime skincare helps your skin regenerate. Use a suitable night cream for your skin type.'**
  String get skinCareTip9;

  /// No description provided for @skinCareTip10.
  ///
  /// In en, this message translates to:
  /// **'Regular Skin Check-ups: To detect skin cancer and other skin issues early, schedule regular visits to a dermatologist.'**
  String get skinCareTip10;

  /// No description provided for @skinCareTip11.
  ///
  /// In en, this message translates to:
  /// **'Don\'\'t Wash Your Face with Hot Water: Hot water can strip your skin of its natural oils and lead to dryness. Opt for lukewarm water when washing your face.'**
  String get skinCareTip11;

  /// No description provided for @skinCareTip12.
  ///
  /// In en, this message translates to:
  /// **'Don\'\'t Scrub Your Face with Your Hands: Avoid scrubbing your face too vigorously or using your nails. Instead, clean your face with gentle, circular motions.'**
  String get skinCareTip12;

  /// No description provided for @skinCareTip13.
  ///
  /// In en, this message translates to:
  /// **'Regular Exfoliation: Use a mild facial exfoliant once or twice a week to help with cell turnover.'**
  String get skinCareTip13;

  /// No description provided for @skinCareTip14.
  ///
  /// In en, this message translates to:
  /// **'Consider Natural Moisturizers: Natural oils like argan or jojoba can be used as moisturizers, but make sure they are suitable for your skin type.'**
  String get skinCareTip14;

  /// No description provided for @skinCareTip15.
  ///
  /// In en, this message translates to:
  /// **'Daily Skin Cleansing: Change your pillowcase regularly. Unclean pillowcases can contribute to acne.'**
  String get skinCareTip15;

  /// No description provided for @skinCareTip16.
  ///
  /// In en, this message translates to:
  /// **'Lack of sleep or insufficient rest can lead to increased under-eye puffiness. A good night\'\'s sleep can help reduce these puffiness issues.'**
  String get skinCareTip16;

  /// No description provided for @skinCareTip17.
  ///
  /// In en, this message translates to:
  /// **'Don\'\'t Overwash Your Face: Cleansing your face twice a day is sufficient. Overwashing can dry out your skin and cause irritation.'**
  String get skinCareTip17;

  /// No description provided for @skinCareTip18.
  ///
  /// In en, this message translates to:
  /// **'Your lifestyle greatly affects your skin\'\'s appearance. Exercise regularly and adopt a diet rich in fresh fruits, vegetables, and healthy fats.'**
  String get skinCareTip18;

  /// No description provided for @skinCareTip19.
  ///
  /// In en, this message translates to:
  /// **'Makeup Removers: Use a gentle and effective makeup remover to thoroughly clean your makeup. Residue can clog pores.'**
  String get skinCareTip19;

  /// No description provided for @skinCareTip20.
  ///
  /// In en, this message translates to:
  /// **'Regular Exfoliation: Use a mild facial exfoliant once or twice a week to help with turnover.'**
  String get skinCareTip20;

  /// No description provided for @learnSkinQuestion1.
  ///
  /// In en, this message translates to:
  /// **'How does your skin usually feel?'**
  String get learnSkinQuestion1;

  /// No description provided for @learnSkinAnswers1_1.
  ///
  /// In en, this message translates to:
  /// **'It gets red and irritated quickly'**
  String get learnSkinAnswers1_1;

  /// No description provided for @learnSkinAnswers1_2.
  ///
  /// In en, this message translates to:
  /// **'Tense and flaky'**
  String get learnSkinAnswers1_2;

  /// No description provided for @learnSkinAnswers1_3.
  ///
  /// In en, this message translates to:
  /// **'Shiny and greasy'**
  String get learnSkinAnswers1_3;

  /// No description provided for @learnSkinAnswers1_4.
  ///
  /// In en, this message translates to:
  /// **'My T-zone is oily but my cheeks are dry'**
  String get learnSkinAnswers1_4;

  /// No description provided for @learnSkinAnswers1_5.
  ///
  /// In en, this message translates to:
  /// **'Neither greasy nor dry, comfortable'**
  String get learnSkinAnswers1_5;

  /// No description provided for @learnSkinQuestion2.
  ///
  /// In en, this message translates to:
  /// **'What is the size of your pores?'**
  String get learnSkinQuestion2;

  /// No description provided for @learnSkinAnswers2_1.
  ///
  /// In en, this message translates to:
  /// **'Not noticeable or very small'**
  String get learnSkinAnswers2_1;

  /// No description provided for @learnSkinAnswers2_2.
  ///
  /// In en, this message translates to:
  /// **'Small or not visible'**
  String get learnSkinAnswers2_2;

  /// No description provided for @learnSkinAnswers2_3.
  ///
  /// In en, this message translates to:
  /// **'Broad and distinct'**
  String get learnSkinAnswers2_3;

  /// No description provided for @learnSkinAnswers2_4.
  ///
  /// In en, this message translates to:
  /// **'Large in my T-zone, small in other zones'**
  String get learnSkinAnswers2_4;

  /// No description provided for @learnSkinAnswers2_5.
  ///
  /// In en, this message translates to:
  /// **'Normal, not very pronounced'**
  String get learnSkinAnswers2_5;

  /// No description provided for @learnSkinQuestion3.
  ///
  /// In en, this message translates to:
  /// **'Do you suffer from pimples or acne on your skin?'**
  String get learnSkinQuestion3;

  /// No description provided for @learnSkinAnswers3_1.
  ///
  /// In en, this message translates to:
  /// **'Yes, and usually irritation after product use'**
  String get learnSkinAnswers3_1;

  /// No description provided for @learnSkinAnswers3_2.
  ///
  /// In en, this message translates to:
  /// **'No, I don\'\'t really get pimples'**
  String get learnSkinAnswers3_2;

  /// No description provided for @learnSkinAnswers3_3.
  ///
  /// In en, this message translates to:
  /// **'Yes, often and in oily areas'**
  String get learnSkinAnswers3_3;

  /// No description provided for @learnSkinAnswers3_4.
  ///
  /// In en, this message translates to:
  /// **'Sometimes, especially during stressful or hormonal periods'**
  String get learnSkinAnswers3_4;

  /// No description provided for @learnSkinAnswers3_5.
  ///
  /// In en, this message translates to:
  /// **'Occasionally, but under control'**
  String get learnSkinAnswers3_5;

  /// No description provided for @learnSkinQuestion4.
  ///
  /// In en, this message translates to:
  /// **'How resistant is your skin to the sun?'**
  String get learnSkinQuestion4;

  /// No description provided for @learnSkinAnswers4_1.
  ///
  /// In en, this message translates to:
  /// **'It reddens and burns quickly'**
  String get learnSkinAnswers4_1;

  /// No description provided for @learnSkinAnswers4_2.
  ///
  /// In en, this message translates to:
  /// **'Burns easily and does not tan'**
  String get learnSkinAnswers4_2;

  /// No description provided for @learnSkinAnswers4_3.
  ///
  /// In en, this message translates to:
  /// **'Easy to tan, rarely burns'**
  String get learnSkinAnswers4_3;

  /// No description provided for @learnSkinAnswers4_4.
  ///
  /// In en, this message translates to:
  /// **'Sometimes burns, tans easily'**
  String get learnSkinAnswers4_4;

  /// No description provided for @learnSkinAnswers4_5.
  ///
  /// In en, this message translates to:
  /// **'Generally durable'**
  String get learnSkinAnswers4_5;

  /// No description provided for @learnSkinQuestion5.
  ///
  /// In en, this message translates to:
  /// **'How does your makeup stay on during the day?'**
  String get learnSkinQuestion5;

  /// No description provided for @learnSkinAnswers5_1.
  ///
  /// In en, this message translates to:
  /// **'My skin can get irritated, so I use less'**
  String get learnSkinAnswers5_1;

  /// No description provided for @learnSkinAnswers5_2.
  ///
  /// In en, this message translates to:
  /// **'My skin ca look flaky because it is dry'**
  String get learnSkinAnswers5_2;

  /// No description provided for @learnSkinAnswers5_3.
  ///
  /// In en, this message translates to:
  /// **'Greases and leaks quickly'**
  String get learnSkinAnswers5_3;

  /// No description provided for @learnSkinAnswers5_4.
  ///
  /// In en, this message translates to:
  /// **'While my T-zone shines, other areas remain fine'**
  String get learnSkinAnswers5_4;

  /// No description provided for @learnSkinAnswers5_5.
  ///
  /// In en, this message translates to:
  /// **'Generally stable and stands well'**
  String get learnSkinAnswers5_5;

  /// No description provided for @learnSkinQuestion6.
  ///
  /// In en, this message translates to:
  /// **'What is your skin tone?'**
  String get learnSkinQuestion6;

  /// No description provided for @learnSkinAnswers6_1.
  ///
  /// In en, this message translates to:
  /// **'Reddish or faded'**
  String get learnSkinAnswers6_1;

  /// No description provided for @learnSkinAnswers6_2.
  ///
  /// In en, this message translates to:
  /// **'Dull or pale'**
  String get learnSkinAnswers6_2;

  /// No description provided for @learnSkinAnswers6_3.
  ///
  /// In en, this message translates to:
  /// **'Shiny or oily appearance'**
  String get learnSkinAnswers6_3;

  /// No description provided for @learnSkinAnswers6_4.
  ///
  /// In en, this message translates to:
  /// **'Mixed, T-zone oily appearance'**
  String get learnSkinAnswers6_4;

  /// No description provided for @learnSkinAnswers6_5.
  ///
  /// In en, this message translates to:
  /// **'Vibrant and equal'**
  String get learnSkinAnswers6_5;

  /// No description provided for @learnSkinQuestion7.
  ///
  /// In en, this message translates to:
  /// **'Do you have a problem with blackheads on your skin?'**
  String get learnSkinQuestion7;

  /// No description provided for @learnSkinAnswers7_1.
  ///
  /// In en, this message translates to:
  /// **'Rarely, my skin is usually sensitive'**
  String get learnSkinAnswers7_1;

  /// No description provided for @learnSkinAnswers7_2.
  ///
  /// In en, this message translates to:
  /// **'Not very much'**
  String get learnSkinAnswers7_2;

  /// No description provided for @learnSkinAnswers7_3.
  ///
  /// In en, this message translates to:
  /// **'Yes, often and in my pores'**
  String get learnSkinAnswers7_3;

  /// No description provided for @learnSkinAnswers7_4.
  ///
  /// In en, this message translates to:
  /// **'I have it in my T-zone'**
  String get learnSkinAnswers7_4;

  /// No description provided for @learnSkinAnswers7_5.
  ///
  /// In en, this message translates to:
  /// **'Very rare'**
  String get learnSkinAnswers7_5;

  /// No description provided for @learnSkinQuestion8.
  ///
  /// In en, this message translates to:
  /// **'How does your skin react to the change of seasons?'**
  String get learnSkinQuestion8;

  /// No description provided for @learnSkinAnswers8_1.
  ///
  /// In en, this message translates to:
  /// **'Very sensitive, easily reddened and irritated'**
  String get learnSkinAnswers8_1;

  /// No description provided for @learnSkinAnswers8_2.
  ///
  /// In en, this message translates to:
  /// **'It becomes very dry and the need for moisturizing increases'**
  String get learnSkinAnswers8_2;

  /// No description provided for @learnSkinAnswers8_3.
  ///
  /// In en, this message translates to:
  /// **'It becomes more oily and problematic'**
  String get learnSkinAnswers8_3;

  /// No description provided for @learnSkinAnswers8_4.
  ///
  /// In en, this message translates to:
  /// **'My T-zone gets oily, my cheeks get dry'**
  String get learnSkinAnswers8_4;

  /// No description provided for @learnSkinAnswers8_5.
  ///
  /// In en, this message translates to:
  /// **'There may be minor changes but overall stable'**
  String get learnSkinAnswers8_5;

  /// No description provided for @learnSkinQuestion9.
  ///
  /// In en, this message translates to:
  /// **'How moisturized is your skin?'**
  String get learnSkinQuestion9;

  /// No description provided for @learnSkinAnswers9_1.
  ///
  /// In en, this message translates to:
  /// **'Products can easily irritate my skin'**
  String get learnSkinAnswers9_1;

  /// No description provided for @learnSkinAnswers9_2.
  ///
  /// In en, this message translates to:
  /// **'I constantly feel the need for moisturizer'**
  String get learnSkinAnswers9_2;

  /// No description provided for @learnSkinAnswers9_3.
  ///
  /// In en, this message translates to:
  /// **'Very oily, I rarely need additional moisturizer'**
  String get learnSkinAnswers9_3;

  /// No description provided for @learnSkinAnswers9_4.
  ///
  /// In en, this message translates to:
  /// **'My T-zone is oily, other areas are dry'**
  String get learnSkinAnswers9_4;

  /// No description provided for @learnSkinAnswers9_5.
  ///
  /// In en, this message translates to:
  /// **'Stable, not requiring too much extra care'**
  String get learnSkinAnswers9_5;

  /// No description provided for @learnSkinQuestion10.
  ///
  /// In en, this message translates to:
  /// **'What is your general complaint about your skin?'**
  String get learnSkinQuestion10;

  /// No description provided for @learnSkinAnswers10_1.
  ///
  /// In en, this message translates to:
  /// **'Redness and sensitivity'**
  String get learnSkinAnswers10_1;

  /// No description provided for @learnSkinAnswers10_2.
  ///
  /// In en, this message translates to:
  /// **'Dryness and shedding'**
  String get learnSkinAnswers10_2;

  /// No description provided for @learnSkinAnswers10_3.
  ///
  /// In en, this message translates to:
  /// **'Excess oil and acne'**
  String get learnSkinAnswers10_3;

  /// No description provided for @learnSkinAnswers10_4.
  ///
  /// In en, this message translates to:
  /// **'Glowing T-zone and dry cheeks'**
  String get learnSkinAnswers10_4;

  /// No description provided for @learnSkinAnswers10_5.
  ///
  /// In en, this message translates to:
  /// **'I have no specific complaints'**
  String get learnSkinAnswers10_5;

  /// No description provided for @care.
  ///
  /// In en, this message translates to:
  /// **'Care'**
  String get care;

  /// No description provided for @nutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get nutrition;

  /// No description provided for @definition.
  ///
  /// In en, this message translates to:
  /// **'Skin Definition'**
  String get definition;

  /// No description provided for @sensitive.
  ///
  /// In en, this message translates to:
  /// **'SENSITIVE'**
  String get sensitive;

  /// No description provided for @sensitiveDefinition.
  ///
  /// In en, this message translates to:
  /// **'Tends to overreact to various substances (such as chemicals, perfumes, soaps and weather conditions). Redness, itching and irritation are common problems.'**
  String get sensitiveDefinition;

  /// No description provided for @sensitiveCare.
  ///
  /// In en, this message translates to:
  /// **'For sensitive skin, use mild, fragrance-free and allergen-free products. Be sure to use sunscreen and avoid harsh exfoliating products that can irritate the skin.'**
  String get sensitiveCare;

  /// No description provided for @sensitiveNutrition.
  ///
  /// In en, this message translates to:
  /// **'Eat foods with anti-inflammatory properties (e.g. green leafy vegetables, fruits). Avoid or reduce the consumption of spicy foods and foods containing allergens (dairy products, gluten, etc.).'**
  String get sensitiveNutrition;

  /// No description provided for @dry.
  ///
  /// In en, this message translates to:
  /// **'DRY'**
  String get dry;

  /// No description provided for @dryDefinition.
  ///
  /// In en, this message translates to:
  /// **'Skin that does not have enough moisture and can often be tight or flaky. Pores are small, skin can be dull and smooth but lack elasticity.'**
  String get dryDefinition;

  /// No description provided for @dryCare.
  ///
  /// In en, this message translates to:
  /// **'Use creams rich in moisturizing properties. You can choose products that contain moisture-retaining ingredients such as hyaluronic acid. Avoid washing your face with hot water, as this can strip the skin of its natural oils.'**
  String get dryCare;

  /// No description provided for @dryNutrition.
  ///
  /// In en, this message translates to:
  /// **'Make sure to drink plenty of water. Eat foods rich in omega-3 fatty acids (e.g. salmon, chia seeds, walnuts).'**
  String get dryNutrition;

  /// No description provided for @oily.
  ///
  /// In en, this message translates to:
  /// **'OILY'**
  String get oily;

  /// No description provided for @oilyDefinition.
  ///
  /// In en, this message translates to:
  /// **'This skin type is usually prone to large pores, shiny skin and frequent acne or blackheads. Sebum (oil) production is high, which makes the skin feel oily all the time.'**
  String get oilyDefinition;

  /// No description provided for @oilyCare.
  ///
  /// In en, this message translates to:
  /// **'Use light, oil-free products and sunscreens with mattifying properties. You can use oil-absorbing products such as clay masks several times a week. Also, products containing salicylic acid can help to clean the pores.'**
  String get oilyCare;

  /// No description provided for @oilyNutrition.
  ///
  /// In en, this message translates to:
  /// **'Avoid foods high in sugar and saturated fats. Eat fiber-rich foods, fresh vegetables and fruits.'**
  String get oilyNutrition;

  /// No description provided for @combination.
  ///
  /// In en, this message translates to:
  /// **'COMBINATION'**
  String get combination;

  /// No description provided for @combinationDefinition.
  ///
  /// In en, this message translates to:
  /// **'Usually oily in areas such as the forehead, nose and chin (T-zone), but normal or dry in other areas sucuh as the cheeks. Pores may be more prominent in the T-zone.'**
  String get combinationDefinition;

  /// No description provided for @combinationCare.
  ///
  /// In en, this message translates to:
  /// **'Consider using different products for different areas of the skin; light formulas for oily areas, richer moisturizers for dry areas. You can use toners to help tighten pores.'**
  String get combinationCare;

  /// No description provided for @combinationNutrition.
  ///
  /// In en, this message translates to:
  /// **'Eat a balanced diet. Avoid overly fatty or dry foods. Try to eat enough vegetables, fruits and whole grains.'**
  String get combinationNutrition;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'NORMAL'**
  String get normal;

  /// No description provided for @normalDefinition.
  ///
  /// In en, this message translates to:
  /// **'This skin type is considered \'ideal\' as it is neither too oily nor too dry. Pores are not prominent and the skin usually has a glowing and smooth appearance. Normal skin has a balanced moisture level.'**
  String get normalDefinition;

  /// No description provided for @normalCare.
  ///
  /// In en, this message translates to:
  /// **'Follow a regular skincare routine to keep skin clean and moisturized. Use products with SPF protection daily and use a quality moisturizer to keep skin hydrated.'**
  String get normalCare;

  /// No description provided for @normalNutrition.
  ///
  /// In en, this message translates to:
  /// **'Eat foods rich in antioxidants to maintain skin health. Maintain a balanced diet with enough protein, vitamins and minerals.'**
  String get normalNutrition;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;
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
