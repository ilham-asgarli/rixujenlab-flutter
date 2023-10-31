import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../../utils/gen/assets.gen.dart';
import '../../../components/textfield/sign_text_field.dart';
import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/extensions/sign_in_field_extension.dart';
import '../../../widgets/app_name.dart';
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Assets.image.icBg3.svg(fit: BoxFit.fill),
                  SizedBox(
                    height:
                        isKeyboardVisible ? context.safeHeight : context.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.signUp,
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xFF523721),
                          ),
                        ),
                        context.dynamicVerticalSpace(0.01),
                        Divider(
                          thickness: 2,
                          color: const Color(0xFF523721),
                          endIndent: context.dynamicWidth(0.05),
                          indent: context.dynamicWidth(0.05),
                        ),
                        context.dynamicVerticalSpace(0.08),
                        ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SignTextField(
                                hintText: SignUpField.values[index].hintText);
                          },
                          separatorBuilder: (context, index) =>
                              context.dynamicVerticalSpace(0.02),
                          itemCount: SignUpField.values.length,
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
  }
}
