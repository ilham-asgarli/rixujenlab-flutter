part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {
  const SignUpEvent();
}

class StartSignUp extends SignUpEvent {
  const StartSignUp();
}

class FinishSignUp extends SignUpEvent {
  final bool signedUp;

  const FinishSignUp({
    required this.signedUp,
  });
}
