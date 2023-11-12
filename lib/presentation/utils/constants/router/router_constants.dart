/*
If the route contains slashes, then it is treated as a "deep link",
and before this route is pushed, the routes leading to this one are pushed also.
For example, if the route was /a/b/c, then the app would start with
the three routes /a, /a/b, and /a/b/c loaded, in that order.
 */

abstract class RouterConstants {
  static const notFound = "/404";
  static const cover = "/cover";
  static const home = "/";
  static const signIn = "/signIn";
  static const signUp = "/signUp";
  static const dictionary = "dictionary";
  static const learnType = "learnType";
  static const routines = "routines";
  static const tips = "tips";
  static const myType = "myType";
  static const moreTips = "moreTips";
  static const search = "search";
  static const testResults = "testResults";
  static const searchHistory = "searchHistory";
  static const searchIngredients = "searchIngredients";
  static const searchIngredientDetails = "searchIngredientDetails";
}
