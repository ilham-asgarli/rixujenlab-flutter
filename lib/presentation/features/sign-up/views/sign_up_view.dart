import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/di/injectable.dart';
import '../../../../utils/gen/assets.gen.dart';
import '../../../../utils/gen/fonts.gen.dart';
import '../../../components/button/custom_elevated_button.dart';
import '../../../components/textfield/sign_text_field.dart';
import '../../../utils/config/router/config_router.dart';
import '../../../utils/constants/cache/shared_preferences_constants.dart';
import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/extensions/sign_up_field_extension.dart';
import '../../../widgets/app_name.dart';
import '../state/sign_up_bloc.dart';
import '../view-models/sign_up_view_model.dart';

class SignUpView extends StatelessWidget {
  final SignUpViewModel signUpViewModel;

  const SignUpView({
    super.key,
    required this.signUpViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);

    return BlocProvider(
      create: (context) => signUpViewModel.signUpBloc,
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) async {
          if (state is SignUpSuccess) {
            await getIt<SharedPreferences>().setBool(
              SharedPreferencesConstants.signedIn,
              true,
            );

            if (context.mounted) {
              MainViewRoute().go(context);
            }
          }
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Assets.image.icBg3Png.image(
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          SizedBox(
                            height: isKeyboardVisible
                                ? context.safeHeight
                                : context.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (!isKeyboardVisible) ...[
                                  Text(
                                    context.l10n.signUpTitle,
                                    style: const TextStyle(
                                      fontFamily:
                                          FontFamily.kudryashevDisplaySans,
                                      fontSize: 28,
                                      color: Color(0xFF523721),
                                    ),
                                  ),
                                  context.dynamicVerticalSpace(0.01),
                                  Divider(
                                    thickness: 2,
                                    color: const Color(0xFF523721),
                                    endIndent: context.dynamicWidth(0.1),
                                    indent: context.dynamicWidth(0.1),
                                  ),
                                  context.dynamicVerticalSpace(0.08),
                                ],
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    SignUpField signUpField =
                                        SignUpField.values[index];

                                    return SignTextField(
                                      textEditingController: signUpField
                                          .controller(signUpViewModel),
                                      hintText: signUpField.hintText,
                                      obscureText: signUpField.obscureText,
                                      keyboardType: signUpField.keyboardType,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      context.dynamicVerticalSpace(0.02),
                                  itemCount: SignUpField.values.length,
                                ),
                                context.dynamicVerticalSpace(0.02),
                                CustomElevatedButton(
                                  progress: context.watch<SignUpBloc>().state
                                      is SignUpProgress,
                                  text: context.l10n.signUp,
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();
                                    await signUpViewModel.signUp();
                                  },
                                ),
                                context.dynamicVerticalSpace(0.02),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () {
                                    SignInViewRoute().push(context);
                                  },
                                  child: Text(context.l10n.signIn),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const AppName(colored: true),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
