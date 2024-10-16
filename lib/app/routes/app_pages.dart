import 'package:praktikum_mod_1/app/login/bindings/login_binding.dart';
import 'package:praktikum_mod_1/app/login/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:praktikum_mod_1/app/login/views/login_view.dart';
import 'package:praktikum_mod_1/app/recipeView/bindings/http_binding.dart';
import 'package:praktikum_mod_1/app/recipeView/views/http_view.dart';
import 'package:praktikum_mod_1/app/recipeView/views/recipe_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(name: _Paths.LOGIN, page: () => LoginView()),
    GetPage(name: _Paths.HTTP, page: () => HttpView(), binding: HttpBinding()),
  ];
}
