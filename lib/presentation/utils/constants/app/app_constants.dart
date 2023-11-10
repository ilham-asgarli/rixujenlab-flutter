import 'package:flutter/material.dart';

import '../../../../utils/di/injectable.dart';
import '../../l10n/gen/app_localizations.dart';

abstract class AppConstants {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final List<String> shortTips = [
    getIt<AppLocalizations>().shortSkinCareTip1,
    getIt<AppLocalizations>().shortSkinCareTip2,
    getIt<AppLocalizations>().shortSkinCareTip3,
    getIt<AppLocalizations>().shortSkinCareTip4,
    getIt<AppLocalizations>().shortSkinCareTip5,
  ];

  static final List<String> tips = [
    getIt<AppLocalizations>().skinCareTip1,
    getIt<AppLocalizations>().skinCareTip2,
    getIt<AppLocalizations>().skinCareTip3,
    getIt<AppLocalizations>().skinCareTip4,
    getIt<AppLocalizations>().skinCareTip5,
    getIt<AppLocalizations>().skinCareTip6,
    getIt<AppLocalizations>().skinCareTip7,
    getIt<AppLocalizations>().skinCareTip8,
    getIt<AppLocalizations>().skinCareTip9,
    getIt<AppLocalizations>().skinCareTip10,
    getIt<AppLocalizations>().skinCareTip11,
    getIt<AppLocalizations>().skinCareTip12,
    getIt<AppLocalizations>().skinCareTip13,
    getIt<AppLocalizations>().skinCareTip14,
    getIt<AppLocalizations>().skinCareTip15,
    getIt<AppLocalizations>().skinCareTip16,
    getIt<AppLocalizations>().skinCareTip17,
    getIt<AppLocalizations>().skinCareTip18,
    getIt<AppLocalizations>().skinCareTip19,
    getIt<AppLocalizations>().skinCareTip20,
  ];

  static final List<Map<String, dynamic>> learnSkinTypeForm = [
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion1,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers1_1,
        getIt<AppLocalizations>().learnSkinAnswers1_2,
        getIt<AppLocalizations>().learnSkinAnswers1_3,
        getIt<AppLocalizations>().learnSkinAnswers1_4,
        getIt<AppLocalizations>().learnSkinAnswers1_5,
      ]
    },
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion2,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers2_1,
        getIt<AppLocalizations>().learnSkinAnswers2_2,
        getIt<AppLocalizations>().learnSkinAnswers2_3,
        getIt<AppLocalizations>().learnSkinAnswers2_4,
        getIt<AppLocalizations>().learnSkinAnswers2_5,
      ]
    },
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion3,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers3_1,
        getIt<AppLocalizations>().learnSkinAnswers3_2,
        getIt<AppLocalizations>().learnSkinAnswers3_3,
        getIt<AppLocalizations>().learnSkinAnswers3_4,
        getIt<AppLocalizations>().learnSkinAnswers3_5,
      ]
    },
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion4,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers4_1,
        getIt<AppLocalizations>().learnSkinAnswers4_2,
        getIt<AppLocalizations>().learnSkinAnswers4_3,
        getIt<AppLocalizations>().learnSkinAnswers4_4,
        getIt<AppLocalizations>().learnSkinAnswers4_5,
      ]
    },
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion5,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers5_1,
        getIt<AppLocalizations>().learnSkinAnswers5_2,
        getIt<AppLocalizations>().learnSkinAnswers5_3,
        getIt<AppLocalizations>().learnSkinAnswers5_4,
        getIt<AppLocalizations>().learnSkinAnswers5_5,
      ]
    },
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion6,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers6_1,
        getIt<AppLocalizations>().learnSkinAnswers6_2,
        getIt<AppLocalizations>().learnSkinAnswers6_3,
        getIt<AppLocalizations>().learnSkinAnswers6_4,
        getIt<AppLocalizations>().learnSkinAnswers6_5,
      ]
    },
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion7,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers7_1,
        getIt<AppLocalizations>().learnSkinAnswers7_2,
        getIt<AppLocalizations>().learnSkinAnswers7_3,
        getIt<AppLocalizations>().learnSkinAnswers7_4,
        getIt<AppLocalizations>().learnSkinAnswers7_5,
      ]
    },
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion8,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers8_1,
        getIt<AppLocalizations>().learnSkinAnswers8_2,
        getIt<AppLocalizations>().learnSkinAnswers8_3,
        getIt<AppLocalizations>().learnSkinAnswers8_4,
        getIt<AppLocalizations>().learnSkinAnswers8_5,
      ]
    },
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion9,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers9_1,
        getIt<AppLocalizations>().learnSkinAnswers9_2,
        getIt<AppLocalizations>().learnSkinAnswers9_3,
        getIt<AppLocalizations>().learnSkinAnswers9_4,
        getIt<AppLocalizations>().learnSkinAnswers9_5,
      ]
    },
    {
      "question": getIt<AppLocalizations>().learnSkinQuestion10,
      "answers": [
        getIt<AppLocalizations>().learnSkinAnswers10_1,
        getIt<AppLocalizations>().learnSkinAnswers10_2,
        getIt<AppLocalizations>().learnSkinAnswers10_3,
        getIt<AppLocalizations>().learnSkinAnswers10_4,
        getIt<AppLocalizations>().learnSkinAnswers10_5,
      ]
    },
  ];
}
