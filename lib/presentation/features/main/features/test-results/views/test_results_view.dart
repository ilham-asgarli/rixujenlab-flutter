import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../domain/usecases/skin-type/delete_test_result_use_case.dart';
import '../../../../../../domain/usecases/skin-type/get_test_results_use_case.dart';
import '../../../../../../utils/di/injectable.dart';
import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../utils/constants/colors/app_colors.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../../../../../widgets/back.dart';
import '../../../../../widgets/bg_app_name.dart';
import '../view-models/test_results_view_model.dart';
import '../widgets/test_result_item.dart';

class TestResults extends StatefulWidget {
  final TestResultsViewModel testResultsViewModel;

  const TestResults({
    super.key,
    required this.testResultsViewModel,
  });

  @override
  State<TestResults> createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Back(
          child: BgAppName(
            child: Stack(
              children: [
                Assets.image.icBg8Png.image(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.dynamicHeight(0.1),
                    horizontal: context.dynamicWidth(0.1),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          context.l10n.previousResults,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        context.dynamicVerticalSpace(0.03),
                        Expanded(
                          child: FutureBuilder(
                            future: getIt<GetTestResultsUseCase>()(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return snapshot.data!.fold(
                                  (l) => const SizedBox(),
                                  (r) => ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: r.length,
                                    itemBuilder: (context, index) {
                                      return TestResultItem(
                                        testResultEntity: r[index],
                                        onTap: () async {
                                          await getIt<
                                                  DeleteTestResultUseCase>()(
                                              DeleteTestResultUseCaseParams(
                                            id: r[index].id,
                                          ));

                                          setState(() {});
                                        },
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider(
                                        color: AppColors.black.shade0,
                                        height: 0,
                                      );
                                    },
                                  ),
                                );
                              }

                              return const SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
