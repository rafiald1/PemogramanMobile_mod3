import 'package:get/get.dart';
import 'package:praktikum_mod_1/app/home/bindings/crud_binding.dart';
import 'package:praktikum_mod_1/app/home/bindings/home_binding.dart';
import 'package:praktikum_mod_1/app/home/views/crud_view.dart';
import 'package:praktikum_mod_1/app/home/views/home_view.dart';
import 'package:praktikum_mod_1/app/modules/login/bindings/auth_binding.dart';
import 'package:praktikum_mod_1/app/modules/login/views/register_view.dart';
import 'package:praktikum_mod_1/app/recipeView/bindings/http_binding.dart';
import 'package:praktikum_mod_1/app/recipeView/views/http_view.dart';
import 'package:praktikum_mod_1/app/recipeView/views/recipe_view.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HTTP,
      page: () => HttpView(),
      binding: HttpBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.CRUD,
      page: () => CrudView(),
      binding: CrudBinding(),
    ),
  ];
}
