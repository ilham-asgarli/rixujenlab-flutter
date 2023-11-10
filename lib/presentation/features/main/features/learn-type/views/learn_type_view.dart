import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../utils/config/router/config_router.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../state/learn_type_bloc.dart';
import '../view-models/learn_type_view_model.dart';
import '../widgets/answers.dart';

class LearnTypeView extends StatelessWidget {
  final LearnTypeViewModel learnTypeViewModel;

  const LearnTypeView({
    super.key,
    required this.learnTypeViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => learnTypeViewModel.learnTypeBloc,
      child: BlocListener<LearnTypeBloc, LearnTypeState>(
        listenWhen: (previous, current) => current is LearnTypeFinished,
        listener: (context, state) {
          MyTypeViewRoute(myType: learnTypeViewModel.getType())
              .replace(context);
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Assets.image.icBg6Png.image(
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.dynamicWidth(0.18),
                      ),
                      child: Column(
                        children: [
                          context.dynamicVerticalSpace(0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 10; i++)
                                Image.asset(
                                  context.watch<LearnTypeBloc>().state.index ==
                                          i
                                      ? Assets.image.icSelected.path
                                      : Assets.image.icUnselected.path,
                                  width: context.width * 0.06,
                                ),
                            ],
                          ),
                          context.dynamicVerticalSpace(0.07),
                          SizedBox(
                            height: context.dynamicHeight(0.12),
                            width: context.dynamicWidth(0.6),
                            child: Text(
                              AppConstants.learnSkinTypeForm[context
                                  .watch<LearnTypeBloc>()
                                  .state
                                  .index]["question"],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.abrilFatface(
                                fontSize: 26.3,
                                color: const Color(0xFF3D6923),
                                height: 1.0,
                              ),
                            ),
                          ),
                          context.dynamicVerticalSpace(0.05),
                          Answers(
                            learnTypeViewModel: learnTypeViewModel,
                            answers: AppConstants.learnSkinTypeForm[context
                                .watch<LearnTypeBloc>()
                                .state
                                .index]["answers"],
                          ),
                        ],
                      ),
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
