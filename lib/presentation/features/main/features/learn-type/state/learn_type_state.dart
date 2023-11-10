part of 'learn_type_bloc.dart';

@immutable
abstract class LearnTypeState {
  final List<String> chosenAnswers;
  final int index;

  const LearnTypeState({
    required this.chosenAnswers,
    required this.index,
  });
}

class LearnTypeNewQuestion extends LearnTypeState {
  const LearnTypeNewQuestion({
    required super.chosenAnswers,
    required super.index,
  });
}

class LearnTypeFinished extends LearnTypeState {
  LearnTypeFinished({
    required super.chosenAnswers,
  }) : super(index: AppConstants.learnSkinTypeForm.length - 1);
}
