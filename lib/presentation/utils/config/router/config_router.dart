import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/di/injectable.dart';
import '../../../features/main/features/dictionary/views/dictionary_view.dart';
import '../../../features/main/features/learn-type/features/my-type/views/my_type_view.dart';
import '../../../features/main/features/learn-type/views/learn_type_view.dart';
import '../../../features/main/features/routines/views/routines_view.dart';
import '../../../features/main/features/tips/features/more-tips/views/more_tips_view.dart';
import '../../../features/main/features/tips/views/tips_view.dart';
import '../../../features/main/views/main_view.dart';
import '../../../features/sign-in/views/sign_in_view.dart';
import '../../../features/sign-up/views/sign_up_view.dart';
import '../../constants/router/router_constants.dart';

part 'config_router.g.dart';

@TypedGoRoute<MainViewRoute>(
  path: RouterConstants.home,
  routes: [
    TypedGoRoute<DictionaryViewRoute>(
      path: RouterConstants.dictionary,
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
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MyTypeView(
      myTypeView: getIt(),
    );
  }
}
