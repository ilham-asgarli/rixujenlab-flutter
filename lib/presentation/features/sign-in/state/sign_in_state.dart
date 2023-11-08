part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {
  const SignInInitial();
}

class SignInProgress extends SignInState {
  const SignInProgress();
}

class SignInSuccess extends SignInState {
  const SignInSuccess();
}

class SignInError extends SignInState {
  const SignInError();
}
