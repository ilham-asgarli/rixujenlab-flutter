import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
}
