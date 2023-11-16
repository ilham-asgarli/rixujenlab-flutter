import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../utils/constants/app/app_constants.dart';

part 'learn_type_event.dart';
part 'learn_type_state.dart';

class LearnTypeBloc extends Bloc<LearnTypeEvent, LearnTypeState> {
  LearnTypeBloc()
      : super(const LearnTypeNewQuestion(
          chosenAnswers: [],
          index: 0,
        )) {
    on<GetNewQuestion>(onGetNewQuestion);
    on<GetBack>(onGetBack);
    on<FinishTest>(onFinishTest);
  }

  void onGetNewQuestion(GetNewQuestion event, Emitter<LearnTypeState> emit) {
    int index = state.index + 1;

    if (index <= AppConstants.learnSkinTypeForm.length - 1) {
      emit(LearnTypeNewQuestion(
        chosenAnswers: List.from(state.chosenAnswers)..add(event.answer),
        index: index,
      ));
    } else {
      add(FinishTest(answer: event.answer));
    }
  }

  void onGetBack(GetBack event, Emitter<LearnTypeState> emit) {
    emit(LearnTypeNewQuestion(
      chosenAnswers: List.from(state.chosenAnswers)..removeLast(),
      index: state.index - 1,
    ));
  }

  void onFinishTest(FinishTest event, Emitter<LearnTypeState> emit) {
    emit(LearnTypeFinished(
      chosenAnswers: List.from(state.chosenAnswers)..add(event.answer),
    ));
  }
}
