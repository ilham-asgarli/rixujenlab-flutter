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
import '../../../utils/extensions/sign_in_field_extension.dart';
import '../../../widgets/app_name.dart';
import '../../../widgets/back.dart';
import '../state/sign_in_bloc.dart';
import '../view-models/sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  final SignInViewModel signInViewModel;

  const SignInView({
    super.key,
    required this.signInViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);

    return BlocProvider(
      create: (context) => signInViewModel.signInBloc,
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) async {
          if (state is SignInSuccess) {
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
                      child: Back(
                        child: Stack(
                          children: [
                            Assets.image.icBg4Png.image(
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
                                      context.l10n.signInTitle,
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      SignInField signInField =
                                          SignInField.values[index];

                                      return SignTextField(
                                        textEditingController: signInField
                                            .controller(signInViewModel),
                                        hintText: signInField.hintText,
                                        keyboardType: signInField.keyboardType,
                                        obscureText: signInField.obscureText,
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        context.dynamicVerticalSpace(0.02),
                                    itemCount: SignInField.values.length,
                                  ),
                                  context.dynamicVerticalSpace(0.02),
                                  CustomElevatedButton(
                                    progress: context.watch<SignInBloc>().state
                                        is SignInProgress,
                                    text: context.l10n.continue_,
                                    onPressed: () async {
                                      FocusScope.of(context).unfocus();
                                      await signInViewModel.signIn();
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const AppName(
                      colored: true,
                    ),
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
