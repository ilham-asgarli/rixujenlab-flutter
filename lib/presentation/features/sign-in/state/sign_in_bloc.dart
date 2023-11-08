import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInInitial()) {
    on<StartSignIn>(onStartSignIn);
    on<FinishSignIn>(onFinishSignIn);
  }

  void onStartSignIn(StartSignIn event, Emitter<SignInState> emit) {
    emit(const SignInProgress());
  }

  void onFinishSignIn(FinishSignIn event, Emitter<SignInState> emit) {
    if (event.signedIn) {
      emit(const SignInSuccess());
    } else {
      emit(const SignInError());
    }
  }
}
