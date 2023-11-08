import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpInitial()) {
    on<StartSignUp>(onStartSignUp);
    on<FinishSignUp>(onFinishSignUp);
  }

  void onStartSignUp(StartSignUp event, Emitter<SignUpState> emit) {
    emit(const SignUpProgress());
  }

  void onFinishSignUp(FinishSignUp event, Emitter<SignUpState> emit) {
    if (event.signedUp) {
      emit(const SignUpSuccess());
    } else {
      emit(const SignUpError());
    }
  }
}
