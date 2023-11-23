import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/security/sign_in_use_case.dart';
import '../../../../utils/di/injectable.dart';
import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/sign_in_field_extension.dart';
import '../state/sign_in_bloc.dart';

@injectable
class SignInViewModel {
  final SignInBloc signInBloc = getIt<SignInBloc>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn() async {
    if (signInBloc.state is! SignInProgress &&
        signInBloc.state is! SignInSuccess) {
      signInBloc.add(const StartSignIn());
      var res = await getIt<SignInUseCase>()(SignInUseCaseParams(
        email: SignInField.email.controller(this).text,
        password: SignInField.password.controller(this).text,
      ));
      res.fold(
        (l) => signInBloc.add(const FinishSignIn(signedIn: false)),
        (r) => signInBloc.add(FinishSignIn(signedIn: r != null)),
      );
    }
  }
}
