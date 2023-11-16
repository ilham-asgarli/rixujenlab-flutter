import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/usecases/skin-type/save_test_result_use_case.dart';
import '../../../../../../utils/di/injectable.dart';
import '../../../../../utils/config/router/config_router.dart';
import '../../../../../utils/constants/enums/app_enum.dart';
import '../state/learn_type_bloc.dart';

@injectable
class LearnTypeViewModel {
  void onBack(BuildContext context) {
    if (BlocProvider.of<LearnTypeBloc>(context).state.index > 0) {
      BlocProvider.of<LearnTypeBloc>(context).add(const GetBack());
    } else {
      context.pop();
    }
  }

  void onFinish(BuildContext context) {
    SkinType skinType = getType(context);
    getIt<SaveTestResultUseCase>()(SaveTestResultUseCaseParams(
      skinType: skinType,
    ));
    MyTypeViewRoute(myType: skinType).replace(context);
  }

  SkinType getType(context) {
    var groupedMap = groupBy(
      BlocProvider.of<LearnTypeBloc>(context).state.chosenAnswers,
      (String option) => option,
    );

    var sortedEntries = groupedMap.entries.toList()
      ..sort((a, b) => b.value.length.compareTo(a.value.length));

    if (sortedEntries.length > 1 &&
        sortedEntries[0].value.length == sortedEntries[1].value.length) {
      return SkinType.normal;
    } else {
      var mostPopularValue = sortedEntries.first.key;

      return switch (mostPopularValue) {
        "A" => SkinType.sensitive,
        "B" => SkinType.dry,
        "C" => SkinType.oily,
        "D" => SkinType.combination,
        "E" => SkinType.normal,
        String() => SkinType.normal,
      };
    }
  }
}
