import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/di/injectable.dart';
import '../../../utils/constants/cache/shared_preferences_constants.dart';

@injectable
class MainViewModel {
  Future<void> setOpened() async {
    await getIt<SharedPreferences>()
        .setBool(SharedPreferencesConstants.firstOpen, false);
  }
}
