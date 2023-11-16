part of 'learn_type_bloc.dart';

@immutable
abstract class LearnTypeEvent {
  const LearnTypeEvent();
}

class GetNewQuestion extends LearnTypeEvent {
  final String answer;

  const GetNewQuestion({
    required this.answer,
  });
}

class GetBack extends LearnTypeEvent {
  const GetBack();
}

class FinishTest extends LearnTypeEvent {
  final String answer;

  const FinishTest({required this.answer});
}
