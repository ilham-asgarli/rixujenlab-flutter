import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/di/injectable.dart';
import '../../../features/cover/views/cover_view.dart';
import '../../../features/main/features/dictionary/features/search-history/features/search-ingredients/features/search-ingredient-details/views/search_ingredient_details_view.dart';
import '../../../features/main/features/dictionary/features/search-history/features/search-ingredients/views/serach_ingredients_view.dart';
import '../../../features/main/features/dictionary/features/search-history/views/search_history_view.dart';
import '../../../features/main/features/dictionary/features/search/views/search_view.dart';
import '../../../features/main/features/dictionary/views/dictionary_view.dart';
import '../../../features/main/features/learn-type/features/my-type/views/my_type_view.dart';
import '../../../features/main/features/learn-type/views/learn_type_view.dart';
import '../../../features/main/features/routines/views/routines_view.dart';
import '../../../features/main/features/test-results/views/test_results_view.dart';
import '../../../features/main/features/tips/features/more-tips/views/more_tips_view.dart';
import '../../../features/main/features/tips/views/tips_view.dart';
import '../../../features/main/views/main_view.dart';
import '../../../features/sign-in/views/sign_in_view.dart';
import '../../../features/sign-up/views/sign_up_view.dart';
import '../../constants/enums/app_enum.dart';
import '../../constants/router/router_constants.dart';

part 'config_router.g.dart';

@TypedGoRoute<MainViewRoute>(
  path: RouterConstants.home,
  routes: [
    TypedGoRoute<DictionaryViewRoute>(
      path: RouterConstants.dictionary,
      routes: [
        TypedGoRoute<SearchViewRoute>(
          path: RouterConstants.search,
        ),
        TypedGoRoute<SearchHistoryViewRoute>(
          path: RouterConstants.searchHistory,
          routes: [
            TypedGoRoute<SearchIngredientsViewRoute>(
              path: RouterConstants.searchIngredients,
              routes: [
                TypedGoRoute<SearchIngredientDetailsViewRoute>(
                  path: RouterConstants.searchIngredientDetails,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedGoRoute<LearnTypeViewRoute>(
      path: RouterConstants.learnType,
      routes: [
        TypedGoRoute<MyTypeViewRoute>(
          path: RouterConstants.myType,
        ),
      ],
    ),
    TypedGoRoute<RoutinesViewRoute>(
      path: RouterConstants.routines,
    ),
    TypedGoRoute<TipsViewRoute>(
      path: RouterConstants.tips,
      routes: [
        TypedGoRoute<MoreTipsViewRoute>(
          path: RouterConstants.moreTips,
        ),
      ],
    ),
    TypedGoRoute<TestResultsViewRoute>(
      path: RouterConstants.testResults,
    ),
  ],
)
@immutable
class MainViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MainView(
      mainViewModel: getIt(),
    );
  }
}

@TypedGoRoute<CoverViewRoute>(
  path: RouterConstants.cover,
)
@immutable
class CoverViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CoverView(
      coverViewModel: getIt(),
    );
  }
}

@TypedGoRoute<SignInViewRoute>(
  path: RouterConstants.signIn,
)
@immutable
class SignInViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignInView(
      signInViewModel: getIt(),
    );
  }
}

@TypedGoRoute<SignUpViewRoute>(
  path: RouterConstants.signUp,
)
@immutable
class SignUpViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignUpView(
      signUpViewModel: getIt(),
    );
  }
}

@immutable
class DictionaryViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DictionaryView(
      dictionaryViewModel: getIt(),
    );
  }
}

@immutable
class LearnTypeViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LearnTypeView(
      learnTypeViewModel: getIt(),
    );
  }
}

@immutable
class RoutinesViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RoutinesView(
      routinesViewModel: getIt(),
    );
  }
}

@immutable
class TipsViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TipsView(
      tipsViewModel: getIt(),
    );
  }
}

@immutable
class MoreTipsViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MoreTipsView(
      moreTipsViewModel: getIt(),
    );
  }
}

@immutable
class MyTypeViewRoute extends GoRouteData {
  final MyType myType;

  const MyTypeViewRoute({
    required this.myType,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MyTypeView(
      myTypeViewModel: getIt(),
      myType: myType,
    );
  }
}

@immutable
class SearchViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchView(
      searchViewModel: getIt(),
    );
  }
}

@immutable
class TestResultsViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TestResults(
      testResultsViewModel: getIt(),
    );
  }
}

@immutable
class SearchHistoryViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchHistoryView(
      searchHistoryViewModel: getIt(),
    );
  }
}

@immutable
class SearchIngredientsViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchIngredientsView(
      searchIngredientsViewModel: getIt(),
    );
  }
}

@immutable
class SearchIngredientDetailsViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchIngredientDetailsView(
      searchIngredientDetailsViewModel: getIt(),
    );
  }
}
