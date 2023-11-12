import '../../../utils/di/injectable.dart';
import '../config/router/config_router.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';
import 'string_extension.dart';

extension EntryExtension on Entry {
  String get text => switch (this) {
        Entry.signIn =>
          getIt<AppLocalizations>().signUp.toFirstLetterCapitalized,
        Entry.signUp =>
          getIt<AppLocalizations>().signInTitle.toFirstLetterCapitalized,
        Entry.guess => getIt<AppLocalizations>().guess,
      };

  void onTap(context) => switch (this) {
        Entry.signIn => SignUpViewRoute().push(context),
        Entry.signUp => SignInViewRoute().push(context),
        Entry.guess => MainViewRoute().go(context),
      };

  Duration get fadeDuration => switch (this) {
        Entry.signIn => const Duration(
            seconds: 1,
            milliseconds: 500,
          ),
        Entry.signUp => const Duration(
            seconds: 1,
            milliseconds: 600,
          ),
        Entry.guess => const Duration(
            seconds: 1,
            milliseconds: 700,
          ),
      };
}
