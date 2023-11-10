import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/security/sign_up_use_case.dart';
import '../../../../utils/di/injectable.dart';
import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/sign_up_field_extension.dart';
import '../state/sign_up_bloc.dart';

@injectable
class SignUpViewModel {
  final SignUpBloc signUpBloc = getIt<SignUpBloc>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final fullNameController = TextEditingController();

  Future<void> signUp() async {
    if (signUpBloc.state is! SignUpProgress &&
        signUpBloc.state is! SignUpSuccess) {
      signUpBloc.add(const StartSignUp());
      var res = await getIt<SignUpUseCase>()(SignUpUseCaseParams(
        email: SignUpField.email.controller(this).text,
        password: SignUpField.password.controller(this).text,
        fullName: SignUpField.fullName.controller(this).text,
        userName: SignUpField.userName.controller(this).text,
      ));
      res.fold(
        (l) => signUpBloc.add(const FinishSignUp(signedUp: false)),
        (r) => signUpBloc.add(const FinishSignUp(signedUp: true)),
      );
    }
  }
}
