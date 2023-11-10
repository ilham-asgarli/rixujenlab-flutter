import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../utils/di/injectable.dart';
import '../../../../../utils/constants/enums/app_enum.dart';
import '../state/learn_type_bloc.dart';

@injectable
class LearnTypeViewModel {
  final LearnTypeBloc learnTypeBloc = getIt<LearnTypeBloc>();

  MyType getType() {
    var groupedMap = groupBy(
      learnTypeBloc.state.chosenAnswers,
      (String option) => option,
    );

    var sortedEntries = groupedMap.entries.toList()
      ..sort((a, b) => b.value.length.compareTo(a.value.length));

    if (sortedEntries.length > 1 &&
        sortedEntries[0].value.length == sortedEntries[1].value.length) {
      return MyType.normal;
    } else {
      var mostPopularValue = sortedEntries.first.key;

      return switch (mostPopularValue) {
        "A" => MyType.sensitive,
        "B" => MyType.dry,
        "C" => MyType.oily,
        "D" => MyType.combination,
        "E" => MyType.normal,
        String() => MyType.normal,
      };
    }
  }
}
