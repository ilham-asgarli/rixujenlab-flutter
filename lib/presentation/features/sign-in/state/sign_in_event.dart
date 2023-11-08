part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {
  const SignInEvent();
}

class StartSignIn extends SignInEvent {
  const StartSignIn();
}

class FinishSignIn extends SignInEvent {
  final bool signedIn;

  const FinishSignIn({
    required this.signedIn,
  });
}
