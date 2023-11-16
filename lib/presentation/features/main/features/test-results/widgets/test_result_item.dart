import 'package:flutter/material.dart';

import '../../../../../../domain/entities/test_result_entity.dart';
import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../utils/config/router/config_router.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../../../../../utils/extensions/date_time_extension.dart';
import '../../../../../utils/extensions/my_type_extension.dart';
import '../../../../../utils/extensions/string_extension.dart';

class TestResultItem extends StatelessWidget {
  final TestResultEntity testResultEntity;
  final Function() onTap;

  const TestResultItem({
    super.key,
    required this.testResultEntity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MyTypeViewRoute(myType: testResultEntity.skinType).push(context);
      },
      child: Ink(
        height: context.dynamicHeight(0.04),
        child: Row(
          children: [
            context.dynamicHorizontalSpace(0.07),
            Text(
              "${testResultEntity.createdAt.ddMMyyyy} - ${testResultEntity.createdAt.Hm}",
            ),
            context.dynamicHorizontalSpace(0.04),
            Expanded(
              child: Text(
                "${testResultEntity.skinType.title.toFirstLetterCapitalized} ${context.l10n.skin}",
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Assets.image.icTrash.image(
                width: context.dynamicWidth(0.05),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
