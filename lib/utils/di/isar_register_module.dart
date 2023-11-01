import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../data/models/ingredients_model.dart';
import '../../data/models/user_model.dart';
import '../../presentation/utils/managers/isar_manager.dart';
import '../constants/di/isar_constants.dart';
import 'injectable.dart';

@module
abstract class IsarRegisterModule {
  @Named(IsarConstants.users)
  @lazySingleton
  Isar get users => getIt<IsarManager>().open(schema: UserModelSchema);

  @Named(IsarConstants.ingredients)
  @lazySingleton
  Isar get ingredients =>
      getIt<IsarManager>().open(schema: IngredientsModelSchema);
}
